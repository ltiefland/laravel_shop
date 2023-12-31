<?php

    if ( !class_exists( 'JSMin' ) )
    {
        include_once( implode( DIRECTORY_SEPARATOR, array(
            dirname( __FILE__ ),
            'jsmin.php',
        ) ) );
    }
    if ( !class_exists( 'Minify_CSS' ) )
    {
        include_once( implode( DIRECTORY_SEPARATOR, array(
            dirname( __FILE__ ),
            'cssmin.php',
        ) ) );
    }

    /*
     *   An earlier experiment contained a real framework for tag
     *   and parser registration. In the end, this turned out
     *   to be much too complex if we just need to support two tags
     *   for two types of resources.
     */

    class sacy_FileExtractor
    {
        private $_cfg;

        function __construct( sacy_Config $config )
        {
            $this->_cfg = $config;
        }

        function extractFile( $tag, $attrdata, $content )
        {
            switch ( $tag )
            {
                case 'link':
                    $fn = 'extract_css_file';
                    break;
                case 'script':
                    $fn = 'extract_js_file';
                    break;
                default:
                    throw new sacy_Exception( "Cannot handle tag: $tag" );
            }
            return $this->$fn( $attrdata, $content );
        }

        private function urlToFile( $ref )
        {
            $u = parse_url( $ref );
            if ( $u === false )
            {
                return false;
            }
            if ( isset( $u['host'] ) || isset( $u['scheme'] ) )
            {
                return false;
            }

            if ( $this->_cfg->get( 'query_strings' ) == 'ignore' )
            {
                if ( isset( $u['query'] ) )
                {
                    return false;
                }
            }

            $ref = $u['path'];
            $path = array( $_SERVER['DOCUMENT_ROOT'] );
            if ( $ref[0] != '/' )
            {
                $path[] = $_SERVER['PHP_SELF'];
            }
            $path[] = $ref;
            return realpath( implode( DIRECTORY_SEPARATOR, $path ) );

        }


        private function extract_css_file( $attrdata, $content )
        {
            // if any of these conditions are met, this handler will decline
            // handling the tag:
            //
            //  - the tag contains content (invalid markup)
            //  - the tag uses any rel beside 'stylesheet' (valid, but not supported)
            //  - the tag uses any type besides text/css (would maybe still work, but I can't be sure)
            $attrs = sacy_extract_attrs( $attrdata );
            if ( empty( $content ) && ( strtolower( $attrs['rel'] ) == 'stylesheet' ) && ( !isset( $attrs['type'] ) || strtolower( $attrs['type'] ) == 'text/css' ) )
            {
                if ( !isset( $attrs['media'] ) )
                {
                    $attrs['media'] = "";
                }

                $path = $this->urlToFile( $attrs['href'] );
                if ( $path === false )
                {
                    return false;
                }

                return array(
                    $attrs['media'],
                    $path,
                );
            }
            return false;
        }

        private function extract_js_file( $attrdata, $content )
        {
            // don't handle non-empty tags
            if ( preg_match( '#\S+#', $content ) )
            {
                return false;
            }

            $attrs = sacy_extract_attrs( $attrdata );

            if ( ( $attrs['type'] == 'text/javascript' || $attrs['type'] == 'application/javascript' ) && ( isset( $attrs['src'] ) && !empty( $attrs['src'] ) ) )
            {

                $path = $this->urlToFile( $attrs['src'] );
                if ( $path === false )
                {
                    return false;
                }
                return array(
                    '',
                    $path,
                );
            }
            return false;
        }

    }

    class sacy_Config
    {
        private $params;

        public function get( $key )
        {
            return $this->params[ $key ];
        }

        public function __construct( $params = null )
        {
            $this->params['query_strings'] = 'ignore';
            $this->params['write_headers'] = true;
            $this->params['debug_toggle'] = '_sacy_debug';
            if ( is_array( $params ) )
            {
                $this->setParams( $params );
            }
        }

        public function getDebugMode()
        {
            if ( $this->params['debug_toggle'] === false )
            {
                return 0;
            }
            if ( isset( $_GET[ $this->params['debug_toggle'] ] ) )
            {
                return intval( $_GET[ $this->params['debug_toggle'] ] );
            }
            if ( isset( $_COOKIE[ $this->params['debug_toggle'] ] ) )
            {
                return intval( $_COOKIE[ $this->params['debug_toggle'] ] );
            }
            return 0;

        }

        public function setParams( $params )
        {
            foreach ( $params as $key => $value )
            {
                if (
                    !in_array( $key, array(
                        'query_strings',
                        'write_headers',
                        'debug_toggle',
                    ) )
                )
                {
                    throw new sacy_Exception( "Invalid option: $key" );
                }
            }
            if (
                isset( $params['query_strings'] ) && !in_array( $params['query_strings'], array(
                    'force-handle',
                    'ignore',
                ) )
            )
            {
                throw new sacy_Exception( "Invalid setting for query_strings: " . $params['query_strings'] );
            }
            if (
                isset( $params['write_headers'] ) && !in_array( $params['write_headers'], array(
                    true,
                    false,
                ), true )
            )
            {
                throw new sacy_Exception( "Invalid setting for write_headers: " . $params['write_headers'] );
            }


            $this->params = array_merge( $this->params, $params );
        }

    }

    class sacy_CacheRenderer
    {
        private $_smarty;
        private $_cfg;

        function __construct( sacy_Config $config, $smarty )
        {
            $this->_smarty = $smarty;
            $this->_cfg = $config;
        }

        function renderFiles( $tag, $cat, $files )
        {
            switch ( $tag )
            {
                case 'link':
                    $fn = 'render_css_files';
                    break;
                case 'script':
                    $fn = 'render_js_files';
                    break;
                default:
                    throw new sacy_Exception( "Cannot handle tag: $tag" );
            }
            return $this->$fn( $files, $cat );
        }


        private function render_css_files( $files, $cat )
        {
            $ref = sacy_generate_cache( $this->_smarty, $files, new sacy_CssRenderHandler( $this->_cfg, $this->_smarty ) );
            if ( !$ref )
            {
                return false;
            }
            $cs = $cat ? sprintf( ' media="%s"', htmlspecialchars( $cat, ENT_QUOTES ) ) : '';
            return sprintf( '<link rel="stylesheet" type="text/css"%s href="%s" />' . "\n", $cs, htmlspecialchars( $ref, ENT_QUOTES ) );

        }

        private function render_js_files( $files, $cat )
        {
            $ref = sacy_generate_cache( $this->_smarty, $files, new sacy_JavascriptRenderHandler( $this->_cfg, $this->_smarty ) );
            if ( !$ref )
            {
                return false;
            }
            return sprintf( '<script type="text/javascript" src="%s"></script>' . "\n", htmlspecialchars( $ref, ENT_QUOTES ) );
        }
    }

    interface sacy_CacheRenderHandler
    {
        function __construct( sacy_Config $cfg, $smarty );

        function getFileExtension();

        function writeHeader( $fh, $files );

        function processFile( $fh, $filename );

        function getConfig();
    }

    abstract class sacy_ConfiguredRenderHandler implements sacy_CacheRenderHandler
    {
        private $_smarty;
        private $_cfg;

        function __construct( sacy_Config $cfg, $smarty )
        {
            $this->_smarty = $smarty;
            $this->_cfg = $cfg;
        }

        protected function getSmarty()
        {
            return $this->_smarty;
        }

        public function getConfig()
        {
            return $this->_cfg;
        }

    }

    class sacy_JavaScriptRenderHandler extends sacy_ConfiguredRenderHandler
    {

        function getFileExtension()
        {
            return '.js';
        }

        function writeHeader( $fh, $files )
        {
            fwrite( $fh, "/*\nsacy javascript cache dump \n\n" );
            fwrite( $fh, "This dump has been created from the following files:\n" );
            foreach ( $files as $file )
            {
                fprintf( $fh, "    - %s\n", str_replace( $_SERVER['DOCUMENT_ROOT'], '<root>', $file ) );
            }
            fwrite( $fh, "*/\n\n" );
        }

        function processFile( $fh, $filename )
        {
            if ( $this->getConfig()->get( 'write_headers' ) )
            {
                fprintf( $fh, "\n/* %s */\n", str_replace( $_SERVER['DOCUMENT_ROOT'], '<root>', $filename ) );
            }
            $js = @file_get_contents( $filename );
            if ( $js == false )
            {
                fwrite( $fhc, "/* <Error accessing file> */\n" );
                $this->getSmarty()->trigger_error( "Error accessing JavaScript-File: $filename" );
                return;
            }
            fwrite( $fh, JSMin::minify( $js ) );
        }

    }

    class sacy_CssRenderHandler extends sacy_ConfiguredRenderHandler
    {
        function getFileExtension()
        {
            return '.css';
        }

        function writeHeader( $fh, $files )
        {
            fwrite( $fh, "/*\nsacy css cache dump \n\n" );
            fwrite( $fh, "This dump has been created from the following files:\n" );
            foreach ( $files as $file )
            {
                fprintf( $fh, "    - %s\n", str_replace( $_SERVER['DOCUMENT_ROOT'], '<root>', $file ) );
            }
            fwrite( $fh, "*/\n\n" );
        }

        function processFile( $fh, $filename )
        {
            if ( $this->getConfig()->get( 'write_headers' ) )
            {
                fprintf( $fh, "\n/* %s */\n", str_replace( $_SERVER['DOCUMENT_ROOT'], '<root>', $filename ) );
            }
            $css = @file_get_contents( $filename ); //maybe stream this later to save memory?
            if ( $css == false )
            {
                fwrite( $fh, "/* <Error accessing file> */\n" );
                $this->getSmarty()->trigger_error( "Error accessing CSS-File: $filename" );
                return;
            }
            fwrite( $fh, Minify_CSS::minify( $css, array(
                'currentDir' => dirname( $filename ),
            ) ) );
        }
    }

    class sacy_Exception extends Exception
    {
    }

    function sacy_extract_attrs( $attstr )
    {
        $attextract = '#([a-z]+)\s*=\s*(["\'])\s*(.*?)\s*\2#';
        $res = array();
        if ( !preg_match_all( $attextract, $attstr, $m ) )
        {
            return false;
        }
        $res = array();
        foreach ( $m[1] as $idx => $name )
        {
            $res[ strtolower( $name ) ] = $m[3][ $idx ];
        }
        return $res;

    }

    function sacy_generate_cache( &$smarty, $files, sacy_CacheRenderHandler $rh )
    {
        $GLOBALS["rh"] = $rh;
        if ( !is_dir( ASSET_COMPILE_OUTPUT_DIR ) )
        {
            mkdir( ASSET_COMPILE_OUTPUT_DIR );
        }


        $f = function ( $f )
        {
            return basename( $f, $GLOBALS["rh"]->getFileExtension() );
        };
        $ident = implode( '-', array_map( $f, $files ) );
        if ( strlen( $ident ) > 120 )
        {
            $ident = 'many-files-' . md5( $ident );
        }
        $max = 0;
        foreach ( $files as $f )
        {
            $max = max( $max, filemtime( $f ) );
        }
        // not using the actual content for quicker access
        $key = md5( $max . serialize( $files ) );
        @mkdir( ASSET_COMPILE_OUTPUT_DIR, 0755, true );
        $cfile = ASSET_COMPILE_OUTPUT_DIR . DIRECTORY_SEPARATOR . "$ident-$key" . $rh->getFileExtension();
        $pub = ASSET_COMPILE_URL_ROOT . "/$ident-$key" . $rh->getFileExtension();

        if ( file_exists( $cfile ) && ( $rh->getConfig()->getDebugMode() != 2 ) )
        {
            return $pub;
        }

        if ( !sacy_write_cache( $smarty, $cfile, $files, $rh ) )
        {
            return false;
        }

        return $pub;
    }

    function sacy_write_cache( &$smarty, $cfile, $files, sacy_CacheRenderHandler $rh )
    {
        $lockfile = $cfile . ".lock";
        $fhl = @fopen( $lockfile, 'w' );
        if ( !$fhl )
        {
            $smarty->trigger_error( "Cannot create cache-lockfile: $lockfile" );
            return false;
        }
        $wb = false;
        if ( !@flock( $fhl, LOCK_EX | LOCK_NB, $wb ) )
        {
            $smarty->trigger_error( "Canot lock cache-lockfile: $lockfile" );
            return false;
        }
        if ( $wb )
        {
            // another process is writing the cache. Let's just return false
            // the caller will leave the CSS unaltered
            return false;
        }
        $fhc = @fopen( $cfile, 'w' );
        if ( !$fhc )
        {
            $smarty->trigger_error( "Cannot open cache file: $cfile" );
            fclose( $fhl );
            unlink( $lockfile );
            return false;
        }
        if ( $rh->getConfig()->get( 'write_headers' ) )
        {
            $rh->writeHeader( $fhc, $files );
        }

        foreach ( $files as $file )
        {
            $rh->processFile( $fhc, $file );
        }

        fclose( $fhc );
        fclose( $fhl );
        unlink( $lockfile );
        return true;
    }






<?php

    use App\Http\Controllers\BasketController;
    use GuzzleHttp\Client;
    use GuzzleHttp\Exception\GuzzleException;
    use PHPHtmlParser\Dom;
    use PHPHtmlParser\Exceptions\ChildNotFoundException;
    use PHPHtmlParser\Exceptions\CircularException;
    use PHPHtmlParser\Exceptions\CurlException;
    use PHPHtmlParser\Exceptions\NotLoadedException;
    use PHPHtmlParser\Exceptions\StrictException;

    $GLOBALS["zahlsysteme"] = [
        "kreditkarte",
        "paypal",
        "sofortueberweisung",
        "frei",
        "finanzierung",
        "billsafe",
        "billsafe_hire",
        "amazon",
        "PayPalExpress",
        "Ratenzahlung",
        "PayPalPlus",
        "paymill",
        "klarna",
        "paydirekt",
        "payever",
        "billie",
        "easycredit",
        "crefopay",
        "crefopayKK",
        "PayPalCheckout",
    ];

    function getConfig()
    {
        if ( !defined( "__SITE__" ) )
        {
            define( '__SITE__', env( 'site' ) );
        }
        if ( !defined( "__SHOP__" ) )
        {
            define( '__SHOP__', env( 'shop' ) );
        }
        if ( !defined( "__CFG_PATH__" ) )
        {
            define( "__CFG_PATH__", "/etc/shop_configs/" . __SITE__ . "/" . __SHOP__ );
        }
        $cfg_file = __CFG_PATH__ . "/config.de.xml";
        if ( !file_exists( $cfg_file ) )
        {
            trigger_error( "Konnte keine Konfigurationsdatei für das Shopsystem " . __SITE__ . " -> " . __SHOP__ . " finden (" . ( $cfg_file ) . ")!", E_USER_ERROR );
        }
        $xml = simplexml_load_file( $cfg_file, "SimpleXMLElement", LIBXML_NOCDATA );
        $ini = json_decode( json_encode( $xml ), true );
        foreach ( $ini as $key => $wert )
        {
            if ( $wert == array() )
            {
                $ini[$key] = "";
            }
            elseif ( is_array( $wert ) )
            {
                foreach ( $wert as $key2 => $wert2 )
                {
                    if ( $wert2 == array() )
                    {
                        $ini[$key][$key2] = "";
                    }
                }
            }
        }

        $v_file = __CFG_PATH__ . "/versand.xml";
        if ( file_exists( $v_file ) )
        {
            $xml = simplexml_load_file( $v_file, "SimpleXMLElement", LIBXML_NOCDATA );
            $ini["shipping"] = json_decode( json_encode( $xml ), true );
            foreach ( $ini["shipping"] as $key => $wert )
            {
                if ( $wert == array() )
                {
                    $ini["shipping"][$key] = "";
                }
                elseif ( is_array( $wert ) )
                {
                    foreach ( $wert as $key2 => $wert2 )
                    {
                        if ( $wert2 == array() )
                        {
                            $ini["shipping"][$key][$key2] = "";
                        }
                    }
                }
            }
        }
        return $ini;
    }

    /**
     * Load Content form Typo3
     *
     * @param $url
     * @return array
     */
    function parseCMSPage( $url ): array
    {
        $menu = "";
        $content = "";
        $dom = new Dom;
        try
        {
            $dom->loadFromUrl( $url );
            $menu = $dom->getElementById( 'menu' )->innerHtml;
            $menu = str_replace( "/typo3", "/cms", $menu );
            $content = $dom->getElementById( 'content' )->innerHtml;
            $content = str_replace( "fileadmin/", $GLOBALS["INI"]["typo3"]["url"] . "/typo3/fileadmin/", $content );
            $content = str_replace( "ce-textpic", "", $content );
        }
        catch ( ChildNotFoundException|CircularException|CurlException|StrictException|NotLoadedException )
        {
        }
        return array( "menu" => $menu, "content" => $content, );
    }

    if ( isset( $_GET["killSession"] ) )
    {
        unset( $_SESSION );
        $_SESSION["SHOP"]["BASKET"] = new BasketController();
    }

    function getRechnungsLaender(): array
    {
        $arr = array();
        $client = new Client();
        try
        {
            $url = config( "api.url" ) . "countries/";
            $response = $client->request( "get", $url, [
                'headers' => [
                    'Authorization' => 'Bearer ' . config( "api.key" ),
                    "Content-Type"  => "application/json",
                    "Accept"        => "application/json",
                ]
            ] )->getBody()->getContents();
            $laender = json_decode( $response )->data;
            foreach ( $laender as $land )
            {
                $arr[$land->id] = $land->name;
            }
            return $arr;
        }
        catch ( GuzzleException $e )
        {
            abort( $e->getCode() );
        }
    }

    function getLand( int $landId )
    {
        $client = new Client();
        try
        {
            $url = config( "api.url" ) . "countries/" . $landId;
            $response = $client->request( "get", $url, [
                'headers' => [
                    'Authorization' => 'Bearer ' . config( "api.key" ),
                    "Content-Type"  => "application/json",
                    "Accept"        => "application/json",
                ]
            ] )->getBody()->getContents();
            $land = json_decode( $response )->data;
            return $land->name;
        }
        catch ( GuzzleException $e )
        {
            abort( $e->getCode() );
        }
    }

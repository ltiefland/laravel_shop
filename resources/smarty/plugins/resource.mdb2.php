<?php
    /*
    * Smarty plugin 
    * ------------------------------------------------------------- 
    * File:     resource.db.php 
    * Type:     resource 
    * Name:     db 
    * Purpose:  Fetches templates from a database 
    * ------------------------------------------------------------- 
    */
    // register the resource name "db"
    $this->register_resource( "db", array(
        "smarty_resource_mdb2_source",
        "smarty_resource_mdb2_timestamp",
        "smarty_resource_mdb2_secure",
        "smarty_resource_mdb2_trusted",
        ) );
    function smarty_resource_mdb2_source( $tpl_name, &$tpl_source, $smarty )
    {
        // do database call here to fetch your template,
        // populating $tpl_source
        list( $shops_ID, $id ) = explode( "_", $tpl_name );
        if ( $_SESSION["INI"] )
        {
            $dbase = $_SESSION["INI"]["dbConnect"]["order_db"];
        }
        else
        {
            $dbase = $GLOBALS["INI"]["dbConnect"]["order_db"];
        }
        if ( $dbase )
        {
            $dbase .= ".";
        }
        $settings_table = $dbase . "web_settings";
        $bestellarten = getBestellartenMDB2Smarty();
        $sql = "
            SELECT 
                * 
            FROM 
                $settings_table
            WHERE 
                ID=$id 
            AND 
                shops_ID=$shops_ID
        ";
        if ( $bestellarten )
        {
            $sql .= "
                AND 
                    bestellart_id=1
            ";
        }
        if ( $GLOBALS["order_db"] )
        {
            $result = $GLOBALS["order_db"]->query( $sql );
        }
        else
        {
            $result = $GLOBALS["db"]->query( $sql );
        }
        if ( $result->numRows() )
        {
            $array = $result->FetchRow();
            $tpl_source = stripslashes( $array['Inhalt'] );
            return true;
        }
        else
        {
            return false;
        }
    }

    function smarty_resource_mdb2_timestamp( $tpl_name, &$tpl_timestamp, $smarty )
    {
        // do database call here to populate $tpl_timestamp.
        /*$result=requete_SQL("select * from smarty_test where title='$tpl_name'");
        if (mysql_num_rows($result)) { 
        $array=mysql_fetch_array($result); 
        $tpl_timestamp=$array['timestamp']; 
        return true; 
        } else { 
        return false; 
        } */
        $tpl_timestamp = time();
        return true;
    }

    function smarty_resource_mdb2_secure( $tpl_name, $smarty )
    {
        // assume all templates are secure
        return true;
    }

    function smarty_resource_mdb2_trusted( $tpl_name, $smarty )
    {
        // not used for templates
    }

    function getBestellartenMDB2Smarty()
    {
        if ( $_SESSION["INI"] )
        {
            $dbase = $_SESSION["INI"]["dbConnect"]["order_db"];
        }
        else
        {
            $dbase = $GLOBALS["INI"]["dbConnect"]["order_db"];
        }
        if ( $dbase )
        {
            $dbase .= ".";
        }
        $art_table = $dbase . "bestellart";
        $settings_table = $dbase . "web_settings";
        $sql = "SELECT * FROM bestellart";
        if ( $GLOBALS["order_db"] )
        {
            $result = $GLOBALS["order_db"]->query( $sql );
        }
        else
        {
            $result = $GLOBALS["db"]->query( $sql );
        }

        if ( !PEAR::isError( $result ) )
        {
            $sql = "SHOW FIELDS FROM web_settings LIKE 'bestellart_id'";
            if ( $GLOBALS["order_db"] )
            {
                $result = $GLOBALS["order_db"]->query( $sql );
            }
            else
            {
                $result = $GLOBALS["db"]->query( $sql );
            }
            $test = ( $result->NumRows() );
            /*if ( array_search( 'bestellart_id', $test ) )
            {
            $bestellart = true;
            define( "BESTELLART", true );
            }
            else
            {
            $bestellart = false;
            define( "BESTELLART", false );
            }*/
            return ( bool )$test;
        }
        else
        {
            echo $result->getUserInfo();
        }
        return false;
    }
?>

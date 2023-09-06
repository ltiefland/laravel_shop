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
        "smarty_resource_db_source",
        "smarty_resource_db_timestamp",
        "smarty_resource_db_secure",
        "smarty_resource_db_trusted",
        ) );
    function smarty_resource_db_source( $tpl_name, &$tpl_source, $smarty )
    {
        // do database call here to fetch your template,
        // populating $tpl_source
        list( $shops_ID, $id ) = explode( "_", $tpl_name );
        $bestellarten = getBestellartenSmarty();
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
        if ( $GLOBALS["order_dbh"] )
        {
            $result = mysql_query( $sql, $GLOBALS["order_dbh"] );
        }
        else
        {
            $result = mysql_query( $sql );
        }
        if ( mysql_num_rows( $result ) )
        {
            $array = mysql_fetch_assoc( $result );
            $tpl_source = stripslashes( $array['Inhalt'] );
            return true;
        }
        else
        {
            return false;
        }
    }

    function smarty_resource_db_timestamp( $tpl_name, &$tpl_timestamp, $smarty )
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

    function smarty_resource_db_secure( $tpl_name, $smarty )
    {
        // assume all templates are secure
        return true;
    }

    function smarty_resource_db_trusted( $tpl_name, $smarty )
    {
        // not used for templates
    }

    function getBestellartenSmarty()
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
        $sql = "SELECT * FROM $art_table";
        if ( $GLOBALS["order_dbh"] )
        {
            $result = mysql_query( $sql, $GLOBALS["order_dbh"] );
        }
        else
        {
            $result = mysql_query( $sql );
        }

        if ( $result )
        {
            $sql = "SHOW FIELDS FROM $settings_table LIKE 'bestellart_id'";
            if ( $GLOBALS["order_dbh"] )
            {
                $result = mysql_query( $sql, $GLOBALS["order_dbh"] );
            }
            else
            {
                $result = mysql_query( $sql );
            }
            $test = ( mysql_num_rows( $result ) );
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
        return false;
    }
?>

<?php
    /*
    * Smarty plugin
    *
    -------------------------------------------------------------
    * File:     modifier.number_format.php
    * Type:     modifier
    * Name:     number_format
    * Version:  1.0
    * Date:     May 1st, 2002
    * Purpose:  pass value to PHP number_format() and return result
    * Install:  Drop into the plugin directory.
    * Author:   Jason E. Sweat <jsweat_php@yahoo.com>
    *
    -------------------------------------------------------------
    */
    function smarty_modifier_number_format_locale( $string, $places = 2 )
    {
        if ( !isset( $_SESSION["locale"] ) )
        {
            $_SESSION["locale"] = "de_DE";
        }
        switch ( $_SESSION["locale"] )
        {
            case "de_DE":
                $dpoint = ",";
                $thousand = ".";
                break;
            case "en_US":
            default:
                $dpoint = ".";
                $thousand = ",";
                break;
        }
        return number_format( $string, $places, $dpoint, $thousand );
    }

    /* vim: set expandtab: */
?>

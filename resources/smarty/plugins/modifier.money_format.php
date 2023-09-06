<?php
    /*
    * Smarty plugin
    *
    -------------------------------------------------------------
    * File:     modifier.money_format.php
    * Type:     modifier
    * Name:     money_format
    * Version:  1.0
    * Date:     Feb 8th, 2003
    * Purpose:  pass value to PHP money_format() and return result
    * Install:  Drop into the plugin directory.
    * Author:   Michael L. Fladischer <mfladischer@abis.co.at>
    *
    -------------------------------------------------------------
    */
    function smarty_modifier_money_format( $string, $places = 2 )
    {
        if ( !isset( $_SESSION["locale"] ) )
        {
            $_SESSION["locale"] = "de_DE";
        }
        setlocale( LC_MONETARY, $_SESSION["locale"] );
        if ( phpversion() >= "7.0" )
        {
            $fmt = new \NumberFormatter( $_SESSION["locale"], NumberFormatter::CURRENCY );
            $erg = $fmt->formatCurrency( $string, "EUR" );
        }
        else
        {
            $erg = money_format( "%.{$places}i", $string );
        }
        return $erg;
    }

    /* vim: set expandtab: */

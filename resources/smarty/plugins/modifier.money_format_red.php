<?php
    /*
    * Smarty plugin
    *
    -------------------------------------------------------------
    * File:     modifier.money_format.php
    * Type:     modifier
    * Name:     money_format
    * Version:  1.1
    * Date:     Oct 12th, 2022
    * Purpose:  pass value to PHP money_format() and return result
    * Install:  Drop into the plugin directory.
    * Author:   Michael L. Fladischer <mfladischer@abis.co.at>
    * Author:   Lars Tiefland Weban UG <l.tiefland@webn.de>
    *
    -------------------------------------------------------------
    */
    function smarty_modifier_money_format_red( $string, $places = 2, $locale = "de_DE", $onlySymbol = false, $incSymbol = true, $shortSymbol = false )
    {
        if ( !$locale )
        {
            $locale = "de_DE.UTF-8";
        }

        $fmt = new NumberFormatter( $locale, NumberFormatter::CURRENCY );
        if ( $incSymbol === false )
        {
            $fmt->setPattern( "#,##0.00" );
        }
        if ( $shortSymbol === false )
        {
            //$fmt->setSymbol( NumberFormatter::CURRENCY_SYMBOL, NumberFormatter::CURRENCY_CODE );
        }
        $fmt->setAttribute( NumberFormatter::FRACTION_DIGITS, $places );
        return $fmt->format( $string );
    }

    /* vim: set expandtab: */
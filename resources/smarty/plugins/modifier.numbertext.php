<?php
    /*
    * Smarty plugin
    * --------------------------------------------------------------------------
    * File:     modifier.numbertext.php
    * Type:     modifier
    * Name:     numbertext
    * Version:  1.01
    * Date:     April 21, 2002
    * Purpose:  Outputs alternative text to numeric variables.
    *           Example:
    *           {$number_of_records|numbertext:"no records":"one record":"%d records"}
    *           If $number_of_records==0 it outputs 'no records'
    *           If $number_of_records==1 it outputs 'one record'
    *           If $number_of_records==34 it outputs '34 records'
    * Install:  Drop into the plugin directory.
    * Author:   Andreas Heintze <andreas.heintze@home.se>
    * --------------------------------------------------------------------------
    */

    function smarty_modifier_numbertext()
    {
        $alt_array = func_get_args();
        if ( is_numeric($value = $index = $alt_array[0]) )
        {
            $index++;
            $n = count( $alt_array ) - 1;
            $index = $index > $n ? $n : $index;
            $index = $index < 1 ? 1 : $index;
            return str_replace( "%d", $value, $alt_array[$index] );
        }
        else
        {
            return $index;
        }
    }

?>
<?php
    /**
     * Smarty plugin
     * @package Smarty
     * @subpackage plugins
     */


    /**
     * Smarty escape modifier plugin
     *
     * Type:     modifier<br>
     * Name:     str2url<br>
     * Purpose:  replace some charactes (e. g. deutsche Umlaute) with others, so that URLs do 
     *          NOT contain illegal characters
     * @link http://smarty.php.net/manual/en/language.modifier.str2url.php
     *          str2url (Smarty online manual)
     * @author   Lars Tiefland <tiefland at weban dot de>
     * @param string
     * @return string
     */
    function smarty_modifier_str2url( $txt )
    {
        return str2url( $txt );
    }

    /* vim: set expandtab: */
?>

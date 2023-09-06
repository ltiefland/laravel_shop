<?php

    /**
     * @package   Kein Projekt geladen
     * @author    Webagentur Niewerth <tiefland@weban.de>
     * @copyright 2012 Webagentur Niewerth
     * @license   propietary http://www.weban.de
     * @version   $Rev: 904 $
     * @filesource
     * 
     */

    /**
     * 
     * @package   Kein Projekt geladen
     * @author    Webagentur Niewerth <tiefland@weban.de>
     * @copyright 2012 Webagentur Niewerth
     */

    // SVN: $Id: modifier.item_exists.php 904 2012-01-11 15:29:37Z tiefland $

    function smarty_modifier_item_exists()
    {
        $params = func_get_args();
        $table = artikelDatabase( $params[1] );

        $sql = "SELECT
                id
            FROM
                $table
            WHERE
                id = $params[0]
        ";
        $res = $GLOBALS["remoteDB"]->query($sql);
        $ret = $res->num_rows;
        return $ret;
    }
?>
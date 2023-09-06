<?php

    /**
     * @package   Kein Projekt geladen
     * @author    Webagentur Niewerth <tiefland@weban.de>
     * @copyright 2012 Webagentur Niewerth
     * @license   propietary http://www.weban.de
     * @version   $Rev: 1607 $
     * @filesource
     * 
     */

    /**
     * 
     * @package   Kein Projekt geladen
     * @author    Webagentur Niewerth <tiefland@weban.de>
     * @copyright 2012 Webagentur Niewerth
     */

    // SVN: $Id: modifier_item_exists.php 1607 2013-01-27 21:58:25Z tiefland $

    function smarty_modifier_item_exists()
    {
        $params = func_get_args();
        $table = artikelDatabase($params[1]);
        
        $sql="SELECT
                id
            FROM
                $table
            WHERE
                id = $params[0]
        ";
        $res = mysql_query($sql);
        return mysql_num_rows($res);
    } 

?>
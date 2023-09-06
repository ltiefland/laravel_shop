<?php

    /**
     * @package   Content-management
     * @author    Webagentur Niewerth <tiefland@weban.de>
     * @copyright 2011 Webagentur Niewerth
     * @license   propietary http://www.weban.de
     * @version   $Rev: 48 $
     * @filesource
     * 
     */

    /**
     * 
     * @package   Content-management
     * @author    Webagentur Niewerth <tiefland@weban.de>
     * @copyright 2011 Webagentur Niewerth
     */

    // SVN: $Id: function.get_tracking.php 48 2021-10-11 14:01:50Z tiefland $


    function smarty_function_get_tracking( $params, $content, &$smarty )
    {
    require_once  "includes/bestellungen/pagination.php";
        require_once "smarty/libs/SmartyPaginate.class.php";
        $id = Weban_Utils::clean_input( $params["l_id"], "int" );
        $start = Weban_Utils::clean_input( $params["start"], "int" );
        if ( !$start )
        {
            $start = 0;
        }
        $sql = "SELECT
            SQL_CALC_FOUND_ROWS
            l.kname,
            bl.bestellung,
            l.trackinglink,
            bp.paketnummer,
            bp.datum
        FROM
            logistiker l,
            bestellung_paketnummern bp,
            bestellung_logistiker bl
        WHERE
            bp.logistiker=l.id
        AND
            bp.bestellung=bl.bestellung
        AND
            bl.logistiker=l.id
        AND
            l.id=$id
        LIMIT
            $start, 100            
    ";
        $res = mysql_query( $sql );
        while ( $row = mysql_fetch_assoc( $res ) )
        {
            $daten[] = $row;
        }
        $sql = "SELECT
            FOUND_ROWS() AS anz
    ";
        $res = mysql_query( $sql );
        $row = mysql_fetch_assoc( $res );
        $anz = $row["anz"];
        pagination( $anz );
        $GLOBALS["ui"]->assign( "daten", $daten );
        $GLOBALS["ui"]->display( "get_tracking.tpl" );
    }
?>
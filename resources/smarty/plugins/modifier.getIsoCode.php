<?php

    function smarty_modifier_getIsoCode( $Land = 'Deutschland', $len = 2 )
    {
        $iso = "DE";
        $sql = "SELECT 
                `iso-" . $len . "` as iso_code 
            FROM 
                countries
            WHERE
                `name_de` ='" . $Land . "'
            OR
                `name_uk` = '" . $Land . "'
            OR
                `id` = '" . $Land . "'
        ";
        $row = DB::connection( 'cms' )->select( $sql );
        if ( $row[0] )
        {
            $iso = $row[0]->iso_code;
        }
        return $iso;
    }


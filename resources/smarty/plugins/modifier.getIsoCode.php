<?php

    function smarty_modifier_getIsoCode( $Land = 'Deutschland' )
    {
        $iso = "DE";
        $i = getLand( $Land, true );
        if ( $i )
        {
            $iso = $i;
        }
        return $iso;
    }


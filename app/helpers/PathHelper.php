<?php

    use App\Models\Directory;
    use Illuminate\Database\Eloquent\ModelNotFoundException;
    use Illuminate\Support\Collection;

    function getPath( $root, $return_locked_folders = false ): Collection
    {
        $ini = $GLOBALS["INI"];
        $treeRoot = -1;
        if ( $ini["treeRoot"] )
        {
            $treeRoot = $ini["treeRoot"];
        }

        $path = collect();
        $father = $root;
        while ( $father != $treeRoot && !is_null( $father ) )
        {
            try
            {
                $row = Directory::where( "id", $father )->whereIn( "status", [ 0, 2 ] )->firstOrFail();
            }
            catch ( ModelNotFoundException)
            {
                return $path;
            }
            $father = $row->directory_id;
            $path[] = $row;
        }
        return $path;
    }


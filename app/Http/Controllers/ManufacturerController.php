<?php

    namespace App\Http\Controllers;


    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;

    class ManufacturerController extends Controller
    {
        public function show( string $manufacturer ): Factory|View|Application
        {
            $m = $manufacturer::where( "name", $manufacturer )->firstOrFail();
            $m->load( "products" );
            return view( "manufacturer", [
                "manufacturer" => $m,
            ] );
        }
    }

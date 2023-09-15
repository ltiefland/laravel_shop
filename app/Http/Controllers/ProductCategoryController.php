<?php

    namespace App\Http\Controllers;


    use GuzzleHttp\Client;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;

    class ProductCategoryController extends Controller
    {

        public function index()
        {
            $client = new Client();
            $response = $client->request( "get", config( "api.url" ) . "product-categories/", [
                'headers' => [
                    'Authorization' => 'Bearer ' . config( "api.key" ),
                    "Content-Type"  => "application/json",
                    "Accept"        => "application/json",
                ]
            ] )->getBody()->getContents();
            $nav = array();
            foreach ( json_decode( $response )->data as $cat )
            {
                if ( is_null( $cat->product_category_id ) )
                {
                    $nav[$cat->id] = $cat;
                }
                elseif ( !@is_null( $nav[$cat->product_category_id] ) )
                {
                    $nav[$cat->product_category_id]->sub[$cat->id] = $cat;
                }
            }
            dd( $nav );
        }

        public function show( int $id ): Factory|View|Application
        {
            $client = new Client();
            $response = $client->request( "get", config( "api.url" ) . "product-categories/" . $id, [
                'headers' => [
                    'Authorization' => 'Bearer ' . config( "api.key" ),
                    "Content-Type"  => "application/json",
                    "Accept"        => "application/json",
                ]
            ] )->getBody()->getContents();
            return view( "subdir", [
                "subdir" => json_decode( $response ),
            ] );
        }

        public function shopPosition(): Factory|View|Application
        {
            $client = new Client();
            $response = $client->request( "get", config( "api.url" ) . "product-categories/shopPosition/" . $_SESSION["navigation"]["position"], [
                'headers' => [
                    'Authorization' => 'Bearer ' . config( "api.key" ),
                    "Content-Type"  => "application/json",
                    "Accept"        => "application/json",
                ]
            ] )->getBody()->getContents();
            return view( "shopPosition", [
                "shopPosition" => json_decode( $response ),
            ] );
        }
    }

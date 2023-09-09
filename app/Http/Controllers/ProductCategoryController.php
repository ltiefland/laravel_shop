<?php

    namespace App\Http\Controllers;


    use GuzzleHttp\Client;

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
                if(is_null($cat->product_category_id))
                {
                    $nav[$cat->id]=$cat;
                }
                else
                {
                    $nav[$cat->product_category_id]->sub[$cat->id]=$cat;
                }
                dump( $nav );
            }
        }

        public function show( int $id )
        {
            $client = new Client();
            $response = $client->request( "get", config( "api.url" ) . "product-categories/" . $id, [
                'headers' => [
                    'Authorization' => 'Bearer ' . config( "api.key" ),
                    "Content-Type"  => "application/json",
                    "Accept"        => "application/json",
                ]
            ] )->getBody()->getContents();
            dd( json_decode( $response ) );
        }
    }

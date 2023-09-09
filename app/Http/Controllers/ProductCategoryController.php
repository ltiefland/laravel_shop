<?php

    namespace App\Http\Controllers;


    class ProductCategoryController extends Controller
    {

        public function index()
        {
            $client = new \GuzzleHttp\Client();
            $response = $client->request( "get", config( "api.url" ) . "product-categories/", [
                'headers' => [
                    'Authorization' => 'Bearer ' . config( "api.key" ),
                    "Content-Type"  => "application/json",
                    "Accept"        => "application/json",
                ]
            ] )->getBody()->getContents();
            dd( $response );
        }

        public function show( int $id )
        {
            $client = new \GuzzleHttp\Client();
            $response = $client->request( "get", config( "api.url" ) . "product-categories/" . $id, [
                'headers' => [
                    'Authorization' => 'Bearer ' . config( "api.key" ),
                    "Content-Type"  => "application/json",
                    "Accept"        => "application/json",
                ]
            ] )->getBody()->getContents();
            dd( $response );
        }
    }

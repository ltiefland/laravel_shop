<?php

    namespace App\Http\Controllers;


    class ProductCategoryController extends Controller
    {

        public function index()
        {
            $client = new \GuzzleHttp\Client();
            $response = $client->get( config( "api.url" ) . "product-categories/", [
                'headers' => [
                    'Authorization' => 'Bearer ' . config( "api.key" )
                ]
            ] )->getBody()->getContents();
            dd( $response );
        }
    }

<?php

    namespace App\Http\Controllers;


    class ProductCategoryController extends Controller
    {

        public function index()
        {
            $client = new \GuzzleHttp\Client();
            $response = $client->get( config( "api.url" ) . "/productcategories/" );
            dd( $response );
        }
    }

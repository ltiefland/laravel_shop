<?php

    namespace App\Http\Controllers;


    use GuzzleHttp\Client;

    class ProductController extends Controller
    {

        public function index()
        {
        }

        public function show( string $item )
        {
            $client = new Client();
            $response = $client->request( "get", config( "api.url" ) . "products/" . $item . ".html", [
                'headers' => [
                    'Authorization' => 'Bearer ' . config( "api.key" ),
                    "Content-Type"  => "application/json",
                    "Accept"        => "application/json",
                ]
            ] )->getBody()->getContents();
            $item = json_decode( $response )->data;
            $_SESSION["navigation"]["position"] = array_reverse( $item->categories )[0]->id;
            $cat = new ProductCategoryController();
            $shopPosition = $cat->shopPosition();
            return view( "item", [
                "item"         => $item,
                "shopPosition" => $shopPosition,
            ] );
        }
    }

<?php

    namespace App\Http\Controllers;


    use GuzzleHttp\Client;

    class ProductController extends Controller
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
            $_SESSION["navigation"]["position"] = $item->categories[0]->id;
            $cat = new ProductCategoryController();
            $shopPosition = $cat->shopPosition();
            return view( "item", [
                "item"         => $item,
                "shopPosition" => $shopPosition,
            ] );
        }
    }

<?php

    namespace App\Http\Controllers;


    use GuzzleHttp\Client;
    use GuzzleHttp\Exception\GuzzleException;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;

    class ProductCategoryController extends Controller
    {

        public function index()
        {
            $client = new Client();
            try
            {
                $nav = array();
                $response = $client->request( "get", config( "api.url" ) . "product-categories/", [
                    'headers' => [
                        'Authorization' => 'Bearer ' . config( "api.key" ),
                        "Content-Type"  => "application/json",
                        "Accept"        => "application/json",
                    ]
                ] )->getBody()->getContents();
                return json_decode( $response );
            }
            catch ( GuzzleException $e )
            {
                abort( $e->getCode() );
            }
        }

        public function show( int $id ): Factory|View|Application
        {
            $_SESSION["navigation"]["position"] = $id;
            $client = new Client();
            try
            {
                $response = $client->request( "get", config( "api.url" ) . "product-categories/" . $id, [
                    'headers' => [
                        'Authorization' => 'Bearer ' . config( "api.key" ),
                        "Content-Type"  => "application/json",
                        "Accept"        => "application/json",
                    ]
                ] )->getBody()->getContents();
                $shopPosition = $this->shopPosition();
                return view( "subdir", [
                    "subdir"       => json_decode( $response ),
                    "shopPosition" => $shopPosition,
                ] );
            }
            catch ( GuzzleException $e )
            {
                abort( $e->getCode() );
            }
        }

        public function shopPosition()
        {
            $client = new Client();
            try
            {
                $response = $client->request( "get", config( "api.url" ) . "product-categories/shopPosition/" . $_SESSION["navigation"]["position"], [
                    'headers' => [
                        'Authorization' => 'Bearer ' . config( "api.key" ),
                        "Content-Type"  => "application/json",
                        "Accept"        => "application/json",
                    ]
                ] )->getBody()->getContents();#
                return json_decode( $response );
            }
            catch ( GuzzleException $e )
            {
                abort( $e->getCode() );
            }
        }
    }

<?php

    namespace App\Http\Controllers;


    use GuzzleHttp\Client;
    use GuzzleHttp\Exception\GuzzleException;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;

    class ProductController extends Controller
    {

        public function index()
        {
        }

        public function show( string $item, $rawReturn = false )
        {
            $client = new Client();
            try
            {
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
                if ( $rawReturn === true )
                {
                    return $item;
                }
                else
                {
                    return view( "item", [
                        "item"         => $item,
                        "shopPosition" => $shopPosition,
                    ] );
                }
            }
            catch ( GuzzleException )
            {
            }
        }
    }

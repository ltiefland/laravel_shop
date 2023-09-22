<?php

    namespace App\Http\Controllers;


    use GuzzleHttp\Client;
    use GuzzleHttp\Exception\GuzzleException;

    class ManufacturerController extends Controller
    {
        public function show( string $manufacturer )
        {
            $client = new Client();
            try
            {
                $nav = array();
                $response = $client->request( "get", config( "api.url" ) . "manufacturers/" . $manufacturer, [
                    'headers' => [
                        'Authorization' => 'Bearer ' . config( "api.key" ),
                        "Content-Type"  => "application/json",
                        "Accept"        => "application/json",
                    ]
                ] )->getBody()->getContents();
                $m = json_decode( $response )->data;
                return view( "hersteller_items",
                    [
                        "manufacturer" => $m
                    ] );
            }
            catch ( GuzzleException )
            {
            }
        }
    }

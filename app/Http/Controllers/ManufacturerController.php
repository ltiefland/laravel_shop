<?php

    namespace App\Http\Controllers;


    use GuzzleHttp\Client;
    use GuzzleHttp\Exception\GuzzleException;

    class ManufacturerController extends Controller
    {
        public function index()
        {
            $client = new Client();
            try
            {
                $response = $client->request( "get", config( "api.url" ) . "manufacturers/", [
                    'headers' => [
                        'Authorization' => 'Bearer ' . config( "api.key" ),
                        "Content-Type"  => "application/json",
                        "Accept"        => "application/json",
                    ]
                ] )->getBody()->getContents();
                $herstellerListe = json_decode( $response )->data;
                return view( "hersteller_liste",
                             [
                                 "herstellerListe" => $herstellerListe
                             ] );
            }
            catch ( GuzzleException )
            {
            }
        }
        public function show( string $manufacturer )
        {
            $client = new Client();
            try
            {
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
                        "hersteller" => $m
                    ] );
            }
            catch ( GuzzleException )
            {
            }
        }
    }

<?php

    namespace App\Http\Controllers;


    use GuzzleHttp\Client;
    use GuzzleHttp\Exception\GuzzleException;
    use Illuminate\Http\Request;

    class ManufacturerController extends Controller
    {
        public function index( Request $request )
        {
            $client = new Client();
            try
            {
                $url = config( "api.url" ) . "manufacturers/";
                if ( $request->letter )
                {
                    $url .= "?letter=" . $request->letter;
                }
                $response = $client->request( "get", $url, [
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
            catch ( GuzzleException $e )
            {
                abort( $e->getCode() );
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
            catch ( GuzzleException $e )
            {
                abort( $e->getCode() );
            }
        }
    }

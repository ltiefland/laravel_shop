<?php

    namespace App\Http\Controllers;

    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use App\Models\Country;
    use Illuminate\Http\Request;

    class BuyController extends Controller
    {
        //

        public function step1( Request $request ): Factory|View|Application
        {
            $id = request( "step" );
            \View::share( "pagetype", "Bestellvorgang" . $id );
            $lieferadresse = request( "Lieferadresse" );
            $_SESSION["SHOP"]["Lieferadresse"] = $lieferadresse;
            if ( request( "action" ) == "Persdata" )
            {
                $rules = [
                    'Persdata.Vorname'    => 'bail|required|max:255',
                    'Persdata.Nachname'   => 'bail|required|max:255',
                    'Persdata.Strasse'    => 'bail|required|max:255',
                    'Persdata.Hausnummer' => 'bail|required|max:255',
                    'Persdata.PLZ'        => 'bail|required|max:255',
                    'Persdata.Ort'        => 'bail|required|max:255',
                    'Persdata.Land'       => 'bail|required',
                    'Persdata.email'      => 'bail|required|email|max:255',
                    'Persdata.Telefon'    => 'bail|required|max:255',
                    "AGB"                 => "required",
                ];
                if ( request( "mode" ) == "new" )
                {
                    $rules[] = array( "Persdata.Passwort" => "bail|required|max:255" );
                }
                $request->validate( $rules );
                $_SESSION["SHOP"]["buy"]["Persdata"] = $request->Persdata;
                $_SESSION["SHOP"]["buy"]["Persdata"]["Land_Name"] = Country::find( $_SESSION["SHOP"]["buy"]["Persdata"]["Land"] )->name_de;
                if ( $lieferadresse == "false" )
                {
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Vorname"] = $_SESSION["SHOP"]["buy"]["Persdata"]["Vorname"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Nachname"] = $_SESSION["SHOP"]["buy"]["Persdata"]["Nachname"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Strasse"] = $_SESSION["SHOP"]["buy"]["Persdata"]["Strasse"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Hausnummer"] = $_SESSION["SHOP"]["buy"]["Persdata"]["Hausnummer"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_PLZ"] = $_SESSION["SHOP"]["buy"]["Persdata"]["PLZ"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Ort"] = $_SESSION["SHOP"]["buy"]["Persdata"]["Ort"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Land"] = $_SESSION["SHOP"]["buy"]["Persdata"]["Land"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Land_Name"] = $_SESSION["SHOP"]["buy"]["Persdata"]["Land_Name"];
                }
                elseif ( $lieferadresse == "packstation" )
                {
                    $request->validate( [
                        'Persdata.liefer_Vorname_pst'    => 'bail|required|max:255',
                        'Persdata.liefer_Nachname_pst'   => 'bail|required|max:255',
                        'Persdata.liefer_Strasse_pst'    => 'bail|required|max:255',
                        'Persdata.liefer_Hausnummer_pst' => 'bail|required|max:255',
                        'Persdata.liefer_PLZ_pst'        => 'bail|required|max:255',
                        'Persdata.liefer_Ort_pst'        => 'bail|required|max:255',
                        'Persdata.liefer_Land_pst'       => 'bail|required',
                    ] );
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Vorname_pst"] = $_POST["Persdata"]["liefer_Vorname_pst"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Nachname_pst"] = $_POST["Persdata"]["liefer_Nachname_pst"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Strasse_pst"] = $_POST["Persdata"]["liefer_Strasse_pst"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Hausnummer_pst"] = $_POST["Persdata"]["liefer_Hausnummer_pst"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_PLZ_pst"] = $_POST["Persdata"]["liefer_PLZ_pst"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Ort_pst"] = $_POST["Persdata"]["liefer_Ort_pst"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Land_pst"] = $_POST["Persdata"]["liefer_Land_pst"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Land_Name_pst"] = Country::find( $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Land_pst"] )->name_de;
                }
                elseif ( $lieferadresse == "abholung" )
                {
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Vorname"] = "";
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Nachname"] = "";
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Firma"] = $GLOBALS["INI"]["firma"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Strasse"] = $GLOBALS["INI"]["fa_strasse"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Hausnummer"] = "";
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_PLZ"] = $GLOBALS["INI"]["fa_plz"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Ort"] = $GLOBALS["INI"]["fa_ort"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Land"] = 47;
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Land_Name"] = "Deutschland";
                }
                elseif ( $lieferadresse == "true" )
                {
                    $request->validate( [
                        'Persdata.liefer_Vorname'    => 'bail|required|max:255',
                        'Persdata.liefer_Nachname'   => 'bail|required|max:255',
                        'Persdata.liefer_Strasse'    => 'bail|required|max:255',
                        'Persdata.liefer_Hausnummer' => 'bail|required|max:255',
                        'Persdata.liefer_PLZ'        => 'bail|required|max:255',
                        'Persdata.liefer_Ort'        => 'bail|required|max:255',
                        'Persdata.liefer_Land'       => 'bail|required',
                    ] );
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Vorname"] = $_POST["Persdata"]["liefer_Vorname"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Nachname"] = $_POST["Persdata"]["liefer_Nachname"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Strasse"] = $_POST["Persdata"]["liefer_Strasse"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Hausnummer"] = $_POST["Persdata"]["liefer_Hausnummer"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_PLZ"] = $_POST["Persdata"]["liefer_PLZ"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Ort"] = $_POST["Persdata"]["liefer_Ort"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Land"] = $_POST["Persdata"]["liefer_Land"];
                    $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Land_Name"] = Country::find( $_SESSION["SHOP"]["buy"]["Persdata"]["liefer_Land"] )->name_de;
                }
                $_SESSION["AGB"] = request( "AGB" );
            }
            elseif ( request( "action" ) == "execute" )
            {
                $request->validate( [
                    "AGB" => "required",
                ] );
                $_SESSION["AGB"] = request( "AGB" );
                $order = new OrderController();
                $orderId = $order->create();
                $this->mail( $orderId );
                $order->mail();
            }
            return view( 'buy_' . $id, [
                "serviceCenterMenu" => $GLOBALS["serviceCenterMenu"],
                "nav"               => $GLOBALS["menu"],
                "ini"               => $GLOBALS["INI"],
                "langstrings"       => $GLOBALS["langstrings"],
            ] );
        }

        private function mail( $orderId )
        {

        }
    }

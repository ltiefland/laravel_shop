<?php

    namespace App\Http\Controllers;

    use App\Http\Controllers\ShippingController;
    use Illuminate\Support\Facades\DB;

    class BasketController extends Controller
    {
        public array $items         = array();
        public array $paymentInfo   = array();
        public array $shipmentCosts = array();

        public array $paymentMethods = array();

        public float $weight = 0.00;

        public array $shippingCountries = array();

        //
        private function getPaymentInfo(): void
        {
            $buffer = array(
                "itemAmt"      => array(
                    0 => 0.00,
                    1 => 0.00,
                ),
                "itemAmtNetto" => array(
                    0 => 0.00,
                    1 => 0.00,
                ),
                "itemTax"      => array(
                    0 => 0.00,
                    1 => 0.00,
                ),
                "shipAmt"      => 0.00,
                "shipTax"      => array(
                    0 => 0.00,
                    1 => 0.00,
                ),
                "Amt"          => 0.00,
                "Tax"          => 0.00,
                "Total"        => 0.00,
            );
            if ( $_SESSION["SHOP"]["BASKET"]->items )
            {
                $Land = 47;
                if ( ( isset( $_SESSION['SHOP']['Lieferadresse'] ) && $_SESSION['SHOP']['Lieferadresse'] == "true" ) || ( isset( $_GET["liefer"] ) && $_GET["liefer"] == 1 ) || isset( $_SESSION['SHOP']['buy']['Persdata']['liefer_Land'] ) )
                {
                    $Land = $_SESSION['SHOP']['buy']['Persdata']['liefer_Land'];
                }
                elseif ( isset( $_SESSION['SHOP']['buy']['Persdata']['Land'] ) )
                {
                    $Land = $_SESSION['SHOP']['buy']['Persdata']['Land'];
                }
                if ( !isset( $GLOBALS["steuern"][$Land] ) )
                {
                    $Land = 47;
                }
                $taxArr = $GLOBALS["steuern"][$Land];
                foreach ( $_SESSION["SHOP"]["BASKET"]->items as $bItem )
                {
                    if ( !$bItem->code )
                    {
                        $tax = $taxArr[$bItem->tax];
                        $bPreis = $bItem->menge * $bItem->price;
                        $buffer["itemAmt"][$bItem->tax] += $bPreis;
                    }
                    else
                    {
                        $tax = 0;
                        $bPreis = $bItem->price;
                        $buffer["discount"] = $bPreis * -1;
                    }
                    if ( isset( $GLOBALS["INI"]["netto_preise"] ) && $GLOBALS["INI"]["netto_preise"] )
                    {
                        $buffer["itemTax"][$bItem->tax] += round( $bPreis * $tax / 100, 2 );
                    }
                    else
                    {
                        $buffer["itemTax"][$bItem->tax] += round( $bItem->price * $tax / ( 100 + $tax ), 2 ) * $bItem->menge;
                    }
                    $buffer["Amt"] += $bPreis;
                }
                if ( !( isset( $GLOBALS["INI"]["netto_preise"] ) && $GLOBALS["INI"]["netto_preise"] == 1 ) )
                {
                    foreach ( $buffer["itemTax"] as $tax => $amt )
                    {
                        $buffer["itemAmtNetto"][$tax] = $buffer["itemAmt"][$tax] - round( $amt, 2 );
                    }
                }
                if ( isset( $_SESSION["SHOP"]["VERSAND"] ) && $_SESSION["SHOP"]["VERSAND"] )
                {
                    $t = 1;
                    $bItem = $_SESSION["SHOP"]["VERSAND"];
                    $buffer["shipAmt"] = $bItem["preis"];
                    $buffer["Amt"] += $bItem["preis"];
                    if ( $GLOBALS["INI"]["netto_preise"] )
                    {
                        $netto = array_sum( $buffer["itemAmt"] );
                        $t = $buffer["itemAmt"][0] / $netto;
                    }
                    if ( !isset( $GLOBALS["steuern"][$Land] ) )
                    {
                        $Land = 47;
                    }
                    $taxArr = $GLOBALS["steuern"][$Land];
                    if ( $t == 1 )
                    {
                        $tax = $taxArr[0];
                        if ( $GLOBALS["INI"]["netto_preise"] )
                        {
                            $buffer["shipTax"][0] += $bItem->price * $tax / 100;
                        }
                        else
                        {
                            $buffer["shipTax"][0] += $bItem->price * $tax / ( 100 + $tax );
                        }
                    }
                    elseif ( $t == 0 )
                    {
                        $tax = $taxArr[1];
                        if ( $GLOBALS["INI"]["netto_preise"] )
                        {
                            $buffer["shipTax"][1] += $bItem->price * $tax / 100;
                        }
                        else
                        {
                            $buffer["shipTax"][1] += $bItem->price * $tax / ( 100 + $tax );
                        }
                    }
                    else
                    {
                        $tax = $taxArr[0];
                        if ( isset( $GLOBALS["INI"]["netto_preise"] ) && $GLOBALS["INI"]["netto_preise"] )
                        {
                            $buffer["shipTax"][0] += ( $bItem->price * $tax / 100 ) * $t;
                        }
                        else
                        {
                            $buffer["shipTax"][0] += ( $bItem->price * $tax / ( 100 + $tax ) ) * $t;
                        }
                        $tax = $taxArr[1];
                        if ( isset( $GLOBALS["INI"]["netto_preise"] ) && $GLOBALS["INI"]["netto_preise"] )
                        {
                            $buffer["shipTax"][1] += ( $bItem->price * $tax / 100 ) * ( 1 - $t );
                        }
                        else
                        {
                            $buffer["shipTax"][0] += ( $bItem->price * $tax / ( 100 + $tax ) ) * ( 1 - $t );
                        }
                    }
                }
                foreach ( $taxArr as $ind => $tax )
                {
                    $buffer["TaxRates"][$ind] = $tax;
                }
                $buffer["Tax"] = round( array_sum( $buffer["itemTax"] ) + array_sum( $buffer["shipTax"] ), 2 );
                if ( isset( $GLOBALS["INI"]["netto_preise"] ) && $GLOBALS["INI"]["netto_preise"] )
                {
                    $buffer["Total"] = round( $buffer["Amt"] + $buffer["Tax"], 2 );
                }
                else
                {
                    $buffer["Total"] = $buffer["Amt"];
                }
            }
            $this->paymentInfo = $buffer;
        }

        public function addItem()
        {
            $preis = 0;
            if ( request( "preis" ) )
            {
                $preis = request( "preis" );
            }
            $bItem = new BasketItemController( \request( "Menge" ), $preis, \request( "item" ) );
            $bItem->addinfo = "";
            // addons aus konfigurator
            $addon = \request( "addon" );
            if ( is_array( $addon ) )
            {
                foreach ( $addon as $itemID )
                {
                    if ( $expl = explode( "#", $itemID ) )
                    {
                        if ( $expl[0] != 0 )
                        {
                            $itemID = $expl[0];
                        }
                        $preis = 0;
                        if ( $expl[1] != 0 )
                        {
                            $preis = $expl[1];
                        }
                    }
                    if ( is_numeric( $itemID ) )
                    {
                        $aItem = new BasketItemController( 1, $preis, $itemID );
                        $bItem->addinfo .= "<br>" . $aItem->name;
                        $bItem->price += $preis;
                    }
                }
            }
            $key = sha1( $bItem->name . $bItem->addinfo );
            if ( isset( $_SESSION["SHOP"]["BASKET"]->items[$key] ) )
            {
                $bItem->menge += $_SESSION["SHOP"]["BASKET"]->items[$key]->menge;
            }
            $_SESSION["SHOP"]["BASKET"]->items[$key] = $bItem;
            $this->getBasketGewicht();
            $this->getPaymentInfo();
            $this->getShipmentCosts();
        }

        public function editItem()
        {
            $key = request( "id" );
            $menge = request( "menge" );
            $_SESSION["SHOP"]["BASKET"]->items[$key]->menge = $menge;
            $this->getBasketGewicht();
            $this->getPaymentInfo();
            $this->getShipmentCosts();
        }

        public function delItem()
        {
            $key = request( "id" );
            unset( $_SESSION["SHOP"]["BASKET"]->items[$key] );
            $this->getBasketGewicht();
            $this->getPaymentInfo();
            $this->getShipmentCosts();
        }

        private function getShipmentCosts()
        {
            $sc = new ShippingController();
            $buffer = $sc->getShippingOptions();
            $_SESSION["SHOP"]["BASKET"]->shipmentCosts = $buffer;
            $this->getShippingCountries();
        }

        public function getBasketGewicht(): void
        {
            $gewicht = 0.00;
            foreach ( $_SESSION["SHOP"]["BASKET"]->items as $item )
            {
                $gewicht += $item->menge * $item->weight;
            }
            $_SESSION["SHOP"]["BASKET"]->weight = $gewicht;
        }

        public function getShippingCountries()
        {
            $rLaender = getRechnungsLaender();
            $laender = $rLaender;
            if ( $_SESSION["SHOP"]["BASKET"]->items )
            {
                foreach ( $_SESSION["SHOP"]["BASKET"]->items as $artikel )
                {
                    if ( !$artikel->shipping_group_id )
                    {
                        $artikel->shipping_group_id = 1;
                    }
                    $vgruppen[] = $artikel->shipping_group_id;
                }
                $vgruppen = array_unique( $vgruppen );
                $sql = "SELECT
                        MAX(rank) AS rank
                    FROM
                        shipping_groups
                    WHERE
                        id IN(" . implode( ",", $vgruppen ) . ")
                ";
                $r = DB::select( $sql );
                $row = $r[0];
                $rang = $row->rank;
                $sql = "SELECT
                        id
                    FROM
                        shipping_groups
                    WHERE
                        rank=" . $rang . "
                ";
                $res = DB::select( $sql );
                $row = $res[0];
                $vgId = $row->id;
            }
            if ( isset( $vgId ) && $vgId )
            {
                $sql = "SELECT DISTINCT
                        country_id
                    FROM
                        shipping_countries vl
                    JOIN
                        shippings v
                    ON
                        v.shipping_group_id=" . $vgId . "
                    AND
                        v.id=vl.shipping_id
                ";
            }
            else
            {
                $sql = "SELECT DISTINCT
                        country_id
                    FROM
                        shipping_countries
                ";
            }
            $res = DB::select( $sql );
            $vLaender = array();
            foreach ( $res as $row )
            {
                $sql = "SELECT
                        id,
                        name_de
                    FROM
                        countries
                    WHERE
                        id=" . $row->country_id . "
                ";
                $resC = DB::connection('cms')->select( $sql );
                $rowC = $resC[0];
                $land_name = $rowC->name_de;
                $vLaender[$rowC->id] = $land_name;
            }
            foreach ( $rLaender as $landId => $landName )
            {
                if ( !in_array( $landName, $vLaender ) )
                {
                    unset( $laender[$landId] );
                }
            }
            $_SESSION["SHOP"]["BASKET"]->shippingCountries = $laender;
        }

    }

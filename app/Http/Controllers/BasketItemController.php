<?php

    namespace App\Http\Controllers;

    use App\Models\Item;
    use Illuminate\Database\Eloquent\Collection;

    class BasketItemController extends Controller
    {
        public string     $name;
        public float      $price;
        public int        $menge;
        public string     $code              = "";
        public int        $id;
        public Collection $medium;
        public ?int       $tax               = 0;
        public string     $slug              = "";
        public int        $spedId            = 0;
        public int        $shipping_group_id = 1;
        public float      $weight            = 0;

        //
        public string $addinfo;

        public function __construct( int $menge, float $price, int $item, string $code = "" )
        {
            if ( $menge >= 1 )
            {
                $dbItem = Item::with( 'medium.medium', 'price' )->find( $item );
                $this->medium = $dbItem->medium;
                $this->shipping_group_id = $dbItem->shipping_group_id;
                $this->weight = $dbItem->weight;
                $this->menge = $menge;
                $this->slug = $dbItem->slug;
                $this->price = $dbItem->price[0]->preis;
                if ( $price )
                {
                    $this->price = $price;
                }
                $this->name = $dbItem->name;
                //$this->tax = $dbItem->tax1;
                $this->id = $item;
            }
        }
    }

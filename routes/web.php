<?php

    use App\Http\Controllers\BasketController;
    use App\Http\Controllers\BuyController;
    use App\Http\Controllers\ManufacturerController;
    use App\Http\Controllers\ProfileController;
    use App\Http\Controllers\ProductCategoryController;
    use App\Http\Controllers\ProductController;
    use Illuminate\Support\Facades\Route;

    /*
    |--------------------------------------------------------------------------
    | Web Routes
    |--------------------------------------------------------------------------
    |
    | Here is where you can register web routes for your application. These
    | routes are loaded by the RouteServiceProvider within a group which
    | contains the "web" middleware group. Now create something great!
    |
    */

    session_start();
    $GLOBALS["INI"] = getConfig();
    $GLOBALS["steuern"] = array();
    //default LandID für Deutschland
    $landID = 47;
    //Wenn das Flag gesetzt ist, dann nimm diesen wert, damit auch "ausländische Shops" den richtigen MwSt angezeigt bekommen
    if ( isset( $GLOBALS["INI"]["steuern"]["default_countryID"] ) )
    {
        $landID = $GLOBALS["INI"]["steuern"]["default_countryID"];
    }

    $countryIDs = ( isset( $GLOBALS['INI']['steuern']['use_countries_tax'] ) ) ? $GLOBALS['INI']['steuern']['use_countries_tax'] : $landID;
    if ( !isset( $_SESSION["SHOP"]["BASKET"] ) )
    {
        $_SESSION["SHOP"]["BASKET"] = new BasketController();
    }

    if ( !isset( $_SESSION["navigation"]["position"] ) )
    {
        $_SESSION["navigation"]["position"] = null;
    }
    $sql = "SELECT
            *
        FROM
            content_management.countries_tax
        WHERE
            country_id IN (" . $countryIDs . ")
    ";
    $rows = DB::connection( "cms" )->select( $sql );
    foreach ( $rows as $r )
    {
        $GLOBALS["steuern"][$r->country_id][$r->taxes_id] = $r->tax_percent;
        $GLOBALS["steuern"][$r->country_id][null] = $GLOBALS["steuern"][$r->country_id][0];
    }

    $sql = "
        SELECT
            *
        FROM
            i18n_de
    ";
    if ( Schema::hasTable( 'i18n_de' ) )
    {
        $langstrings = DB::select( $sql );
    }
    else
    {
        $langstrings = DB::connection( "old" )->select( $sql );
    }
    foreach ( $langstrings as $langstring )
    {
        $GLOBALS["langstrings"][$langstring->page_id][$langstring->id] = $langstring->string;
    }

    /* Mobile Weiche */
    if ( isset( $_SERVER["HTTP_USER_AGENT"] ) )
    {
        if ( !isset( $_SESSION['isMobile'] ) || $_SESSION['isMobile'] === false || !isset( $GLOBALS['isMobile'] ) || $GLOBALS['isMobile'] === false )
        {

            $_SESSION['isMobile'] = false;
            $GLOBALS['isMobile'] = false;

            $pattern = "/(alcatel|amoi|android|avantgo|blackberry|benq|cell|cricket|docomo|elaine|htc|iemobile|iphone|iPad|ipaq|ipod|j2me|java|midp|mini|mmp|mobi|motorola|nec-|nokia|palm|panasonic|philips|phone|playbook|sagem|sharp|sie-|silk|smartphone|sony|symbian|t-mobile|telus|up\.browser|up\.link|vodafone|wap|webos|wireless|xda|xoom|zte)/i";
            if ( preg_match( $pattern, $_SERVER["HTTP_USER_AGENT"] ) )
            {

                $_SESSION['isMobile'] = true;
                $GLOBALS['isMobile'] = true;
            }

        }
    }

    $nav = new ProductCategoryController();
    $menu = $nav->index();
    $sc = parseCMSPage( $GLOBALS["INI"]["typo3"]["url"] . "/typo3/" );
    $data = [
        "nav"               => $menu,
        "serviceCenterMenu" => $sc["menu"],
        "langstrings"       => $GLOBALS["langstrings"],
        "ini"               => $GLOBALS["INI"],
    ];
    \View::share( $data );

    Route::get( '/', function ()
    {
        $date = date( "Y-m-d" );
        //$aktion = Action::with( 'medium.medium' )->where( 'valid_from', '<=', $date )->where( 'valid_to', '>=', $date )->get();
        return view( 'startpage', [
            "pagetype" => "Startseite",
            //"aktion"   => $aktion,
        ] );
    } );

    Route::get( "/preisagentur/{filename}", [ PriceAgencyController::class, "download" ] );
    Route::get( "/addItemToBasket", function ()
    {
        $_SESSION["SHOP"]["BASKET"]->addItem();
        return view( 'header_wk' );
    } );
    Route::get( "/editItem/{id}/{menge}", function ()
    {
        $_SESSION["SHOP"]["BASKET"]->editItem();
        return redirect( "/basket.html" );
    } )->where( [ "id" => "[0-9a-f]{40}", "menge" => "[0-9]+" ] );
    Route::get( "/delItem/{id}", function ()
    {
        $_SESSION["SHOP"]["BASKET"]->delItem();
        return redirect( "/basket.html" );
    } )->where( "id", "[0-9a-f]{40}" );
    Route::get( "/cms/{slug}", function ( $slug )
    {
        $url = $GLOBALS["INI"]["typo3"]["url"] . "/typo3/" . $slug;
        $arr = parseCMSPage( $url );
        $content = $arr["content"];
        return view( 'service_center_content', [
            "serviceContent" => $content,
        ] );
    } );
    Route::post( "/updateSession", function ()
    {
    } );
    Route::get( "/bestellen_seite_{step}.html", function ( $step )
    {
        return view( 'buy_' . $step, [
            "pagetype"      => "Bestellvorgang1",
            "Laender"       => getRechnungsLaender(),
            "defaultLandID" => 47,
        ] );
    } )->where( 'step', '[1-4][ab]{0,1}' );
    Route::get( "/manufacturers/", [ ManufacturerController::class, "index" ] );
    Route::get( "/manufacturers/{manufacturer:slug}.html", [ ManufacturerController::class, "show" ] );
    Route::post( "/bestellen_seite_{step}.html", [ BuyController::class, 'step1' ] )->where( 'step', '[1-4][ab]{0,1}' );
    Route::view( "basket.html", 'basket' );
    Route::get( "/directory/", [ ProductCategoryController::class, "index" ] )->whereNumber( 'id' );
    Route::get( "{item:slug}.html", [ ProductController::class, "show" ] )->whereNumber( 'id' );
    Route::get( "/directory/{id}-{name}", [ ProductCategoryController::class, "show" ] )->whereNumber( 'id' );
    Route::get( '/dashboard', function ()
    {
        return view( 'dashboard' );
    } )->middleware( [ 'auth', 'verified' ] )->name( 'dashboard' );

    Route::middleware( 'auth' )->group( function ()
    {
        Route::get( '/profile', [ ProfileController::class, 'edit' ] )->name( 'profile.edit' );
        Route::patch( '/profile', [ ProfileController::class, 'update' ] )->name( 'profile.update' );
        Route::delete( '/profile', [ ProfileController::class, 'destroy' ] )->name( 'profile.destroy' );
    } );

    require __DIR__ . '/auth.php';

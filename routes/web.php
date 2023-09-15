<?php

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
    Route::get( "/bestellen_seite_{step}.html", function ( $step )
    {
        return view( 'buy_' . $step, [
            "pagetype"      => "Bestellvorgang1",
            "Laender"       => getRechnungsLaender(),
            "defaultLandID" => 47,
        ] );
    } )->where( 'step', '[1-4][ab]{0,1}' );
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

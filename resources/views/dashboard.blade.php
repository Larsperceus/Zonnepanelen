<?php
$year = date("Y");
$winst = \App\Winst::latest('id')->get();
$verbruik = \App\Verbruik::latest('id')->get();
$vuurstatus = \App\Fire::latest('id')->get();
$vuur = $vuurstatus[0]->on;
$locatie = \App\Location::latest('id')->get();
$id = auth()->user()->id;
$page = $_SERVER['PHP_SELF'];
$sec = "60";
$kwh_total = 0;
$kwh_maand = 0;
$kwh_dag = 0;
$profit_total = 0;
$profit_maand = 0;
$profit_dag = 0;

header("Refresh: $sec; url=$page/dashboard");
$conn = new mysqli("192.168.195.139", "root", "password", "zonnepanelen");
if ($conn->connect_error) {
    die("ERROR: Unable to connect: " . $conn->connect_error);
}
$sql = "SELECT FORMAT(sum(kwh*0.22)-(3200*0.25), 2,'de_DE') as 'Totale_Winst' ,sum(kwh)-3200 as 'Totaal_Kwh' FROM zonnepanelen.zonnepanelen_data where time like DATE_FORMAT(NOW(), '%Y%') and user_id =" . $id;
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        $profit_total = $row['Totale_Winst'];
        $kwh_total = $row['Totaal_Kwh'];

    }
}
$sql2 = "SELECT FORMAT(sum(kwh*0.22)-(266*0.25), 2,'de_DE') as 'Totale_Winst' ,sum(kwh)-266 as 'Totaal_Kwh' FROM zonnepanelen.zonnepanelen_data where time like DATE_FORMAT(NOW(), '%Y-%m-%%') and user_id =". $id;
$result2 = mysqli_query($conn, $sql2);
if (mysqli_num_rows($result2) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result2)) {
        $profit_maand = $row['Totale_Winst'];
        $kwh_maand = $row['Totaal_Kwh'];

    }
}

$sql3 = "SELECT FORMAT(sum(kwh*0.22)-(8.76*0.25),2,'de_DE') as 'Totale_Winst' ,sum(kwh)-8.76 as 'Totaal_Kwh' FROM zonnepanelen.zonnepanelen_data where time like DATE_FORMAT(NOW(), '%Y-%m-%d%') and user_id =". $id;
$result3 = mysqli_query($conn, $sql3);
if (mysqli_num_rows($result3) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result3)) {
        $profit_dag = $row['Totale_Winst'];
        $kwh_dag = $row['Totaal_Kwh'];

    }
}

$conn->close();

?>

@extends('layouts.layout')
@section('title')
    Dashboard {{ auth()->user()->name }}
@endsection
@section('main')
    <?php
    if (isset($_GET["buttonup"])) {
        $i = false;
    }
    elseif (isset($_GET["buttondown"])) {
        $i = true;
    }
    else {
        $i = true;
    }
    ?>



    {{--    opbrengst--}}
    <div class="container">
        <h1>Dashboard</h1>
        <p>dashboard van {{ auth()->user()->name }}</p>
        <div style="margin-bottom: 20px">
            @if ($i)
                <div class="card-text">
                    <form action="#" method="get">
                        <button class="bg-success btn-success" type="submit" name="buttonup" id="buttonup">Toon minder <i class="fas fa-arrow-circle-up"></i></button>
                    </form>
                </div>
            @else
                <div class="card-text">
                    <form action="#" method="get">
                        <button class="bg-success btn-success" type="submit" name="buttondown" id="buttondown">Toon meer <i class="fas fa-arrow-circle-down"></i></button>
                    </form>
                </div>
            @endif
        </div>
        <div class="row">
            <div class="col">
                <div class="card" style="width: 18rem; @if($profit_dag > 0) background-color: lightgreen @else background-color: red @endif">
                    <div class="card-body">
                        <h5 class="card-title">Totale  @if($profit_dag > 0) winst @else verlies @endif afgelopen dag <i class="fas fa-search-dollar"></i></h5>
                        @if($i)
                            <hr>
                            <p class="card-text"> @if($profit_dag > 0) De totale winst bedraagt @else Het totale verlies bedraagt @endif <?php echo $profit_dag; ?>€</p>
                        @endif
                    </div>
                </div>

            </div>
            <div class="col">
                <div class="card" style="width: 18rem; @if($profit_maand > 0) background-color: lightgreen @else background-color: red @endif">
                    <div class="card-body">
                        <h5 class="card-title">Totale  @if($profit_maand > 0) winst @else verlies @endif deze maand <i class="fas fa-search-dollar"></i></h5>
                        @if($i)
                            <hr>
                            <p class="card-text">@if($profit_maand > 0) De totale winst bedraagt @else Het totale verlies bedraagt @endif <?php echo $profit_maand; ?>€</p>
                        @endif
                    </div>
                </div>

            </div>
            <div class="col">
                <div class="card" style="width: 18rem; @if($profit_total > 0) background-color: lightgreen @else background-color: red @endif">
                    <div class="card-body">
                        <h5 class="card-title">Totale @if($profit_dag > 0) @else verlies @endif {{ $year }} <i class="fas fa-search-dollar"></i></h5>
                        @if($i)
                            <hr>
                            <p class="card-text">@if($profit_total > 0) De totale winst bedraagt @else Het totale verlies bedraagt @endif <?php echo $profit_total; ?>€</p>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="card mt-5" style="width: 18rem; @if($kwh_dag > 0) background-color: lightgreen @else background-color: red @endif">
                    <div class="card-body">
                        <h5 class="card-title">Totale kWh afgelopen dag <i class="fas fa-bolt"></i></h5>
                        @if($i)
                            <hr>
                            <p class="card-text">@if($kwh_dag > 0) De totale overproductie is @else Het totale energie tekort is: @endif<?php echo $kwh_dag; ?> kWh</p>
                        @endif
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mt-5" style="width: 18rem; @if($kwh_maand > 0) background-color: lightgreen @else background-color: red @endif">
                    <div class="card-body">
                        <h5 class="card-title">Totale kWh deze maand <i class="fas fa-bolt"></i></h5>
                        @if($i)
                            <hr>
                            <p class="card-text">@if($kwh_maand > 0) De totale overproductie is @else Het totale energie tekort is: @endif <?php echo $kwh_maand; ?> kWh</p>
                        @endif
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mt-5" style="width: 18rem; @if($kwh_total > 0) background-color: lightgreen @else background-color: red @endif">
                    <div class="card-body">
                        <h5 class="card-title">Totale kWh {{ $year }} <i class="fas fa-bolt"></i></h5>
                        @if($i)
                            <hr>
                            <p class="card-text">@if($kwh_total > 0) De totale overproductie is @else Het totale energie tekort is: @endif<?php echo $kwh_total; ?> kWh</p>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        <div class="row" >
            <div class="col">
                <div class="card mt-5" style="width: 18rem; @if($vuur == true) background-color: lightgreen @else background-color: red @endif">
                    <div class="card-body">
                        <h5 class="card-title">Vuur @if($vuur == true) <i class="fab fa-hotjar"></i>@else <i class="fas fa-snowflake"></i> @endif</h5>
                        @if($i)
                            <hr>
                            <p class="card-text">Het het vuur staat @if($vuur == true) aan @else uit @endif</p>
                            @if ($vuur == true)
                                <form method="get"  action="dashboard">
                                    <button name="on" class="btn btn-danger btn-sm" type="submit">Vuur uit <i class="fas fa-toggle-off"></i></button>
                                </form>
                            @else
                                <form method="get"  action="dashboard">
                                    <button name="off" class="btn btn-success btn-sm" type="submit">Vuur aan <i class="fas fa-toggle-on iconcolor"></i></button>
                                </form>
                            @endif
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php
    if (isset($_GET["on"])) {
        $vuur = new \App\Fire();
        $vuur->on = false;
        $vuur->save();
        $page = $_SERVER['PHP_SELF'];
        $sec = "1";
        header("Refresh: $sec; url=$page/dashboard");
    }
    elseif (isset($_GET["off"])) {
        $vuur = new \App\Fire();
        $vuur->on = true;
        $vuur->save();
        $page = $_SERVER['PHP_SELF'];
        $sec = "1";
        header("Refresh: $sec; url=$page/dashboard");
    }
    ?>

@endsection

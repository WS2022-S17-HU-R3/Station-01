<?php
$con = new PDO('mysql:host=localhost;dbname=skills_it_01', "skill17", "Shanghai2022");

$params = ["bookings","",""];
$params = explode("/",substr($_SERVER["REQUEST_URI"],5));
#print_r($params);
#print_r($_GET);
var_dump($_POST);

if($_SERVER['REQUEST_METHOD'] == "GET")
{

    if($params[0] == "accomodations" && !isset($params[1])){ //method type
        $sql = "SELECT * FROM `accomodations`;";
        print_r(json_encode($con->query($sql, PDO::FETCH_ASSOC)->fetchAll()));
    }
    else if($params[0] == "bookings"  && !isset($_GET["comment"])){
        $sql = "SELECT * FROM `bookings`;";
        print_r(json_encode($con->query($sql, PDO::FETCH_ASSOC)->fetchAll()));
    }
    else if($params[0] == "accomodations" && isset($params[1]) && $params[2] == "bookings"){
        $sql = "SELECT * FROM `bookings` WHERE `accomodationId` = ". strval($params[1]);
        print_r(json_encode($con->query($sql, PDO::FETCH_ASSOC)->fetchAll()));
    }
    else if(isset($_GET["comment"]) && str_contains($params[0],"bookings")){
        $sql = "SELECT * FROM `bookings` WHERE `comment` LIKE '%". strval($_GET["comment"])."%' ";
        print_r(json_encode($con->query($sql, PDO::FETCH_ASSOC)->fetchAll()));
    }   
}



if($_SERVER['REQUEST_METHOD'] == "POST"){
    if($params[0] == "bookings" && !isset($params[1])){
        #$sql = "SELECT * FROM `bookings` WHERE `accomodationId` = ".$_POST["accomodationId"]." AND `checkIn` >= '".$_POST["checkIn"]."' AND `checkOut`  <= '".$_POST["checkOut"]."';";
        $sql = "SELECT * FROM `bookings` WHERE (`accomodationId` = ".$_POST["accomodationId"].") AND ('".$_POST["checkIn"]."' BETWEEN `checkIn` AND `checkOut`) OR ('".$_POST["checkOut"]."' BETWEEN `checkIn` AND `checkOut` );";
        #print_r($sql);
        $count = count($con->query($sql, PDO::FETCH_ASSOC)->fetchAll());
        #print_r($count);
        if($count == 0){
            $sql = "INSERT INTO `bookings`(`accomodationId`, `checkIn`, `checkOut`, `bookingDate`, `comment`) VALUES ('".$_POST['accomodationId']."','".$_POST['checkIn']."','".$_POST['checkOut']."','".$_POST['bookingDate']."','".$_POST['comment']."')";
            #print_r($sql);
            $con->exec($sql);
            #print_r($_POST);
            echo("SUCCESS");
        }else{
            echo("ERROR");
        }
    }

}
if($_SERVER['REQUEST_METHOD'] == "DELETE"){
    if($params[0] == "bookings" && isset($params[1])){
        $sql = "DELETE FROM `bookings` WHERE id = ".$params[1];
        #print_r($sql);
        $con->exec($sql);
    }
}
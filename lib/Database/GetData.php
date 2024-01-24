<?php

$servername="localhost";
$username="root";
$password="";
$database_name="mobprog";


$conn=mysqli_connect($servername, $username, $password, $database_name);

if(!$conn){
    die("Connection Failed: " . mysqli_connect_error());
}



$disp_query = "SELECT * FROM tblusers";

$result = mysqli_query($conn, $disp_query);

$arrayResult = array();

while ($row = mysqli_fetch_assoc($result)){
    $arrayResult[] = $row;
}


echo json_encode($arrayResult);

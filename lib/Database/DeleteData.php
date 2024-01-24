<?php

$conn = mysqli_connect("localhost", "root", "", "mobprog");

if($conn===false){
    die("Error Could not Connect");

}

$name = $_REQUEST["name"];
$age = (int)$_REQUEST["age"];


$sql = "DELETE FROM tblusers WHERE name='$name' AND age='$age' ";

if(mysqli_query($conn, $sql)){
    echo "Updated Succesfully";
}

$conn -> close();

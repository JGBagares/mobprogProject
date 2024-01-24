<?php

$conn = mysqli_connect("localhost", "root", "", "mobprog");

if($conn===false){
    die("Error Could not Connect");

}

$init_name = $_REQUEST["init_name"];
$init_age = (int)$_REQUEST["init_age"];


$fname = $_REQUEST["final_name"];
$fage = (int)$_REQUEST["final_age"];





$sql = "UPDATE tblusers SET name='$fname', age='$fage' WHERE name='$init_name' AND age='$init_age' ";

if(mysqli_query($conn, $sql)){
    echo "Updated Succesfully";
}

$conn -> close();




























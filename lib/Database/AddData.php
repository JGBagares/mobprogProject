<?php
$servername="localhost";
$username="root";
$password="";
$database_name="mobprog";

$conn=mysqli_connect($servername, $username, $password, $database_name);

if(!$conn){
    die("Connection Failed: " . mysqli_connect_error());
}


    $name = $_POST['name'];
    $age = $_POST['age'];
   
    $fage = (int)$age;

    $sql_query = "INSERT INTO tblusers (name, age) VALUES ('$name', '$fage')";

    if(mysqli_query($conn, $sql_query)){
        echo "Data Successfully Inserted";
    }
    else{
        echo "Error: " . $sql . "" . mysqli_error($conn);
    }
    
    mysqli_close($conn);

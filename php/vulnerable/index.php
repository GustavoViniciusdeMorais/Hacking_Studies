<?php

try{
    $user='dev';
    $pass='1234';
    $dbh = new \PDO('mysql:host=localhost;dbname=api', $user, $pass);

    $id = $_GET['id'];
    echo "Param: " . $id . "\n";
    $vulnerableSql = "SELECT * FROM customers WHERE id = $id";
    foreach ($dbh->query($vulnerableSql) as $row) {
        echo "Name: " . $row['name'] . "\n";
    }
}catch(\Exception $e){
    echo $e->getMessage();
}
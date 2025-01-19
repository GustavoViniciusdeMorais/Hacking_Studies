<?php

try{
    $protect = false;
    $user='dev';
    $pass='1234';
    $dbh = new \PDO('mysql:host=localhost;dbname=api', $user, $pass);

    $id = $_GET['id'];

    if (empty($id)) {
        $id = 1;
    }

    if ($protect) {
        $sql = "SELECT * FROM customers WHERE id = :id";
        $sth = $dbh->prepare($sql, [\PDO::ATTR_CURSOR => \PDO::CURSOR_FWDONLY]);
        $sth->execute(['id' => $id]);
        $data = $sth->fetchAll();
        print_r(json_encode(['data' => $data]));echo "\n\n";exit;
    } else {
        // Vulnerable db query
        echo "Param: " . $id . "\n";
        $vulnerableSql = "SELECT * FROM customers WHERE id = $id";
        foreach ($dbh->query($vulnerableSql) as $row) {
            echo "Name: " . $row['name'] . "\n";
        }
    }
}catch(\Exception $e){
    echo $e->getMessage();
}
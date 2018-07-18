<?php
require_once 'db.php';
if ($_POST){
    $input = file_get_contents("php://input");
    parse_str($input, $data);
    $date = date('Y-m-d H:i:s');
    $result = ['error' => true];

    $sql = "INSERT INTO products(category_id, name, net_price, sale_price,storage,created,modified) VALUES(:category_id, :name, :net_price, :sale_price, :storage, :created, :modified)";
    $st = $db->prepare($sql);
    $st->bindParam(":category_id", $data['category_id'], PDO::PARAM_INT);
    $st->bindParam(":name", $data['name'], PDO::PARAM_STR);
    $st->bindParam(":net_price", $data['net_price'], PDO::PARAM_STR);
    $st->bindParam(":sale_price", $data['sale_price'], PDO::PARAM_STR);
    $st->bindParam(":storage", $data['storage'], PDO::PARAM_INT);
    $st->bindParam(":created",$date, PDO::PARAM_STR);
    $st->bindParam(":modified",$date, PDO::PARAM_STR);

    try{
        $st->execute();
        $result['error'] = false;
        $result['product_id'] = $db->lastInsertId();
    }
    catch (PDOException $e){
        $result['errorMessage'] = $st->errorInfo()[2];
    }

    $st = null;
    $db = null;

    print json_encode($result);
}
?>

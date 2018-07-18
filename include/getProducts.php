<?php
/**
 * Created by PhpStorm.
 * User: rashed
 * Date: 6/30/18
 * Time: 11:30 AM
 */
require_once "db.php";


if ($_POST){
    $result = ['error' => true];

    $sql = "SELECT products.id,products.name,products.net_price,products.sale_price,products.storage,categories.title FROM products
            LEFT JOIN categories ON products.category_id = categories.id
            ORDER BY products.id DESC";
    $st = $db->prepare($sql);

    try{
        $st->execute();
        $result['products'] = $st->fetchAll();
        $result['error'] = false;
    }
    catch (PDOException $e){
        $result['errorMessage'] = $st->errorInfo()[2];
    }

    $st = null;
    $db = null;

    print json_encode($result);
}

<?php
/**
 * Created by PhpStorm.
 * User: rashed
 * Date: 6/30/18
 * Time: 11:30 AM
 */
require_once '../../include/db.php';


if ($_POST){
    $result = ['error' => true];
    $data = $_GET['id'];
    $sql = "SELECT * FROM attributes WHERE id = :id";
    $st = $db->prepare($sql);
    $st->bindParam(':id', $data, PDO::PARAM_INT);
    try{
        $st->execute();
        $result['attributes'] = $st->fetchAll();
        $result['error'] = false;
    }
    catch (PDOException $e){
        $result['errorMessage'] = $st->errorInfo()[2];
    }

    $st = null;
    $db = null;

    print json_encode($result);
}
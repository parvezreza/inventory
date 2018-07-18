<?php
require_once 'db.php';
if ($_POST){
    $input = file_get_contents("php://input");
    parse_str($input, $data);
    $result = ['error' => true];
    $date = date('Y-m-d H:i:s');
    $sql = "INSERT INTO categories(title,created,modified) VALUES(:title, :created, :modified)";
    $st = $db->prepare($sql);
    $st->bindParam(":title", $data['title'], PDO::PARAM_STR);
    $st->bindParam(":created", $date, PDO::PARAM_STR);
    $st->bindParam(":modified", $date, PDO::PARAM_STR);

    try{
        $st->execute();
        $result['error'] = false;
        $result['id'] = $db->lastInsertId();
    }
    catch (PDOException $e){
        $result['errorMessage'] = $st->errorInfo()[2];
    }

    $st = null;
    $db = null;

    print json_encode($result);
}
?>

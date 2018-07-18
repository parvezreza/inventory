<?php
require_once "include/header.php";
require_once "include/db.php";
?>
    <div class="container">
        <h3>Sale Product</h3>
        <table class="table table-bordered table-product">
            <thead>
            <tr>
                <th>SL</th>
                <th>Customer Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Address</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $id = $_GET['id'];
            $sql = "SELECT * FROM customers WHERE id = $id";
            $st = $db->prepare($sql);
            $result = [];
            $i = 0;
            try{
                $st->execute();
                $result = $st->fetchAll(PDO::FETCH_ASSOC);
                foreach($result as $results){
                    $i++;
                    echo '<tr>';
                    echo '<td> '. $i .' </td>';
                    echo '<td> '.$results['name'].' </td>';
                    echo '<td> '.$results['mobile'].' </td>';
                    echo '<td> '.$results['email'].' </td>';
                    echo '<td> '.$results['address'].' </td>';
                    echo '<td> '.$results['created'].' </td>';
                    echo '</tr>';
                }
            }
            catch (PDOException $e){
                $e->getMessage();
            }
            ?>
            </tbody>
        </table>
    </div>

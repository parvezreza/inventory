<?php
require_once "include/header.php";
require_once "include/db.php";
if(@$_GET['id'] !=""){
    $id = @$_GET['id'];
    $st = $db->prepare("SELECT * FROM products WHERE id=$id");
    $result = [];

    try{
        $st->execute();
        $result = $st->fetchAll(PDO::FETCH_ASSOC);
        foreach($result as $results){
            $results['name'];
        }
    }
    catch (PDOException $e){
        $e->getMessage();
    }
?>
<div class="container">
    <script type="text/javascript">
        $(function () {
            $('.slider').click(function () {
                $('#user_form').toggle();
                $('#old_user_form').toggle();
            });
        });
    </script>
    <h3>Sale Product >> Product Name: <?php echo @$results['name']; ?></h3>
    Previous Customer <br>
    <label class="switch">
        <input type="checkbox" checked>
        <span class="slider round"></span>
    </label>
    <form id="old_user_form" action="/inventory/sales.php" method="post" style="display: none">
        <input type="hidden" name="id" value="<?php echo @$id?>" >
        <input type="hidden" name="old_user" value="old_user" >
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Number of Sale</label>
                    <input name="number_of_sale" type="number" class="form-control" placeholder="Ex: 10">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Previous Customer</label>
                    <select name="customer_id" class="form-control">
                        <option value="">Select</option>
                        <?php
                        $sql = "SELECT * FROM customers ORDER BY id DESC";
                        $st = $db->prepare($sql);
                        try{
                            $st->execute();
                            $result['error'] = false;
                            $CustomerResult = $st->fetchAll(PDO::FETCH_ASSOC);
                            foreach($CustomerResult as $CResults){
                                echo '<option value="'.$CResults['id'].'">'.$CResults['name'].'</option>';
                            }
                        }
                        catch (PDOException $e){
                            $e->getMessage();
                        }
                        ?>

                    </select>
                </div>
            </div>
            <div class="col-md-3">
                <br>
                <button type="submit" class="btn btn-primary btn-sale-product">Sales Product</button>
            </div>
        </div>
    </form>
    <form id="user_form" action="/inventory/sales.php" method="post" style="display: block">
        <input type="hidden" name="id" value="<?php echo @$id?>" >
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Number of Sale</label>
                    <input name="number_of_sale" type="number" class="form-control" placeholder="Ex: 10">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Customer Name</label>
                    <input name="customer_name" type="text" class="form-control" placeholder="Enter customer name">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Mobile</label>
                    <input name="mobile" type="text" class="form-control" placeholder="Enter mobile name">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Email</label>
                    <input name="email" type="text" class="form-control" placeholder="Enter Email name">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Address</label>
                    <input name="address" type="text" class="form-control" placeholder="Enter address name">
                </div>
            </div>
            <div class="col-md-3">
                <br>
                <button type="submit" class="btn btn-primary btn-sale-product">Sales Product</button>
            </div>
        </div>
    </form>
</div>
<?php
}else{
    if($_POST){
        $product_id = $_POST['id'];
        $number_of_sale = $_POST['number_of_sale'];
        $date = date('Y-m-d H:i:s');
        @$customer_id = $_POST['customer_id'];
        //// Show product
        $sql = "SELECT * FROM products WHERE id=$product_id";
        $st = $db->prepare($sql);
        try{
            $st->execute();
            $result['error'] = false;
            $ProductResult = $st->fetchAll(PDO::FETCH_ASSOC);
            foreach($ProductResult as $PResults){
                $PResults['name'];
            }
        }
        catch (PDOException $e){
            $e->getMessage();
        }
        /// add customer
        if($customer_id){
            // Nothing add new customer
        }else {
            $customer_name = $_POST['customer_name'];
            $mobile = $_POST['mobile'];
            $email = $_POST['email'];
            $address = $_POST['address'];
            $sql = "INSERT INTO customers (name,mobile,email,address,created,modified) VALUES(:name, :mobile, :email, :address, :created, :modified)";
            $st = $db->prepare($sql);
            $st->bindParam(":name", $customer_name, PDO::PARAM_STR);
            $st->bindParam(":mobile", $mobile, PDO::PARAM_STR);
            $st->bindParam(":email", $email, PDO::PARAM_STR);
            $st->bindParam(":address", $address, PDO::PARAM_STR);
            $st->bindParam(":created", $date, PDO::PARAM_STR);
            $st->bindParam(":modified", $date, PDO::PARAM_STR);
            try {
                $st->execute();
                $result['error'] = false;
                $customer_id = $db->lastInsertId();
            } catch (PDOException $e) {
                $e->getMessage();
            }
        }
        // add sale table ////////
        $storage = $PResults['storage'];
        $FinalStorage = $storage-$number_of_sale;
        $SalesPrice = $PResults['sale_price'];
        $TotalPrice = $SalesPrice*$number_of_sale;
        $sql = "INSERT INTO sales (customer_id,product_id,number_of_products, sale_price, total_price,created) VALUES(:customer_id, :product_id, :number_of_products, :sale_price, :total_price, :created)";
        $st = $db->prepare($sql);
        $st->bindParam(":customer_id", $customer_id, PDO::PARAM_INT);
        $st->bindParam(":product_id", $product_id, PDO::PARAM_INT);
        $st->bindParam(":number_of_products", $number_of_sale, PDO::PARAM_INT);
        $st->bindParam(":sale_price", $SalesPrice, PDO::PARAM_STR);
        $st->bindParam(":total_price", $TotalPrice, PDO::PARAM_STR);
        $st->bindParam(":created", $date, PDO::PARAM_STR);
        try{
            $st->execute();
            $result['error'] = false;
            $SaleLastID = $db->lastInsertId();
        }
        catch (PDOException $e){
            $e->getMessage();
        }
        // Update Product table when product is sale.
        $sql = "UPDATE products SET 
                              storage = :storage,
                              modified = :modified 
                              WHERE id = :id";
        $st = $db->prepare($sql);
        $st->bindParam(":id", $product_id, PDO::PARAM_INT);
        $st->bindParam(":storage", $FinalStorage, PDO::PARAM_INT);
        $st->bindParam(":modified", $date, PDO::PARAM_STR);
        try{
            $st->execute();
            $result['error'] = false;
            $ProductLastID = $db->lastInsertId();
        }
        catch (PDOException $e){
            $e->getMessage();
        }
    }
?>
    <div class="container">
        <h3>Sale Product</h3>
        <table class="table table-bordered table-product">
            <thead>
            <tr>
                <th>SL</th>
                <th>Product Name</th>
                <th>Customer Name</th>
                <th>Category</th>
                <th>Number of products</th>
                <th>Sales Price</th>
                <th>Total Price</th>
                <th>Sales Date</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $sql = "SELECT products.name,categories.title,customers.id AS cus_id,customers.name AS cus_name,sales.number_of_products,sales.sale_price,sales.total_price,sales.created FROM products
            INNER JOIN categories ON products.category_id = categories.id
            INNER JOIN sales ON products.id = sales.product_id
            INNER JOIN customers ON sales.customer_id = customers.id
            ORDER BY products.id DESC";
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
                        echo '<td><a title="View Customer Details" href="customer.php?id='.$results['cus_id'].'"> '.$results['cus_name'].' </a></td>';
                        echo '<td> '.$results['title'].' </td>';
                        echo '<td> '.$results['number_of_products'].' </td>';
                        echo '<td> '.$results['sale_price'].' </td>';
                        echo '<td> '.$results['total_price'].' </td>';
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
<?php } ?>

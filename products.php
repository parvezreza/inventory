<?php require_once "include/header.php" ?>
<script type="text/javascript">
    $(function () {
        $('.btn-add-product').click(function () {
            var name = $('input[name="product_name"]').val();
            var category_id = $('select[name="category"]').val();
            var net_price = $('input[name="net_price"]').val();
            var sale_price = $('input[name="sale_price"]').val();
            var storage = $('input[name="storage"]').val();
            if (name && category_id && net_price && sale_price && storage ) {
                $.ajax({
                    url: "http://localhost/inventory/include/addProducts.php",
                    type: "POST",
                    data: {"name": name, "category_id": category_id, "net_price": net_price,"sale_price": sale_price,"storage": storage},
                    success: function (data, status) {
                        var response = JSON.parse(data);
                        if (!response.error) {
                            var $product_table = $('.table-product');
                            var $index = $product_table.find('tbody tr').length;
                            $product_table.append(
                                '<tr>' +
                                '<td>' + ($index + 1) + '</td>' +
                                '<td><a href="sales.php">' + name + '</a></td>' +
                                '<td>' + category_id + '</td>' +
                                '<td>' + net_price + '</td>' +
                                '<td>' + sale_price + '</td>' +
                                '<td>' + storage + '</td>' +
                                '<td>' +
                                '<button data-id="' + response.id + '" type="button" class="btn btn-sm btn-danger btn-remove btn-product-remove">' +
                                '<i class="fa fa-trash"></i>' +
                                '</button>' +
                                '</td>' +
                                '</tr>'
                            );


                            $('.table-product tbody tr').each(function (index, element) {
                                var $td = $(element).find('td:eq(1)');
                                var name = $td.html();
                                var id = $td.data("id");
                            });
                        }
                    },
                    error: function (xhr, desc, err) {
                        console.log("error");
                    }
                });
            }
        });
        // Get Data
        $.ajax({
            url: "http://localhost/inventory/include/getProducts.php",
            type: "POST",
            data: {'action': 'get_products'},
            success:function (data, status) {
                var response = JSON.parse(data);

                for(var i=0; i < response.products.length; i++){
                    $(".table-product tbody").append(
                        '<tr>' +
                        '<td>' + (i+1) + '</td>'+
                        '<td><a href="sales.php?id='+ response.products[i].id+'">' +  response.products[i].name + '</a></td>' +
                        '<td>' +  response.products[i].title + '</td>' +
                        '<td>' +  response.products[i].net_price + '</td>' +
                        '<td>' +  response.products[i].sale_price + '</td>' +
                        '<td>' +  response.products[i].storage + '</td>' +
                        '<td>' +
                        '<button data-id="' + response.products[i].id +'" type="button" class="btn btn-sm btn-danger btn-remove btn-product-remove">' +
                        '<i class="fa fa-trash"></i>' +
                        '</button>' +
                        '</td>' +
                        '</tr>'
                    );
                }
            }
        });
        //Get Category
        $.ajax({
            url: "http://localhost/inventory/include/getCategory.php",
            type: "POST",
            data: {'action': 'get_category'},
            success:function (data, status) {
                var response = JSON.parse(data);

                for(var i=0; i < response.category.length; i++){
                    //console.log(response.category[i].name);
                    $('select[name="category"]').append(
                        '<option value="' + response.category[i].id + '">' + response.category[i].title + '</option>'
                    );
                }
            }
        });
        $('body').on('click','.btn-product-remove',function () {
            var $this = $(this).closest('tr');
            var product_id = $(this).data('product-id');
            $.ajax({
                url: "http://localhost/inventory/include/deleteProduct.php",
                type: "POST",
                data: {'product_id': product_id},
                success:function (data, status) {
                    var response = JSON.parse(data);
                    if (!response.error){
                        $this.remove();
                    }
                }
            });
            $('.table-product tbody tr').each(function (index, element) {
                $(element).find('td:first-child').html(index + 1);
            });
        });
    });
</script>
<div class="container">
    <form action="" method="post">
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Product Name</label>
                    <input name="product_name" type="text" class="form-control" placeholder="Enter Product name">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Category/Brand</label>
                    <select name="category" class="form-control">
                        <option value="">Select</option>
                    </select>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Purchase Price</label>
                    <input name="net_price" type="text" class="form-control" placeholder="Enter net pirce">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Sale Price</label>
                    <input name="sale_price" type="text" class="form-control" placeholder="Enter sale price">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label for="">Quantity</label>
                    <input name="storage" type="number" class="form-control" placeholder="Enter Quantity">
                </div>
            </div>
            <div class="col-md-3">
                <br>
                <button type="button" class="btn btn-primary btn-add-product">Save</button>
            </div>
        </div>
    </form>
    <table class="table table-bordered table-product">
        <thead>
        <tr>
            <th>SL</th>
            <th>Product Name</th>
            <th>Category/Brand</th>
            <th>Purchase  Price</th>
            <th>Sale Price</th>
            <th>Quantity</th>
            <th>#</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

<?php require_once "include/header.php" ?>
<script type="text/javascript">
    $(function () {
        $('.btn-add-category').click(function () {
            var title = $('input[name="title"]').val();

            // alert(category);
            if (title) {
                $.ajax({
                    url: "http://localhost/inventory/include/addCategory.php",
                    type: "POST",
                    data: {"title": title},
                    success: function (data, status) {
                        var response = JSON.parse(data);
                        if (!response.error) {
                            var $category_table = $('.table-category');
                            var $index = $category_table.find('tbody tr').length;
                            $category_table.append(
                                '<tr>' +
                                '<td>' + ($index + 1) + '</td>' +
                                '<td>' + title + '</td>' +
                                '<td>' +
                                '<button data-id="' + response.id + '" type="button" class="btn btn-sm btn-danger btn-remove btn-category-remove">' +
                                '<i class="fa fa-trash"></i>' +
                                '</button>' +
                                '</td>' +
                                '</tr>'
                            );
                        }
                    },
                    error: function (xhr, desc, err) {
                        console.log("error");
                    }
                });
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
                    $('.table-category').append(
                        '<tr>' +
                        '<td>' + (i+1) + '</td>'+
                        '<td>' +  response.category[i].title + '</td>' +
                        '<td>' +
                        '<button data-id="' + response.category[i].id +'" type="button" class="btn btn-sm btn-danger btn-remove btn-category-remove">' +
                        '<i class="fa fa-trash"></i>' +
                        '</button>' +
                        '</td>' +
                        '</tr>'
                    );
                }
            }
        });
        $('body').on('click','.btn-category-remove',function () {
            var $this = $(this).closest('tr');
            var id = $(this).data('id');
            $.ajax({
                url: "http://localhost/inventory/include/deleteCategory.php",
                type: "POST",
                data: {'id': id},
                success:function (data, status) {
                    var response = JSON.parse(data);
                    if (!response.error){
                        $this.remove();
                    }
                }
            });
            $('.table-category tbody tr').each(function (index, element) {
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
                    <label for="">Category Name</label>
                    <input name="title" type="text" class="form-control" placeholder="Enter category name">
                </div>
            </div>
            <div class="col-md-3">
                <br>
                <button type="button" class="btn btn-primary btn-add-category">Save</button>
            </div>
        </div>
    </form>
    <table class="table table-bordered table-category">
        <thead>
        <tr>
            <th>SL</th>
            <th>Category Name</th>
            <th>#</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

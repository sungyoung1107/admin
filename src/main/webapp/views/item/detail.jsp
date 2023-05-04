<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

    let item_detail ={
        init : function(){
            $('#register_btn').click(function(){
                item_detail.send();
            });
            $('#delete_btn').click(function(){
                let c = confirm("삭제하시겠습니까?")
                if(c == true){
                    location.href="/item/deleteimpl?id=${gitem.id}"
                }
            });
        },
        send : function(){
            $('#register_form').attr({
                method : 'post',
                action : '/item/updateimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(function(){
        item_detail.init();
    })

</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item Detail</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${gitem.id}</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form class="form-horizontal" id="register_form" action="">
                    <!-- 밖에 id가 있으나 화면엔 안나오고 서버에는 갈 수 있도록 hidden 태그 이용 -->
                    <input type="hidden" name="id" value="${gitem.id}">
                    <input type="hidden" name="imgname" value="${gitem.imgname}">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <img src="/uimg/${gitem.imgname}" style="width: 50px; height: 50px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">NAME: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" value="${gitem.name}"
                                   name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="price">PRICE: </label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="price" value="${gitem.price}" name="price">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img">IMAGE: </label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="img" placeholder="Input image"
                                   name="img"> <!-- name은 dto와 동일하게 -->
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="register_btn" class="btn btn-primary">Update</button>
                            <button type="button" id="delete_btn" class="btn btn-primary">Delete</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
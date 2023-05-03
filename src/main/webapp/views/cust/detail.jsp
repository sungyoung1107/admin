<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

    let cust_detail ={
        init : function(){
            $('#update_btn').click(function(){
                cust_detail.send();
            });
            $('#delete_btn').click(function(){
                let c = confirm("삭제하시겠습니까?");
                if(c==true){
                    location.href="/cust/deleteimpl?id=${dcust.id}"
                }
            });
        },
        send : function(){
            $('#cust_detail_form').attr({
                'action' : '/cust/updateimpl',
                'method' : 'post'
            });
            $('#cust_detail_form').submit();
        }
    };

    $(function(){
        cust_detail.init();
    });

</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Cust Detail</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Cust Detail</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form class="form-horizontal" id="cust_detail_form" action="">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">아이디</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" value="${dcust.id}" name="id" readonly>
                        </div>
                        <div class="col-sm-10">
                            <span id="check_id" class="bg-danger"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">패스워드</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="pwd"
                                   name="pwd"> <!-- name은 dto와 동일하게 -->
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">이름</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" value="${dcust.name}"
                                   name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="update_btn" class="btn btn-primary">변경</button>
                            <button type="button" id="delete_btn" class="btn btn-primary">삭제</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
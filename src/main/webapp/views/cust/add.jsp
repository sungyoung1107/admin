<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

    let cust_add ={
        init : function(){
            $('#register_btn').click(function(){
                cust_add.send();
            });
        },
        send : function(){
            $('#register_form').attr({
                method : 'post',
                action : '/cust/addimpl'
            });
            $('#register_form').submit();
        }
    };

    $(function(){
        cust_add.init();
    })

</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Cust Add</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Cust Add</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form class="form-horizontal" id="register_form" action="">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">아이디</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
                        </div>
                        <div class="col-sm-10">
                            <span id="check_id" class="bg-danger"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">패스워드</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password"
                                   name="pwd"> <!-- name은 dto와 동일하게 -->
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">이름</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" placeholder="Enter name"
                                   name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="register_btn" class="btn btn-primary">회원가입</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
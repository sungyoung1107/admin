<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let login_form = {
        init: function() {
            $('#login_btn').click(function(){
                login_form.send();
            });
        },
        send : function() {
            $('#login_form').attr({
                'action' : '/loginimpl',
                'method' : 'post'
            });
            $('#login_form').submit();
        }
    }

    $(function(){
        login_form.init();
    });
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">LOGIN</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Login</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form class="form-horizontal" id="login_form" action="">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">아이디</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">패스워드</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password"
                                   name="pwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label><input type="checkbox" name="remember">기억하기</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="login_btn" class="btn btn-primary">로그인</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
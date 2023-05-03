<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
    let adminfo_form ={
        init : function(){
            $('#adminfo_btn').click(function(){
                adminfo_form.send();
            });
        },
        send: function(){
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            let lev = $('#lev').val();

            // id는 최소 7자리 이상
            if(id.length <= 6){
                $('#check_id').text('id는 최소 7자리 이상이어야 합니다.');
                $('#id').focus();
                return;
            }
            if(pwd == ''){
                $('#pwd').focus();
                return;
            }
            // lev가 숫자가 입력되지 않으면 다시 입력되도록 함
            if(lev == '' || isNaN(lev)){
                if(isNaN(lev))
                    $('#lev_info').text("관리자레벨은 숫자로 입력하세요.")
                $('#lev').focus();
                return;
            }

            $('#adminfo_form').attr({
                'action': '/adminfoimpl',
                'method': 'post'
            });
            $('#adminfo_form').submit();
        }
    }

    $(function(){
        adminfo_form.init();
    });
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">adm info</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">adm info</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form class="form-horizontal" id="adminfo_form" action="">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">아이디</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id"
                                   value="${adminfo.id}" readonly>
                        </div>
                        <div class="col-sm-10">
                            <span id="check_id" class="bg-info"></span>
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
                        <label class="control-label col-sm-2" for="lev">관리자레벨</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="lev" placeholder="Enter lev"
                                   name="lev" value = "${adminfo.lev}">
                        </div>
                        <div class="col-sm-10">
                            <span id="lev_info" class="bg-info"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="adminfo_btn" class="btn btn-primary">회원정보변경</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
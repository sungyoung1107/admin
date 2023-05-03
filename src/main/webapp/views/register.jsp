<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
    let register_form ={
        init : function(){
            // 회원가입 비활성화
            $('#register_btn').addClass("disabled");

            $('#lev').keyup(function(){
                var id = $('#id').val();
                var pwd = $('#pwd').val();
                var lev = $('#lev').val();
                if(id !='' && pwd != '' && lev!=''){
                    $('#register_btn').removeClass("disabled");
                }
            });

            $('#id').keyup(function(){
                let txt_id = $('#id').val();
                if(txt_id.length <= 6){
                    return;
                }
                $.ajax({
                    url: '/checkid',
                    data: {'id':txt_id},
                    success: function(result){
                        if(result == 0){
                            $('#check_id').text('사용가능한 id입니다.');
                            $('#pwd').focus();
                        }else{
                            $('#check_id').text('이미 사용중인 id입니다.');
                        }
                    }
                });
            });

            $('#register_btn').click(function(){
                register_form.send();
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

            $('#register_form').attr({
                'action': '/registerimpl',
                'method': 'post'
            });
            $('#register_form').submit();
        }
    }

    $(function(){
        register_form.init();
    });
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">REGISTER</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Register</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form class="form-horizontal" id="register_form" action="">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">아이디(7자리이상)</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
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
                                   name="lev">
                        </div>
                        <div class="col-sm-10">
                            <span id="lev_info" class="bg-info"></span>
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
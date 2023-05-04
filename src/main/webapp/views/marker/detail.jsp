<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

    let marker_detail ={
        init : function(){
            $('#register_btn').click(function(){
                marker_detail.send();
            });
            $('#delete_btn').click(function(){
                location.href="/marker/deleteimpl?id=${dmarker.id}"
            });
        },
        send : function(){
            $('#register_form').attr({
                method : 'post',
                action : '/marker/updateimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(function(){
        marker_detail.init();
    })

</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker Add</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${dmarker.id}</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form class="form-horizontal" id="register_form" action="">
                    <input type="hidden" name="id" value="${dmarker.id}">
                    <input type="hidden" name="img" value="${dmarker.img}">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <img src = "/uimg/${dmarker.img}" style="width:300px; height:300px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="title">TITLE: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="title" value=${dmarker.title}
                                   name="title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="target">TARGET: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="target" value=${dmarker.target}
                                   name="target">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lat">LAT: </label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="lat" value=${dmarker.lat} name="lat">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lng">LNG: </label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="lng" value=${dmarker.lng} name="lng">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="imgfile">IMG: </label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="imgfile" placeholder="Input image"
                                   name="imgfile"> <!-- name은 dto와 동일하게 -->
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="loc">LOC: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="loc" value=${dmarker.loc}
                                   name="loc"> <!-- name은 dto와 동일하게 -->
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="register_btn" class="btn btn-primary">UPDATE</button>
                            <button type="button" id="delete_btn" class="btn btn-primary">DELETE</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
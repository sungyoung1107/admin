<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">${loginadm.id} 관리자님 안녕하세요.</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">[관리자권한 : ${loginadm.lev}]</h6>
        </div>
        <div class="card-body">
            <img src = "/uimg/pengha.jpg" alt="pengha" style="width: 400px; height: 600px"/>
        </div>
    </div>
</div>
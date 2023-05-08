<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

    let marker_detail_map = {
        map : null,
        init: function () {
            var mapContainer = document.querySelector('#map');
            var mapOption = {
                center: new kakao.maps.LatLng(${dmarker.lat}, ${dmarker.lng}), // 지도의 중심좌표
                level : 3 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);
            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new kakao.maps.MapTypeControl();
            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // 마커가 표시될 위치입니다
            var markerPosition = new kakao.maps.LatLng(${dmarker.lat}, ${dmarker.lng});

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);

            // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent = '<img src="/uimg/${dmarker.img}" style="width:80px" /><div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: iwContent
            });

            // 마커에 마우스오버 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseover', function () {
                // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                infowindow.open(map, marker);
            });

            // 마커에 마우스아웃 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                infowindow.close();
            });

            // 마커를 클릭하면 사이트 이동
            kakao.maps.event.addListener(marker, 'click', function () {
                location.href='${dmarker.target}';
            });


        }
    };

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
        marker_detail_map.init();
    })

</script>

<style>
    #map {
        width: 400px;
        height: 400px;
        border : 2px solid lightskyblue;
    }
</style>

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
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-10" id="map">

                            </div>
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
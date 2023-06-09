<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }
</style>

<script>
    let callcenter = {
        id          : null,
        stompClient : null, // 웹 소켓 통신을 사용하여 서버와 클라이언트 간의 실시간 양방향 통신을 가능하게 해주는 JS 라이브러리
        init        : function () {
            this.id = $('#adm_id').text();
            $("#connect").click(function () {
                callcenter.connect();
            });
            $("#disconnect").click(function () {
                callcenter.disconnect();
            });
            $("#sendto").click(function () {
                callcenter.sendTo();
            });
        },
        connect     : function () {
            var sid = this.id;
            // alert("sid는 " + this.id); // sid는 mung123
            var socket = new SockJS('${adminserver}/ws');
            // Stomp 프로토콜을 지원하며 Stomp 메세지 지향 미들에어를 위한 프로토콜
            this.stompClient = Stomp.over(socket);
            /*
             * STOMP 서버에 연결합니다.
             * connect() 함수의 첫번째 인자는 STOMP 서버에 전달할 옵션입니다.
             * 이 경우에는 빈 객체({})를 전달했습니다.
             * 연결에 성공하면 콜백 함수가 호출됩니다.
             * 콜백 함수의 인자로 STOMP 프로토콜의 CONNECTED 프레임이 전달됩니다.
             * this는 현재 객체를 참조합니다.
             */
            // 서버로부터 받는 파트 클라이언트 연결
            this.stompClient.connect({}, function (frame) {
                callcenter.setConnected(true);
                console.log('Connected: ' + frame);
                /*
                 * /send 주제를 구독합니다. 해당 주제로 메시지가 발송되면 콜백 함수가 호출됩니다.
                 * msg는 수신된 메시지를 의미합니다.
                 * 수신된 메시지를 HTML 태그로 변환하여 웹 페이지에 표시합니다.
                 */
                this.subscribe('/send/to/' + sid, function (msg) {
                    // id를 넣어준다.
                    console.log(JSON.parse(msg.body));
                    $("#target").val(JSON.parse(msg.body).sendid);
                    $("#to").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid + ":" +
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect  : function () {
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            callcenter.setConnected(false);
            console.log("Disconnected");
        },
        setConnected: function (connected) {
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },
        sendTo      : function () {
            var msg = JSON.stringify({
                'sendid'   : this.id,
                'receiveid': $('#target').val(),
                'content1' : $('#totext').val()
            });
            this.stompClient.send('/receiveto', {}, msg);
        }
    };
    $(function () {
        callcenter.init();
    })

</script>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">1:1 Call Center</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">1:1 Call Center</h6>
        </div>
        <div class="card-body">
            <div id="container"></div>
            <div class="col-sm-5">
                <h1 id="adm_id">${loginadm.id}</h1>
                <H1 id="status">Status</H1>
                <button id="connect">Connect</button>
                <button id="disconnect">Disconnect</button>

                <h3>To</h3>
                <input type="text" id="target">
                <input type="text" id="totext">
                <button id="sendto">Send</button>
                <div id="to"></div>

            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</div>
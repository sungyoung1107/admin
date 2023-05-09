package com.kbstar;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@EnableWebSocketMessageBroker
@Configuration
public class StomWebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Value("${serviceserver}")
    String serviceserver;

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    // StompEndpointRegistrys는 STOMP 연결을 등록하는 인터페이스
    // 다음과 같이 /ws, /chbot, /wss 경로를 각각 STOMP 연결 엔드포인트로 등록합니다.
        // 관리자 사용자가 접속하여 채팅을 하는 경로
        registry.addEndpoint("/ws").setAllowedOrigins("http://127.0.0.1", serviceserver, "http://172.16.21.44").withSockJS();
        registry.addEndpoint("/chbot").setAllowedOrigins("http://127.0.0.1").withSockJS();
        // 관리자로 접속해서 dashboard를 보는 경로
        registry.addEndpoint("/wss").setAllowedOrigins("http://127.0.0.1").withSockJS();
    }

    //setAllowedOrigin은 127.0.0.1로 접속했던 브라우저도 소켓 사용가능하게 함.
    /* 어플리케이션 내부에서 사용할 path를 지정할 수 있음 */
    /*
     * 이러한 채널들은 구성에 따라 다르게 사용될 수 있으며,
     * 예제에서는 /send 채널을 특정 사용자에게 메시지를 전달하는 데 사용하고 있습니다.
     * /broadcast 채널은 해당 예제에서 사용되지 않았지만, 모든 클라이언트에게 메시지를 전달할 때 사용될 수 있습니다.
     */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/send", "/sendadm");
    }
    // 각각 send, broadcast는 inbound, outbound
    // send는 클라이언트가 서버로 보낼 떄, broadcasat는 서버가 클라이언트로 보낼 때
}

/*
registry.enableSimpleBroker() 메소드는 매개 변수로 구독자(subscriber)에게 보낼 수 있는 메시지 목적지(prefix)를 설정합니다. 이 메소드는 다음과 같은 두 가지 형태로 사용할 수 있습니다.

enableSimpleBroker(String... destinations): 구독자(subscriber)에게 보낼 메시지의 목적지(prefix)를 지정합니다. 이 경우, destinations 매개 변수는 브로커가 생성하는 대상 전용 채널(prefix)을 나타내는 문자열 배열입니다.
예를 들어, registry.enableSimpleBroker("/topic", "/queue")는 /topic 및 /queue 접두사가있는 대상 전용 채널을 생성합니다.

enableSimpleBroker(SimpleBrokerRegistration registration): 위의 형태와 같지만 더욱 상세한 설정이 가능합니다. 예를 들어, registration.setPathMatcher(new AntPathMatcher("."))를 사용하여 정교한 패턴 매칭을 적용할 수 있습니다.
이 외에도, registry.enableStompBrokerRelay() 메소드를 사용하여 별도의 메시지 브로커(relay) 서버와 연결하여 메시지 브로커를 외부로 분리할 수 있습니다. 이 방법은 대규모 분산 시스템에서 성능 및 안정성을 보장하기 위해 사용됩니다.
 */
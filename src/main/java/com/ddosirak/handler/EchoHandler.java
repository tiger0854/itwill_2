package com.ddosirak.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ddosirak.domain.ChatRoomVO;
import com.ddosirak.domain.ChatVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.service.BoardService;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
	
    // 채팅방 목록 <방 번호, ArrayList<session> >이 들어간다.
    private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
    // session, 방 번호가 들어간다.
    private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
    private static int i;
	
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
	@Inject
	private BoardService bService;

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//        sessionList.add(session);
        logger.info("{} 연결됨", session.getId()); 
    } // afterConnectionEstablished() method end

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        //메세지 정보 받아오기
        String[] msg = message.getPayload().split("&");
        String chat_sender = msg[0];
        String chat_receiver = msg[1];
        String chat = msg[2];
        String chatRoom_code = msg[3];
        
        ChatVO chatVO = new ChatVO();
        chatVO.setChat_sender(chat_sender);
        chatVO.setChat_receiver(chat_receiver);
        chatVO.setMessage(chat);
        chatVO.setChatRoom_code(chatRoom_code);
        
        // 채팅방 찾아오기
        ChatRoomVO chatRoomVO = bService.getChatRoom(chatRoom_code);

        if(chatRoomVO == null && chat.equals("ENTER-CHAT")) { // 이 조건을 건드리면 됨 ...
            // 채팅방에 들어갈 session들
            ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
            // session 추가
            sessionTwo.add(session);
            // sessionList에 추가
            sessionList.put(session, chatRoom_code);// 이쪽이 문제다 !!!!
            // RoomList에 추가
            RoomList.put(chatRoom_code, sessionTwo); // 이쪽이 문제다 !!!!
            // 확인용
            logger.info("채팅방 생성");
        }else if(RoomList.get(chatRoomVO.getChatRoom_code()) != null && chat.equals("ENTER-CHAT") && chatRoomVO != null) {
            // RoomList에서 해당 방번호를 가진 방이 있는지 확인.
            RoomList.get(chatRoomVO.getChatRoom_code()).add(session);
            // sessionList에 추가
            sessionList.put(session, chatRoomVO.getChatRoom_code());
            // 확인용
            logger.info("생성된 채팅방으로 입장");
        } else if(RoomList.get(chatRoomVO.getChatRoom_code()) != null && !chat.equals("ENTER-CHAT") && chatRoomVO != null) {
        	
            //모든 유저에게 메세지 출력
            for(WebSocketSession sess : RoomList.get(chatRoomVO.getChatRoom_code())){
                sess.sendMessage(new TextMessage(message.getPayload()));
            }
            // 채팅 DB에 저장
            bService.chatSend(chatVO);
            bService.chatDateUpdate(chatVO); // 채팅방의 최근 채팅일자 저장
        }// i-ei-ei end
    }//handleTextMessage() method end

//    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	if(sessionList.get(session) != null) {
            // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
            RoomList.get(sessionList.get(session)).remove(session);
            sessionList.remove(session);
        }
        logger.info("{} 연결 끊김.", session.getId());
    }// afterConnectionClosed() method end

}// public class end

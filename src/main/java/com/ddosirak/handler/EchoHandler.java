package com.ddosirak.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ddosirak.domain.ChatVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.service.BoardService;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
    // session, 방 번호가 들어간다.
	Map<String, WebSocketSession> userSessions = new HashMap<>();
    
    // 채팅방 목록 <방 번호, ArrayList<session> >이 들어간다.
	Map<String, List<String>> roomUsers = new HashMap<>();


    
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
	@Inject
	private BoardService bService;

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//        sessionList.add(session);
        logger.info("{} 연결됨", session.getId()); 
        
		//userId 알아내기
		Map<String, Object> sessionVal =  session.getAttributes();
		EmployeeVO vo = (EmployeeVO)sessionVal.get("vo"); 
		String userId = Integer.toString(vo.getEmployee_id());
		
		if(userSessions.get(userId) != null) {
			//userId에 원래 웹세션값이 저장되어 있다면 update
			userSessions.replace(userId, session);
		} else {
			//userId에 웹세션값이 없다면 put
			userSessions.put(userId, session);
		}
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        //메세지 정보 받아오기
//        String[] msg = message.getPayload().split("&");
//        String chat_sender = msg[0];
//        String chat_receiver = msg[1];
//        String chat = msg[2];
//        String chatRoom_code = msg[3];
        
//        ChatVO chatVO = new ChatVO();
//        chatVO.setChat_sender(chat_sender);
//        chatVO.setChat_receiver(chat_receiver);
//        chatVO.setMessage(chat);
////        if(Integer.parseInt(chat_sender) > Integer.parseInt(chat_receiver)) {
////        	chatVO.setChatRoom_code(chat_sender+chat_receiver);
////        }else {
////        	chatVO.setChatRoom_code(chat_receiver+chat_sender);
////        }// i-e end
//        
//        bService.chatSend(chatVO);
//        // 여기서 메세지 파싱해서 DB에 저장
//        
//        //모든 유저에게 메세지 출력
//        for(WebSocketSession sess : sessionList){
//            sess.sendMessage(new TextMessage(message.getPayload()));
//        }
        
		//protocol: RoomNum, 보내는id, 내용 
		String getLine = message.getPayload();
		if(!getLine.isEmpty()) {
			String[] msg = message.getPayload().split("&");
			if(msg != null && msg.length == 4) {
//				String roomNum = strs[0];
//				String sendId = strs[1];
//				String content = strs[2];
				
		        String chat_sender = msg[0];
		        String chat_receiver = msg[1];
		        String chat = msg[2];
		        String chatRoom_code = msg[3];
		        ChatVO chatVO = new ChatVO();
//		        chatVO.setChat_sender(chat_sender);
//		        chatVO.setChat_receiver(chat_receiver);
		        chatVO.setMessage(chat);
		        
//		        bService.chatSend(chatVO);s
				//입장일시 
				if(chat.equals("ENTER")) {
					//해당 roomNum의 Map의 userId 리스트에 sendId를 넣어준다.
					System.out.println("ENTER안에 있음");
					
					if(roomUsers.get(chatRoom_code) == null) {
						List<String> list = new ArrayList<>();
						roomUsers.put(chatRoom_code, list);
					}
					
					roomUsers.get(chatRoom_code).add(chat_sender);
					System.out.println(chat_sender + "가 들어왔습니다.");
					
					List<String> roomUserList = roomUsers.get(chatRoom_code);
					for(int i = 0; i < roomUserList.size(); i++) {
						System.out.println(i + roomUserList.get(i) + " " + userSessions.get(roomUserList.get(i)));
					}
				} 
				//퇴장일시
				else if(chat.equals("OUT")) {
					// room을 나갈시 Map의 userId 리스트에 sendId를 지운다.
					roomUsers.get(chatRoom_code).remove(chat_sender);
					System.out.println("나갔습니다.");
					List<String> roomUserList = roomUsers.get(chatRoom_code);
					for(int i = 0; i < roomUserList.size(); i++) {
						System.out.println(i + roomUserList.get(i) + " " + userSessions.get(roomUserList.get(i)));
					}
				}
				
				//해당 room의 userList를 가져옴
				List<String> roomUserList = roomUsers.get(chatRoom_code);
				
				for(int i = 0; i < roomUserList.size(); i++) {
					//room의 userId의 session에 보내기
					userSessions.get(roomUserList.get(i)).sendMessage(new TextMessage(chat_sender + "," + chat));
				}
			}
		}
        
    }//handleTextMessage() method end

//    //클라이언트 연결을 끊었을 때 실행
//    @Override
//    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//        if(sessionList.get(session) != null) {
//            // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
//            RoomList.get(sessionList.get(session)).remove(session);
//            sessionList.remove(session);
//        }
//        logger.info("{} 연결 끊김.", session.getId());
//    }
	//소켓이 close 됐을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		//sessions.remove(session);
		System.out.println("afterHandleTextmessage: " + session + " : " + status);
	}
}

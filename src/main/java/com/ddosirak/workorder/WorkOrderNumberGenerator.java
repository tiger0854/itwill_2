package com.ddosirak.workorder;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.stereotype.Component;

@Component
public class WorkOrderNumberGenerator {

    private int sequence = 0;

    public synchronized String generateWorkOrderNumber() {
        // 현재 날짜 가져오기
        Date currentDate = new Date();

        // 날짜 포맷 지정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String dateStr = dateFormat.format(currentDate);

        // 순번 증가
        sequence++;

        // 작업지시 번호 생성
        String workOrderNumber = "WO" + dateStr + String.format("%04d", sequence);

        return workOrderNumber;
    }
	
}

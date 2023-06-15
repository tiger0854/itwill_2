package com.ddosirak.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddosirak.workorder.WorkOrderNumberGenerator;

@Controller
@RequestMapping("/workorder")
public class WorkOrderController {

    private static final Logger logger = LoggerFactory.getLogger(WorkOrderController.class);

    private final WorkOrderNumberGenerator workOrderNumberGenerator;

    @Autowired
    public WorkOrderController(WorkOrderNumberGenerator workOrderNumberGenerator) {
        this.workOrderNumberGenerator = workOrderNumberGenerator;
    }

    @RequestMapping(value = "/generate", produces = "application/json")
    @ResponseBody
    public Map<String, String> generateWorkOrderNumber() {
        logger.debug("generateWorkOrderNumber() 호출![]~(￣▽￣)~*");
        String workOrderNumber = workOrderNumberGenerator.generateWorkOrderNumber();
        Map<String, String> response = new HashMap<>();
        response.put("wo_code", workOrderNumber);
        logger.debug("workOrderNumber : "+workOrderNumber);
        logger.debug("workOrderNumber : "+response);
        return response;
    }
}

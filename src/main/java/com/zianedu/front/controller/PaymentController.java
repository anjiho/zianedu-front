package com.zianedu.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PaymentController {

    @RequestMapping(value = "/payment")
    public ModelAndView paymentManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        if ("inicisResult".equals(page_gbn)) {
            mvc.setViewName("/payment/iniPayReturn");
        }
        return mvc;
    }
}

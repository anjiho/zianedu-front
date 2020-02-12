package com.zianedu.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StarPlayerController {

    @RequestMapping(value = "/starPlayer")
    public ModelAndView paymentManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

//        if ("requestMobileEvent".equals(page_gbn)) {
//            mvc.setViewName("/starPlayer/requestStartPlayerMobileEvent");
//        }
        if ("eventLog".equals(page_gbn) || "requestMobileEvent".equals(page_gbn)) {
            mvc.setViewName("/starPlayer/requestStartPlayerMobileEvent");
        }
        return mvc;
    }
}

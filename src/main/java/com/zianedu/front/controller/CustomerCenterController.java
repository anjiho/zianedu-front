package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerCenterController {

    @RequestMapping(value = "/customerCenter")
    public ModelAndView CustomerCenterManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        page_gbn = Util.isNullValue(page_gbn, "");

        if ("saveQuestion".equals(page_gbn)) {
            mvc.setViewName("/customerCenter/question/saveQuestion");
        }else if("consult".equals(page_gbn)){
            mvc.setViewName("/customerCenter/consultReserve");
        }else if("mobile".equals(page_gbn)){
            mvc.setViewName("/customerCenter/mobileConsult");
        }else if("oftenList".equals(page_gbn)){
            mvc.setViewName("/customerCenter/oftenQuestion/oftenQuestionList");
        }
        return mvc;
    }
}

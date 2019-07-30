package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @RequestMapping(value = "/user")
    public ModelAndView userManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();
        page_gbn = Util.isNullValue(page_gbn, "");

        if ("joinAgree".equals(page_gbn)) {
            mvc.setViewName("user/joinAgree");
        } else if ("joinForm".equals(page_gbn)){
            mvc.setViewName("user/joinForm");
        }

        return mvc;
    }
}

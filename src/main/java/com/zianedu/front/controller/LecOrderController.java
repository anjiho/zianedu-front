package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LecOrderController {

    @RequestMapping(value = "/lectureOrder")
    public ModelAndView lecOrderManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        page_gbn = Util.isNullValue(page_gbn, "");

        if ("package".equals(page_gbn)) {
            mvc.setViewName("lectureOrder/online/package/main");
        }else if("single".equals(page_gbn)) {
            mvc.setViewName("lectureOrder/online/single/main");
        }else if("academy".equals(page_gbn)){
            mvc.setViewName("lectureOrder/academy/single/main");
        }
        return mvc;
    }
}

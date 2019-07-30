package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * 기술직 학원 컨트롤러
 */
@Controller
public class TechController {

    @RequestMapping(value = "/techAcademy")
    public ModelAndView techAcademyManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        page_gbn = Util.isNullValue(page_gbn, "");

        if ("main".equals(page_gbn)) {
            mvc.setViewName("tech/academy/main");
        } else {

        }

        return mvc;
    }
}

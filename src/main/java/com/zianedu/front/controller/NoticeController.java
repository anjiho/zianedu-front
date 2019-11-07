package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * 계리직 학원 컨트롤러
 */
@Controller
public class NoticeController {

    @RequestMapping(value = "/notice")
    public ModelAndView postAcademyManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        page_gbn = Util.isNullValue(page_gbn, "");

        if ("list".equals(page_gbn)) {
            mvc.setViewName("/notice/list");
        } else if ("detail".equals(page_gbn)) {
            mvc.setViewName("/notice/detail");
        } else if ("write".equals(page_gbn)) {
            mvc.setViewName("/notice/write");
        } else if ("lecRoom".equals(page_gbn)) {
            mvc.setViewName("/notice/lectureRoom");
        } else if ("examGuide".equals(page_gbn)) {
            mvc.setViewName("/notice/examGuide");
        }else if ("modify".equals(page_gbn)) {
            mvc.setViewName("/notice/modify");
        }
        return mvc;
    }
}

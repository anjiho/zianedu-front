package com.zianedu.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BigExamController {

    @RequestMapping(value = "/bigExam")
    public ModelAndView bigExamManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        if ("main".equals(page_gbn)) {
            mvc.setViewName("/bigExam/main");
        }else if("examApply".equals(page_gbn)){
            mvc.setViewName("/bigExam/examApply/applyList");
        }else if("detailApply".equals(page_gbn)){
            mvc.setViewName("/bigExam/examApply/detailApply");
        }
        return mvc;
    }
}

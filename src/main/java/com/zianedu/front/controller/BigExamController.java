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
            mvc.setViewName("/bigExam/applyList");
        }else if("acaExam".equals(page_gbn)){
            mvc.setViewName("/bigExam/acaExamList");
        }else if("weekExam".equals(page_gbn)){
            mvc.setViewName("/bigExam/weekExamList");
        }else if("pastQuestion".equals(page_gbn)){
            mvc.setViewName("/bigExam/pastQuestionList");
        }else if("bigReviewList".equals(page_gbn)){
            mvc.setViewName("/bigExam/bigExamReview/bigExamReviewList");
        }else if("detailBigReview".equals(page_gbn)){
            mvc.setViewName("/bigExam/bigExamReview/detailBigExamReview");
        }else if("saveBigReview".equals(page_gbn)){
            mvc.setViewName("/bigExam/bigExamReview/saveBigExamReview");
        }else if("modifyBigReview".equals(page_gbn)){
            mvc.setViewName("/bigExam/bigExamReview/modifyBigExamReview");
        }else if("referenceList".equals(page_gbn)){
            mvc.setViewName("/bigExam/referenceBoard/referenceList");
        }else if("modifyReference".equals(page_gbn)){
            mvc.setViewName("/bigExam/referenceBoard/modifyReference");
        }else if("detailReference".equals(page_gbn)){
            mvc.setViewName("/bigExam/referenceBoard/detailReference");
        }else if("saveReference".equals(page_gbn)){
            mvc.setViewName("/bigExam/referenceBoard/saveReference");
        }

        return mvc;
    }
}

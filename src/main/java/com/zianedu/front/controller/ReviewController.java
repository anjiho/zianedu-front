package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {

    @RequestMapping(value = "/review")
    public ModelAndView reviewManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        page_gbn = Util.isNullValue(page_gbn, "");

        if ("bookList".equals(page_gbn)) {
            mvc.setViewName("/review/bookReview/bookReviewList");
        } else if ("detailBook".equals(page_gbn)) {
            mvc.setViewName("/review/bookReview/detailBookReview");
        }else if ("saveBook".equals(page_gbn)) {
            mvc.setViewName("/review/bookReview/saveBookReview");
        } else if ("lectureList".equals(page_gbn)) {
            mvc.setViewName("/review/lectureReview/lectureReviewList");
        } else if ("detailLecture".equals(page_gbn)) {
            mvc.setViewName("/review/lectureReview/detailLectureReview");
        }else if ("saveLecture".equals(page_gbn)) {
            mvc.setViewName("/review/lectureReview/saveLectureReview");
        }else if ("videoList".equals(page_gbn)) {
            mvc.setViewName("/review/passerVideo/videoReviewList");
        } else if ("saveVideo".equals(page_gbn)) {
            mvc.setViewName("/review/passerVideo/saveVideoReview");
        } else if ("detailVideo".equals(page_gbn)) {
            mvc.setViewName("/review/passerVideo/detailVideoReview");
        } else if ("passList".equals(page_gbn)) {
            mvc.setViewName("/review/passReview/passReviewList");
        } else if ("savePass".equals(page_gbn)) {
            mvc.setViewName("/review/passReview/savePassReview");
        } else if ("detailPass".equals(page_gbn)) {
            mvc.setViewName("/review/passReview/detailPassReview");
        } else if ("modifyPass".equals(page_gbn)) {
            mvc.setViewName("/review/passReview/modifyPassReview");
        } else if ("modifyVideo".equals(page_gbn)) {
            mvc.setViewName("/review/passerVideo/modifyPasserVideo");
        } else if ("modifyLec".equals(page_gbn)) {
            mvc.setViewName("/review/lectureReview/modifyLectureReview");
        } else if ("modifyBook".equals(page_gbn)) {
            mvc.setViewName("/review/bookReview/modifyBookReview");
        }
        return mvc;
    }
}

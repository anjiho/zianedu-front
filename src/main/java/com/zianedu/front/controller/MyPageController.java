package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

    @RequestMapping(value = "/myPage")
    public ModelAndView myPageManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        page_gbn = Util.isNullValue(page_gbn, "");

        if ("cart".equals(page_gbn)) {
            mvc.setViewName("mypage/cart/cart");
        }else if("orderList".equals(page_gbn)){
            mvc.setViewName("mypage/order/orderList");
        }else if("write".equals(page_gbn)){
            mvc.setViewName("/mypage/cart/write");
        }else if("pay".equals(page_gbn)){
            mvc.setViewName("/mypage/cart/orderPay");
        }else if("orderResult".equals(page_gbn)){
            mvc.setViewName("/mypage/cart/orderResult");
        }else if("orderResultMobile".equals(page_gbn)){
            mvc.setViewName("/mypage/cart/orderResultMobile");
        }else if("detailOrder".equals(page_gbn)){
            mvc.setViewName("/mypage/order/detailOrder");
        }else if("memberMain".equals(page_gbn)){
            mvc.setViewName("/mypage/memberManage/modifyMember/main");
        }else if("pwdMain".equals(page_gbn)){
            mvc.setViewName("/mypage/memberManage/modifyPwd/main");
        }else if("modifyPwd".equals(page_gbn)){
            mvc.setViewName("/mypage/memberManage/modifyPwd/writePwd");
        }else if("changeDevice".equals(page_gbn)){
            mvc.setViewName("/mypage/memberManage/modifyMember/changeDevice");
        }else if("coupon".equals(page_gbn)){
            mvc.setViewName("/mypage/point/couponList");
        }else if("mileage".equals(page_gbn)){
            mvc.setViewName("/mypage/point/mileageList");
        }else if("questionList".equals(page_gbn)){
            mvc.setViewName("/mypage/boardManage/question/questionList");
        }else if("questionDetail".equals(page_gbn)){
            mvc.setViewName("/mypage/boardManage/question/detailQuestion");
        }else if("consult".equals(page_gbn)){
            mvc.setViewName("/mypage/boardManage/consultReserveList");
        }else if("boardList".equals(page_gbn)){
            mvc.setViewName("/mypage/boardManage/myBoard/boardList");
        }else if("detailBoard".equals(page_gbn)){
            mvc.setViewName("/mypage/boardManage/myBoard/detailBoard");
        }else if("gradeList".equals(page_gbn)){
            mvc.setViewName("/mypage/gradeManage/gradeList");
        }else if("examUseList".equals(page_gbn)){
            mvc.setViewName("/mypage/gradeManage/examUseList");
        }else if("answerNote".equals(page_gbn)){
            mvc.setViewName("/mypage/bigExamPopup/answersNote");
        }else if("gradeAllList".equals(page_gbn)){
            mvc.setViewName("/mypage/bigExamPopup/gradeAllList");
        }else if("subjectGradeDetail".equals(page_gbn)){
            mvc.setViewName("/mypage/bigExamPopup/subjectGradeDetail");
        }
        return mvc;
    }
}

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
public class myPageController {

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
        }
        return mvc;
    }
}

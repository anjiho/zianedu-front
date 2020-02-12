package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PopupController {

    @RequestMapping(value = "/popup")
    public ModelAndView popupManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        page_gbn = Util.isNullValue(page_gbn, "");

        if ("starPlayer".equals(page_gbn)) {
            mvc.setViewName("/popup/starPlayer");
        } else if ("starPlayerMobile".equals(page_gbn)) {
            mvc.setViewName("/popup/starPlayerMobile");
        } else if ("realStarPlayer".equals(page_gbn)) {
            mvc.setViewName("/popup/realStarPlayer");
        } else if ("realStarPlayerMobile".equals(page_gbn)) {
            mvc.setViewName("/popup/realStarPlayerMobile");
        }
        return mvc;
    }
}

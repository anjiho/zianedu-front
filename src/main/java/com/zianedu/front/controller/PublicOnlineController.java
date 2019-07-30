package com.zianedu.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * 행정직 온라인 컨트롤러
 */
@Controller
public class PublicOnlineController {

    @RequestMapping(value = "/publicOnline")
    public ModelAndView publicOnlineManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        return mvc;
    }
}

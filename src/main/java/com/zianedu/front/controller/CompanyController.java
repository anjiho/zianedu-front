package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CompanyController {

    @RequestMapping(value = "/company")
    public ModelAndView companyManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        page_gbn = Util.isNullValue(page_gbn, "");

        if ("main".equals(page_gbn)) {
            mvc.setViewName("/company/main");
        }else if("policy".equals(page_gbn)){
            mvc.setViewName("/company/policy");
        }else if("termsList".equals(page_gbn)){
            mvc.setViewName("/company/termsList");
        }
        return mvc;
    }
}

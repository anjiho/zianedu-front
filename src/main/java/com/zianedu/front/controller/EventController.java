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
public class EventController {

    @RequestMapping(value = "/event")
    public ModelAndView eventManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        page_gbn = Util.isNullValue(page_gbn, "");

        if ("deadList".equals(page_gbn)) {
            mvc.setViewName("/event/deadEvent/deadEventList");
        } else if ("detailDead".equals(page_gbn)) {
            mvc.setViewName("/event/deadEvent/detailDeadEvent");
        } else if ("proceedList".equals(page_gbn)) {
            mvc.setViewName("/event/proceedEvent/proceedEventList");
        } else if ("saveProceed".equals(page_gbn)) {
            mvc.setViewName("/event/proceedEvent/saveProceedEvent");
        } else if ("detailProceed".equals(page_gbn)) {
            mvc.setViewName("/event/proceedEvent/detailProceedEvent");
        }
        return mvc;
    }
}

package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


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
        } else if ("modifyProceed".equals(page_gbn)) {
            mvc.setViewName("/event/proceedEvent/modifyProceedEvent");
        } else if ("event2".equals(page_gbn)) {
            mvc.setViewName("/event/view/event2");
        } else if ("winList".equals(page_gbn)) {
            mvc.setViewName("/event/winEvent/winEventList");
        } else if ("saveWin".equals(page_gbn)) {
            mvc.setViewName("/event/winEvent/saveWinEvent");
        } else if ("modifyWin".equals(page_gbn)) {
            mvc.setViewName("/event/winEvent/modifyWinEvent");
        } else if ("detailWin".equals(page_gbn)) {
            mvc.setViewName("/event/winEvent/detailWinEvent");
        } else if ("modifyDead".equals(page_gbn)) {
            mvc.setViewName("/event/deadEvent/modifyDeadEvent");
        } else if ("event3".equals(page_gbn)) {
            mvc.setViewName("/event/view/event3");
        }
        return mvc;
    }
}

package com.zianedu.front.controller;

import com.zianedu.front.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class FreeLectureController {

    @RequestMapping(value = "/freeLecture")
    public ModelAndView freeLectureManage(@RequestParam(value = "page_gbn", required = false) String page_gbn) {
        ModelAndView mvc = new ModelAndView();

        page_gbn = Util.isNullValue(page_gbn, "");

        if ("theory".equals(page_gbn)) {
            mvc.setViewName("/freeLecture/theory");
        } else if ("examQuestion".equals(page_gbn)) {
            mvc.setViewName("/freeLecture/examQuestion");
        } else if ("detailTheory".equals(page_gbn)) {
            mvc.setViewName("/freeLecture/detailTheory");
        } else if ("detailExamQuestion".equals(page_gbn)) {
            mvc.setViewName("/freeLecture/detailExamQuestion");
        }
        return mvc;
    }
}

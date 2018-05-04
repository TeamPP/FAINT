package com.faint.sns;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/common/error")
public class CommonErrorController {
    private static final Logger logger = LoggerFactory.getLogger(CommonErrorController.class);

    @RequestMapping(value = "/throwable")
    public String throwable(HttpServletRequest request, Model model){
        logger.info("throwable");
        pageErrorLog(request);
        model.addAttribute("msg","예외가 발생했습니다");
        return "common/error";
    }

    @RequestMapping(value = "/exception")
    public String exception(HttpServletRequest request, Model model){
        logger.info("exception");
        pageErrorLog(request);
        model.addAttribute("msg","예외가 발생했습니다");
        return "common/error";
    }

    @RequestMapping(value = "/400")
    public String pageError400(HttpServletRequest request, Model model){
        logger.info("page error code 400");
        pageErrorLog(request);
        model.addAttribute("title","400");
        model.addAttribute("msg","잘못된 요청입니다.");
        return "common/error";
    }

    @RequestMapping(value = "/403")
    public String pageError403(HttpServletRequest request, Model model){
        logger.info("page error code 403");
        pageErrorLog(request);
        model.addAttribute("title","403");
        model.addAttribute("msg","접근이 금지되었습니다.");
        return "common/error";
    }

    @RequestMapping(value = "/404")
    public String pageError404(HttpServletRequest request, Model model){
        System.out.println("page error code 404");
        pageErrorLog(request);
//        System.out.println("404 Dest: "+request.getSession().getAttribute("dest"));
        model.addAttribute("title","404");
        model.addAttribute("msg","요청하신 페이지는 존재하지 않습니다.");
        return "common/error";
    }


    @RequestMapping(value = "/405")
    public String pageError405(HttpServletRequest request, Model model){
        logger.info("page error code 405");
        pageErrorLog(request);
        model.addAttribute("title","405");
        model.addAttribute("msg","요청된 메소드가 허용되지 않습니다.");
        return "common/error";
    }

    @RequestMapping(value = "/500")
    public String pageError500(HttpServletRequest request, Model model){
        logger.info("page error code 500");
        pageErrorLog(request);
        model.addAttribute("title","500");
        model.addAttribute("msg","서버에 오류가 발생하였습니다.");
        return "common/error";
    }

    @RequestMapping(value = "/503")
    public String pageError503(HttpServletRequest request, Model model){
        logger.info("page error code 503");
        pageErrorLog(request);
        model.addAttribute("title","503");
        model.addAttribute("msg","서비스를 사용할 수 없습니다.");
        return "common/error";
    }



    private void pageErrorLog(HttpServletRequest request) {
        logger.info("status_code:"+ request.getAttribute("javax.servlet.error.status_code"));
        logger.info("exception_type:"+ request.getAttribute("java.servlet.error.exception_type"));
        logger.info("message:"+ request.getAttribute("java.servlet.error.message"));
        logger.info("request_url"+request.getAttribute("java.servlet.error.exception"));
        logger.info("servlet_name:"+request.getAttribute("java.servlet.error.servlet_name"));
        logger.info("exception:"+request.getAttribute("java.servlet.error.exception"));
    }


}
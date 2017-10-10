package com.soft863.controller;

import com.soft863.Service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
@RequestMapping("/index")
public class IndexController {

    @Autowired
    private IndexService indexService;

    /**
     * 跳转到柱状图页面
     * @return
     */
    @RequestMapping("/toIndex")
    public ModelAndView toIndex() {
        ModelAndView mav = new ModelAndView("index");
        return mav;
    }

    /**
     * 跳转到饼状图页面
     * @return
     */
    @RequestMapping("/pie")
    public ModelAndView toPie() {
        ModelAndView mav = new ModelAndView("pie");
        return mav;
    }

    @RequestMapping("/queryForList")
    public @ResponseBody List<Map<String, Object>> queryForList() {
        return indexService.queryForList();
    }
}

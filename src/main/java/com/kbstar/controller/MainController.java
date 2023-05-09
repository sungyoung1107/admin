package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Cust;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MainController {

    @Value("${adminserver}")
    String adminserver;

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());

    @Autowired
    AdmService admService;

    @Autowired
    private BCryptPasswordEncoder encoder; // 일반적인 패스워드를 암호화 해주는 것

    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("adminserver", adminserver);
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd,
                            HttpSession session) throws Exception {
        Adm adm = null;
        String nextPage = "loginfail";

        try {
            adm = admService.get(id);
            if(adm!=null && encoder.matches(pwd, adm.getPwd())){
                nextPage="loginok";
                session.setMaxInactiveInterval(100000);
                session.setAttribute("loginadm", adm);
            }
        } catch (Exception e){
            throw new Exception("잠시 후에 다시 시도해 주시기 바랍니다.");
        }

        model.addAttribute("center", nextPage);
        return "index";
    }


    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session) {
        log.info("로그아웃 버튼 눌림");
        if(session!=null) {
            session.invalidate();
        }
        return "index";
    }

    @RequestMapping("/logoutimpl")
    public String logoutimpl(Model model, HttpSession session) {
        log.info("로그아웃 버튼 눌림");
        if(session!=null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/websocket")
    public String websocket(Model model) {
        log.info("웹소켓 눌림");
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "websocket");
        return "index";
    }


    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Adm adm, HttpSession session) throws Exception {

        // 비밀번호 암호화 저장
        adm.setPwd(encoder.encode(adm.getPwd()));
        try {
            admService.register(adm);
            session.setAttribute("loginadm", adm); // 가입 즉시 관리자 권한 로그인
        } catch (Exception e){
            throw new Exception("가입 오류");
        }
        // login 성공페이지로 이동
//        model.addAttribute("center", "loginok");
        return "redirect:/";
    }

    @RequestMapping("/charts")
    public String tables(Model model) {
        model.addAttribute("center", "charts");
        return "index";
    }

    @RequestMapping("/livechart")
    public String livechart(Model model) {
        model.addAttribute("center", "livechart");
        model.addAttribute("adminserver", adminserver);
        return "index";
    }

    @RequestMapping("/adminfo")
    public String adminfo(Model model, String id) throws Exception {
        Adm adm = null;
        try {
            adm = admService.get(id);
        } catch (Exception e){
            throw new Exception("시스템 장애");
        }
        model.addAttribute("adminfo", adm);
        model.addAttribute("center", "adminfo");
        return "index";
    }

    @RequestMapping("/adminfoimpl")
    public String adminfoimpl(Model model, Adm adm) throws Exception {

        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.modify(adm);
        } catch (Exception e){
            throw new Exception("시스템 장애");
        }
        return "redirect:/adminfo?id="+adm.getId();
    }



}

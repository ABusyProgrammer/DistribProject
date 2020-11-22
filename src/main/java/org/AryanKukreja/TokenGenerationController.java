package org.AryanKukreja;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.UUID;


@Controller
public class TokenGenerationController {

    HashMap<String, Integer> tokens = new HashMap<>();

    @RequestMapping("/generate_token")
    public ModelAndView getToken() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("successTokenGenerated.jsp");

        String token = UUID.randomUUID().toString().toLowerCase();
        while (this.tokens.containsKey(token)) {
            token = UUID.randomUUID().toString().toLowerCase();
        }
        tokens.put(token, 1);
        mv.addObject("result", token);

        // TODO: Change this to condition to check if token could not be generated
        if (1 != 1) {
            mv = new ModelAndView();
            mv.setViewName("welcome.jsp");

            String error = "Failed to create token: Try again.";
            mv.addObject("error", error);
        }

        return mv;
    }

    @RequestMapping("/get_credit_card")
    public ModelAndView getCreditCard(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("getCreditCard.jsp");

        String token = request.getParameter("saveVal").toLowerCase();
        System.out.println(token);

        if (this.tokens.containsKey(token)) {
            mv.setViewName("getCreditCard.jsp");
            this.tokens.remove(token);
        } else {
            mv.setViewName("checkoutToken.jsp");

            String error = "Failed to process token: Enter it again please.";
            mv.addObject("error", error);
        }

        return mv;
    }

    @RequestMapping("/bye")
    public ModelAndView checkoutComplete(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("checkoutComplete.jsp");

        String num = request.getParameter("saveNumVal").toLowerCase();
        String sec = request.getParameter("saveSecVal").toLowerCase();
        String pin = request.getParameter("savePinVal").toLowerCase();

        // TODO Do your processing here with the pin number
        if (1 != 1) {
            mv.setViewName("checkoutComplete.jsp");
            mv.addObject("error", "Credit Card Processing Failed");
        }

        return mv;
    }

    @RequestMapping("/return_to_home")
    public ModelAndView returnToHomePage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("welcome.jsp");

        return mv;
    }

    @RequestMapping("/return_to_checkout")
    public ModelAndView returnToCheckoutPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("checkoutToken.jsp");

        return mv;
    }
}

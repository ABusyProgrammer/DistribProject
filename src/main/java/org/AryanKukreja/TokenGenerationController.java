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
    public ModelAndView getToken(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("successTokenGenerated.jsp");

        String license;
        try {
            license = request.getParameter("saveVal").toLowerCase();
        } catch (Exception e) {
            mv.setViewName("welcome.jsp");
            mv.addObject("error", "Failed to create token: Try again.");

            return mv;
        }

        if (license.length() < 7) {
            mv.setViewName("welcome.jsp");
            mv.addObject("error", "You must enter a license");
        }
        System.out.println(license);

        String token = UUID.randomUUID().toString().toLowerCase();
        while (this.tokens.containsKey(token)) {
            token = UUID.randomUUID().toString().toLowerCase();
        }
        tokens.put(token, 1);
        mv.addObject("result", token.toUpperCase());

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

        String num = request.getParameter("saveNumVal");
        String sec = request.getParameter("saveSecVal");
        String pin = request.getParameter("savePinVal");

        System.out.println(num);
        System.out.println(sec);
        System.out.println(pin);

        if (pin.length() != 4) {
            mv.setViewName("checkoutComplete.jsp");
            mv.addObject("error", "Pin must be 4 numbers");
            return mv;
        }
        else if (num.length() < 13 || num.length() > 19) {
            mv.setViewName("checkoutComplete.jsp");
            mv.addObject("error", "Credit card number must be between 13 and 19 numbers");
            return mv;
        }

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

package com.loits.training.mvc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.loits.training.domain.Customerorder;
import com.loits.training.model.CustOrderModel;
import com.loits.training.model.MerchantModel;
import com.loits.training.model.OrderOfferModel;
import com.loits.training.model.ProdCat;
import com.loits.training.repo.CustOrderDao;

@Controller
@RequestMapping(value="/merchant")
public class MerchantController {
	
	@Autowired
	CustOrderDao custOrderDao;
	
	@RequestMapping( method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {

		 HttpSession sess = request.getSession();
		String user = "username";

        try{
        	           
                        model.addAttribute("newmerchant", new MerchantModel());
                        model.addAttribute("ErrorMsgDisplay", "none");
                        model.addAttribute("successMsgDisplay", "none");
                        boolean loadInitialData = true;
                        sess.setAttribute("loadInitialData", loadInitialData);

        }

        catch(Exception e){
                        e.printStackTrace();

                          }
		return "merchant";
	}
	
	@RequestMapping( method = RequestMethod.POST, params = "login")
	public String loginMerchant(Model model,@ModelAttribute("newmerchant") MerchantModel merchantModel, BindingResult result , HttpServletRequest request) {
		
		 HttpSession sess = request.getSession();
		String user = "username";

        try{
        	           
        	List<Customerorder> customerorderList = custOrderDao.getCustomerOrder(merchantModel.getMerchnatId());
        	            
        	            model.addAttribute("records", customerorderList); 
        	            model.addAttribute("merAppReject", new Customerorder());
                        model.addAttribute("ErrorMsgDisplay", "none");
                        model.addAttribute("successMsgDisplay", "none");
                        boolean loadInitialData = true;
                        sess.setAttribute("loadInitialData", loadInitialData);
                        
                        
        }

        catch(Exception e){

                        e.printStackTrace();
        }

		return "merAppr";
	}
	
	@RequestMapping(method = RequestMethod.POST, params = "approve")
	public String approve(Model model, @ModelAttribute("newFormOffer") Customerorder customerorder, BindingResult result , HttpServletRequest request) {

	                String msg;

	                try{
	                                msg=custOrderDao.apprReject(customerorder.getId(),"C");
	                                List<Customerorder> customerorderList = custOrderDao.getCustomerOrder(customerorder.getBuyMerchantId());
	                                model.addAttribute("records", customerorderList);
	                                model.addAttribute("merAppReject", new Customerorder());
	                                model.addAttribute("successMsg", msg);
	                                model.addAttribute("ErrorMsgDisplay", "none");
	                }

	                catch(Exception e){

	                                e.printStackTrace();
	                                model.addAttribute("merAppReject", new Customerorder());
	                                model.addAttribute("successMsgDisplay", "none");
	                                model.addAttribute("ErrorMsg","Error Occured" );
	                                List<Customerorder> customerorderList = custOrderDao.getCustomerOrder(customerorder.getBuyMerchantId());
	                                model.addAttribute("records", customerorderList);

	                }

	                return "merAppr";

	}




     @RequestMapping(method = RequestMethod.POST, params = "reject")
     public String reject(Model model, @ModelAttribute("newFormOffer") Customerorder customerorder, BindingResult result , HttpServletRequest request) {

         String msg;

         try{
                         msg=custOrderDao.apprReject(customerorder.getId(),"R");
                         List<Customerorder> customerorderList = custOrderDao.getCustomerOrder(customerorder.getBuyMerchantId());
                         model.addAttribute("records", customerorderList);
                         model.addAttribute("merAppReject", new Customerorder());
                         model.addAttribute("successMsg", msg);
                         model.addAttribute("ErrorMsgDisplay", "none");
         }

         catch(Exception e){

                         e.printStackTrace();
                         model.addAttribute("successMsgDisplay", "none");
                         model.addAttribute("ErrorMsg","Error Occured" );
                         List<Customerorder> customerorderList = custOrderDao.getCustomerOrder(customerorder.getBuyMerchantId());
         	             model.addAttribute("records", customerorderList);
         	            model.addAttribute("merAppReject", new Customerorder());

         }
        
         return "merAppr";

}


}

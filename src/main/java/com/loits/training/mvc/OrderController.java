package com.loits.training.mvc;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
















//import org.jboss.tools.example.springmvc.domain.Trst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;














import com.loits.training.domain.Customer;
import com.loits.training.domain.Customerorder;
import com.loits.training.model.CustOrderModel;
import com.loits.training.model.OrderOfferModel;
import com.loits.training.model.ProdCat;
import com.loits.training.repo.CustOrderDao;
import com.loits.training.repo.MerchantDao;
import com.loits.training.repo.ModuleDao;
import com.loits.training.repo.ProdCatDao;


@Controller
@RequestMapping(value="/order")
public class OrderController {

	 

	@Autowired
	ModuleDao moduleDao;
	@Autowired
	ProdCatDao ProdCatDao;
	@Autowired
	CustOrderDao custOrderDao;
	@Autowired
	MerchantDao merchantDao;

	// authenticated user
	private String authUser;
	// extended name
	private String fullName = "Udayanga Rathnasekara";

	// company shared project file location -- shared folder
	private static final String NETWORK_RESOURCES = "http://svn-src/HelpDesk";

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		// dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	/*
	 * Handing home page request calls
	 */
	@RequestMapping( method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {

		 HttpSession sess = request.getSession();
		String user = "username";

        try{
        	            List<ProdCat> prodCat = ProdCatDao.getSelectCat();
                       System.out.println("prodCat size ++++++"+prodCat.size());
        	            model.addAttribute("prodCat", prodCat);
                        model.addAttribute("newForm", new CustOrderModel());
                        model.addAttribute("ErrorMsgDisplay", "none");
                        model.addAttribute("successMsgDisplay", "none");
                        boolean loadInitialData = true;
                        sess.setAttribute("loadInitialData", loadInitialData);

        }

        catch(Exception e){
                        e.printStackTrace();

                          }
		return "od";
	}
	
	
	

	@RequestMapping(value = "/homePage", method = RequestMethod.GET)
	public String jumpToHome(Model model, HttpServletRequest request) {
		return home(model, request);
	}

	/*
	 * Handing requests for the lockScreen.jsp
	 */
	@RequestMapping(value = "/lockScreen", method = RequestMethod.GET)
	public String lockScreen(Model model, HttpServletRequest request) {
		return "lockScreen";
	}

	/*
	 * Handing user profile information page requests
	 */
	@RequestMapping(value = "/userProfile", method = RequestMethod.GET)
	public String userProfile(Model model, HttpServletRequest request) {
		return "profile";
	}


	
	@RequestMapping( method = RequestMethod.POST, params = "isrt")
	public String saveOrder(Model model, @ModelAttribute("newForm") CustOrderModel custOrderModel, BindingResult result , HttpServletRequest request) {
		
		HttpSession sess = request.getSession(); 			
		Customerorder customerorder = new Customerorder();
		customerorder.setLatitude(custOrderModel.getLatitude());  
		customerorder.setLongitude(custOrderModel.getLongitude());
		customerorder.setOrdrProduct(custOrderModel.getOrderProdut());
		customerorder.setOrdrProductType((int) custOrderModel.getProdCat());
		customerorder.setQuantity(custOrderModel.getQuantity());
		customerorder.setUserCredentialsId(custOrderModel.getUserCredentialsId());
		Customer customer = custOrderDao.getCustomer(custOrderModel.getUserCredentialsId());
	
			customerorder.setFirstName(customer.getFirstName());
			customerorder.setLastName(customer.getLastName());
			customerorder.setPhone(customer.getPhone());
			customerorder.setEmail(customer.getEmail());
		

		String errMsg = "";
		String errMsgSts = "N";
		Customerorder custOrder = new Customerorder();
		custOrder= custOrderDao.insertRec(customerorder);
		int resultOrder = custOrder.getId();
		CustOrderModel custOrderModelPass = new CustOrderModel();
		
		if (resultOrder >= 0){
			
			 model.addAttribute("ErrorMsgDisplay", "none");
			 model.addAttribute("orderId", resultOrder);

	         model.addAttribute("successMsgDisplay", "Order request " + resultOrder + "successfully sent to the merchnats");
	         model.addAttribute("successMsg", "Order request " + resultOrder + "successfully sent to the merchnats");
	         custOrderModelPass.setId(resultOrder);
		}
		else{
			 model.addAttribute("ErrorMsgDisplay", "Error in request Order");

	         model.addAttribute("successMsgDisplay", "none");
			
		}
		
		
		List<ProdCat> prodCat = ProdCatDao.getSelectCat();
		model.addAttribute("prodCat", prodCat);
       // model.addAttribute("newForm", new CustOrderModel());		
		model.addAttribute("newForm", custOrderModelPass);
		
		return "od";
		
	}
	
	
	
	@RequestMapping( method = RequestMethod.POST, params = "refresh")
	public String refreshOrder(Model model,@ModelAttribute("newForm") CustOrderModel custOrderModel, BindingResult result , HttpServletRequest request) {
		
		HttpSession sess = request.getSession(); 
		String merchnatName = null;

		Customerorder existCustomerorder = custOrderDao.getRec(custOrderModel.getId());
		
		if  (existCustomerorder.getBuyMerchantId() != null){
			OrderOfferModel orderOfferModel = new OrderOfferModel();
			String errMsg = "";
			String errMsgSts = "N";
			orderOfferModel.setMerchantId(existCustomerorder.getBuyMerchantId());
			orderOfferModel.setOfferPrice(existCustomerorder.getMerchantOfferprice());
			orderOfferModel.setOrderId(existCustomerorder.getId());
			merchnatName = merchantDao.getMerchantName(existCustomerorder.getBuyMerchantId());
			 model.addAttribute("ErrorMsgDisplay", "none");
			 model.addAttribute("orderId", custOrderModel.getId());
			 model.addAttribute("merName", merchnatName);

	         model.addAttribute("successMsgDisplay", "Order request: " + custOrderModel.getId()+ " " + "Merchant " + existCustomerorder.getBuyMerchantId()+" - " + merchnatName + " has given an offer for "+existCustomerorder.getMerchantOfferprice());
	         model.addAttribute("successMsg", "Order request: " + custOrderModel.getId()+ " " + "Merchant " + existCustomerorder.getBuyMerchantId()+" - " + merchnatName+ " has given an offer for "+existCustomerorder.getMerchantOfferprice());
	         model.addAttribute("newFormOffer", orderOfferModel);
			return "offer";
			
		} else {
			String errMsg = "";
			String errMsgSts = "N";
			Customerorder custOrder = new Customerorder();
			 model.addAttribute("ErrorMsgDisplay", "none");
			 model.addAttribute("orderId", custOrderModel.getId());

	         model.addAttribute("successMsgDisplay", "Order request " + custOrderModel.getId()+ "still processing ...");
	         model.addAttribute("successMsg", "Order request " + custOrderModel.getId() + "still processing ...");
	         
	         List<ProdCat> prodCat = ProdCatDao.getSelectCat();
	 		 model.addAttribute("prodType", prodCat);
	         CustOrderModel custOrderModelPass = new CustOrderModel();
	         custOrderModelPass.setId(custOrderModel.getId());
	         model.addAttribute("newForm", custOrderModelPass);
	 		return "od";
		}
		
	}
	
	
	@RequestMapping( method = RequestMethod.POST, params = "reset")
	public String reset(Model model, HttpServletRequest request) {

		 HttpSession sess = request.getSession();
		String user = "username";

        try{
        	            List<ProdCat> prodCat = ProdCatDao.getSelectCat();
                       
        	            model.addAttribute("prodType", prodCat);
                        model.addAttribute("newForm", new CustOrderModel());
                        model.addAttribute("ErrorMsgDisplay", "none");
                        model.addAttribute("successMsgDisplay", "none");
                        boolean loadInitialData = true;
                        sess.setAttribute("loadInitialData", loadInitialData);
                        
                        
        }

        catch(Exception e){

                        e.printStackTrace();
        }

		return "od";
	}
	
	
	@RequestMapping( method = RequestMethod.POST, params = "acpt")
	public String updateOrder(Model model, @ModelAttribute("newFormOffer") OrderOfferModel orderOfferModel, BindingResult result , HttpServletRequest request) {
		String resultOut = custOrderDao.acceptOrder( orderOfferModel.getOrderId(),"A"); 
		if(resultOut.equals("success")){
			 model.addAttribute("ErrorMsgDisplay", "none");
			 model.addAttribute("successMsgDisplay", "Order successfully Accepted and will deliver shortly");
			 model.addAttribute("successMsg", "Order successfully Accepted and will deliver shortly");
			 
		}else{	 
			 model.addAttribute("ErrorMsgDisplay", "Error in Accepting Order");
			 model.addAttribute("successMsgDisplay", "none");
		}
		
	    try{
            List<ProdCat> prodCat = ProdCatDao.getSelectCat();
            model.addAttribute("prodCat", prodCat);
            model.addAttribute("newForm", new CustOrderModel());
            boolean loadInitialData = true;
}

catch(Exception e){

            e.printStackTrace();

}
		return "od";
	}
	
	
	
	@RequestMapping( method = RequestMethod.POST, params = "ordother")
	public String reOrder(Model model, @ModelAttribute("newFormOffer") OrderOfferModel orderOfferModel, BindingResult result , HttpServletRequest request) {
		
		Customerorder existCustOrder = custOrderDao.getRec(orderOfferModel.getOrderId());
		Customerorder custOrderInsrt = new Customerorder();
		
		custOrderInsrt.setBuyMerchantId(null);
		custOrderInsrt.setCustomerRejMerchant((int) orderOfferModel.getMerchantId());
		custOrderInsrt.setOrdrStatus("A");
		custOrderInsrt.setOrderAcceptStatus("I");
		custOrderInsrt.setFirstName(existCustOrder.getFirstName());
		custOrderInsrt.setLastName(existCustOrder.getLastName());
		custOrderInsrt.setLatitude(existCustOrder.getLatitude());
		custOrderInsrt.setLongitude(existCustOrder.getLongitude());
		custOrderInsrt.setEmail(existCustOrder.getEmail());
		custOrderInsrt.setPhone(existCustOrder.getPhone());
		custOrderInsrt.setUserCredentialsId(existCustOrder.getUserCredentialsId());
		custOrderInsrt.setQuantity(existCustOrder.getQuantity());
		custOrderInsrt.setOrdrProduct(existCustOrder.getOrdrProduct());
		custOrderInsrt.setOrdrProductType(existCustOrder.getOrdrProductType());

		String errMsg = "";
		String errMsgSts = "N";
		Customerorder custOrder = new Customerorder();
		custOrder= custOrderDao.insertRec(custOrderInsrt);
		int resultOrder = custOrder.getId();
		CustOrderModel custOrderModelPass = new CustOrderModel();
		
		if (resultOrder >= 0){
			
			 model.addAttribute("ErrorMsgDisplay", "none");
			 model.addAttribute("orderId", resultOrder);
	         model.addAttribute("successMsgDisplay", "Order request " + resultOrder + "successfully sent to the merchnats");
	         model.addAttribute("successMsg", "Order request " + resultOrder + "successfully sent to the merchnats");
	         custOrderModelPass.setId(resultOrder);
		}
		else{
			 model.addAttribute("ErrorMsgDisplay", "Error in request Order");
	         model.addAttribute("successMsgDisplay", "none");
			
		}
		
		List<ProdCat> prodCat = ProdCatDao.getSelectCat();
		model.addAttribute("prodCat", prodCat);	
		model.addAttribute("newForm", custOrderModelPass);
		
		return "od";
	}
	
	@RequestMapping( method = RequestMethod.POST, params = "newprice")
	public String reOrderFromOther(Model model, @ModelAttribute("newFormOffer") OrderOfferModel orderOfferModel, BindingResult result , HttpServletRequest request) {
	
		String merchnatName = null;
		String resultOut = custOrderDao.newOffer( orderOfferModel.getOrderId(),orderOfferModel.getNewOfferPrice()); 
		CustOrderModel custOrderModelPass = new CustOrderModel();
		merchnatName = merchantDao.getMerchantName(orderOfferModel.getMerchantId());
		if(resultOut.equals("success")){
			 model.addAttribute("ErrorMsgDisplay", "none");
			 model.addAttribute("successMsgDisplay", "Merchant is checking the request ...");
			 model.addAttribute("successMsg", "Merchant is checking the request ...");
			 
			 
		}else{	 
			 model.addAttribute("ErrorMsgDisplay", "Error in sending the offer");
			 model.addAttribute("successMsgDisplay", "none");
		}
		
		
		model.addAttribute("reord", true);
		model.addAttribute("newFormOffer", orderOfferModel);
		model.addAttribute("merName", merchnatName);
		return "offer";
	}
	
	
	
	@RequestMapping( method = RequestMethod.POST, params = "reordsts")
	public String reOrderStatus(Model model, @ModelAttribute("newFormOffer") OrderOfferModel orderOfferModel, BindingResult result , HttpServletRequest request) {
	
		
             Customerorder existCustomerorder = custOrderDao.getRec(orderOfferModel.getOrderId());
		     String resultOut = "";
		     resultOut = existCustomerorder.getOrderAcceptStatus();
		
		if(resultOut.equals("C")){
			 model.addAttribute("ErrorMsgDisplay", "none");
			 model.addAttribute("successMsgDisplay", "Merchant has accepted the request");
			 model.addAttribute("successMsg", "Merchant has accepted the request");
			 model.addAttribute("reord", false);
			 
		}else if(resultOut.equals("R")){
			 model.addAttribute("ErrorMsgDisplay", "none");
			 model.addAttribute("successMsgDisplay", "Merchant has rejected the request");
			 model.addAttribute("successMsg", "Merchant has rejected the request");
			 model.addAttribute("reord", true);
			 
		}
		
		else{	 
			 model.addAttribute("successMsgDisplay", "Merchant is checking the request ...");
			 model.addAttribute("successMsg", "Merchant is checking the request ...");
			 model.addAttribute("ErrorMsgDisplay", "none");
			 model.addAttribute("reord", true);
		}
		
		
		
		model.addAttribute("newFormOffer", orderOfferModel);
		return "offer";
	}
	

	
}

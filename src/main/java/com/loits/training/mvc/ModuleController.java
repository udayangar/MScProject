package com.loits.training.mvc;

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









import com.loits.training.domain.Customerorder;
import com.loits.training.model.CustOrderModel;
import com.loits.training.model.ProdCat;
import com.loits.training.repo.CustOrderDao;
import com.loits.training.repo.ModuleDao;
import com.loits.training.repo.ProdCatDao;

/* Handing common theme related functions */
@Controller
public class ModuleController {

	 

	@Autowired
	ModuleDao moduleDao;
	@Autowired
	ProdCatDao ProdCatDao;
	@Autowired
	CustOrderDao custOrderDao;

	// authenticated user
	private String authUser;
	// extended name
	private String fullName = "Thisan Samarasinghe";

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
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {

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


	
	@RequestMapping(value = "/", method = RequestMethod.POST, params = "isrt")
	public String saveIntroducer(Model model, @ModelAttribute("newForm") CustOrderModel custOrderModel, BindingResult result , HttpServletRequest request) {
		
		HttpSession sess = request.getSession(); 			
		Customerorder customerorder = new Customerorder();
		customerorder.setLatitude(custOrderModel.getLatitude());  
		customerorder.setLongitude(custOrderModel.getLongitude());
		customerorder.setOrdrProduct(custOrderModel.getOrderProdut());
		customerorder.setQuantity(custOrderModel.getQuantity());
		customerorder.setUserCredentialsId(custOrderModel.getUserCredentialsId());
		customerorder.setEmail("Ramesh@yahoo.com");
		customerorder.setFirstName("Ramesh");
		customerorder.setLastName("Perera");
		 
		/*String authUser = (String) request.getSession().getAttribute("authUser");
		String loggedUserLvl = (String) request.getSession().getAttribute("loggedUserLvl");
		String companyCode = (String) request.getSession().getAttribute("globalCmp");
		String dbSystem = (String) request.getSession().getAttribute("dbSystem");
		*/
		
		String errMsg = "";
		String errMsgSts = "N";
		
		//String resultOrder = custOrderDao.insertRec(customerorder);
		//String validationSts = lsinDao.validateAll(companyCode , authUser , lsin , approveEnabled , false , dbSystem);
		String resultOrder= "success";
		if(resultOrder.equals("success")){
			
			 model.addAttribute("ErrorMsgDisplay", "none");

	         model.addAttribute("successMsgDisplay", "Order request successfully sent to the merchnat");
			
		}
		else{
			 model.addAttribute("ErrorMsgDisplay", "Error in request Order");

	         model.addAttribute("successMsgDisplay", "none");
			
		}
		
		List<ProdCat> prodCat = ProdCatDao.getSelectCat();
		model.addAttribute("prodType", prodCat);
        model.addAttribute("newForm", new CustOrderModel());
		
		return "od";
		
	}
	
}

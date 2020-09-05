package com.loits.training.mvc;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
//import java.nio.file.Files;
//import java.io.File;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MandateSigining {
	private List<byte[]> list;
	
	
	
	@RequestMapping(value = "/signMandate", method = RequestMethod.GET)
	public String signManGet(Model model, HttpServletRequest request) {
		model.addAttribute("Msg","Mandate sign page");

		return "mandate";
	}
	
	/*
	public MandateSigining(){
		
		System.out.println("mandate sigining");
	}

	@RequestMapping(value = "/signMandate", method = RequestMethod.POST)
	public String signManPost(@RequestParam("mandate") String data,Model model, HttpServletRequest request)//throws InvalidKeyException, IOException, Exception{ 
	{
		try{
      // String data = JOptionPane.showInputDialog("Type your message here");
       new MandateSigining(data, "KeyPair/privateKey").writeToFile("KeyPair/SignedData.txt");
      
       model.addAttribute("Msg","Mandate signing Success");
		} catch (IOException e) {
		model.addAttribute("Msg","Mandate signing Fail!");
		
	} catch (InvalidKeyException e) {
		model.addAttribute("Msg","Mandate signing Fail!");
		
	}catch (Exception e) {
		model.addAttribute("Msg","Mandate signing Fail!");
		
	}
		
		return "mandate";
	}
	

	//The constructor of Message class builds the list that will be written to the file.
	//The list consists of the message and the signature.
	public MandateSigining(String data, String keyFile) throws InvalidKeyException, Exception {
		list = new ArrayList<byte[]>();
		list.add(data.getBytes());
		list.add(sign(data, keyFile));
	}

	//The method that signs the data using the private key that is stored in keyFile path
	public byte[] sign(String data, String keyFile) throws InvalidKeyException, Exception{
		Signature rsa = Signature.getInstance("SHA1withRSA");
		rsa.initSign(getPrivate(keyFile));
		rsa.update(data.getBytes());
		return rsa.sign();
	}

	//Method to retrieve the Private Key from a file
	public PrivateKey getPrivate(String filename) throws Exception {
		//byte[] keyBytes = Files.readAllBytes(new File(filename).toPath());
		byte[] keyBytes = Files.readAllBytes(new File(filename).toPath());
		PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(keyBytes);
		KeyFactory kf = KeyFactory.getInstance("RSA");
		return kf.generatePrivate(spec);
	}

	//Method to write the List of byte[] to a file
	private void writeToFile(String filename) throws FileNotFoundException, IOException {
		File f = new File(filename);
		f.getParentFile().mkdirs();
		ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(filename));
	    out.writeObject(list);
		out.close();
		System.out.println("Your file is ready.");
	}

	
	*/
}

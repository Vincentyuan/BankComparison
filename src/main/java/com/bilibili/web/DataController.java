package com.bilibili.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.bilibili.DTO.dataStructure;
import com.bilibili.util.HibernateUtil;



@Controller
public class DataController {

	public DataController() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value="/request",method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	
	public String addData(@RequestBody dataStructure data){
		
		System.out.println("get post request"+data.getUsername());
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		 session.beginTransaction();

		 Date date=new Date();
		 data.setTime(date.toString());
		 data.setStatus("start");
		
	     session.persist(data);
	     
	     
	     
	     session.getTransaction().commit();
		 session.close();
		
		 System.out.println("Done");
		
		
		
		
		return "ok";
	}
	@RequestMapping(value="/request/{requestId}",method= RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	
	public dataStructure getData(@PathVariable("requestId") int requestId){
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		 session.beginTransaction();

		 // search
		  List  queryCity =  
	      		session.createSQLQuery("select * from presentation ").
	      		addEntity(dataStructure.class).list();
	    
	     dataStructure tmp=null;
	     
	     for (int i = 0; i < queryCity.size(); i++) {
	    	// System.out.println(((dataStructure)queryCity.get(i)).getRequestId()+"  "+(requestId)+"result :"+((dataStructure)queryCity.get(i)).getRequestId()(requestId));
			System.out.println(((dataStructure)queryCity.get(i)).getRequestId()==(requestId));	
	    	 if(((dataStructure)queryCity.get(i)).getRequestId().equals(requestId)){
					tmp=(dataStructure)queryCity.get(i);
					System.out.println("find it");
				}
					
			}
	     session.getTransaction().commit();
		 session.close();
		
		 System.out.println("response exactly data");
		
		
		return tmp;
	}
	
	
	
	@RequestMapping(value="/request",method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	
	public List<dataStructure> getData(){
		
		List<dataStructure> tmpDataStructures=new ArrayList<dataStructure>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		 session.beginTransaction();

		 // search
		  List  queryCity =  
	      		session.createSQLQuery("select * from presentation ").
	      		addEntity(dataStructure.class).list();
	    
	     dataStructure tmp=null;
	     for (int i = 0; i < queryCity.size(); i++) {
			tmpDataStructures.add((dataStructure)queryCity.get(i));
		}
	    
	     session.getTransaction().commit();
		 session.close();
		
		 System.out.println("Done");
		 return tmpDataStructures;
	}

	
}

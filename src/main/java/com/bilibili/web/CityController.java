package com.bilibili.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.hateoas.ResourceSupport;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.bilibili.entity.City;
import com.bilibili.util.HibernateUtil;



@Controller
public class CityController {

	@RequestMapping(value = "/city", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	
	public List<City> getCars() {
		Session session = HibernateUtil.getSessionFactory().openSession();  
        session.beginTransaction();  
        
       List  queryCity =  
        		session.createSQLQuery("select * from City").
        		addEntity(City.class).list();
       
       
       // session.get
        session.getTransaction().commit();  
        session.close();
        return queryCity;
	}
}

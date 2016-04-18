package test;

import java.util.List;

import org.hibernate.Session;

import com.bilibili.DTO.dataStructure;
import com.bilibili.util.HibernateUtil;

public class testdatastructure {

	public testdatastructure() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Session session = HibernateUtil.getSessionFactory().openSession();
		 session.beginTransaction();

		 // search
		  List  queryCity =  
	      		session.createSQLQuery("select * from presentation ").
	      		addEntity(dataStructure.class).list();
	    
	     dataStructure tmp=null;
	     
	     System.out.println(queryCity.size());
	     for (int i = 0; i < queryCity.size(); i++) {
				//if(((dataStructure)queryCity.get(i)).getRequestId().equals(requestId));
				tmp=(dataStructure)queryCity.get(i);
			//	System.out.println(((dataStructure)queryCity.get(i)).getRequestId());
				System.out.println(tmp.getUsername());
			}
	     session.getTransaction().commit();
		 session.close();
		
		 System.out.println("Done");
	}

}

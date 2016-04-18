package test;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.bilibili.entity.City;
import com.bilibili.util.HibernateUtil;

public class TestMain {
  public static void main(String[] args) {
	
	 Session session = HibernateUtil.getSessionFactory().openSession();
	 session.beginTransaction();

	 // search
	  List  queryCity =  
      		session.createSQLQuery("select * from City").
      		addEntity(City.class).list();
     for (int i = 0; i < queryCity.size(); i++) {
		System.out.println(((City)queryCity.get(i)).getCityName());
	}
     
    // session.createSQLQuery("insert into City (cityName,cityLocation) values ('beijing','hello');");
	 
     
     //insert 
     City city=new City();
    
     city.setCityName("beijing");
     city.setCityLocation("23");
    
       
     session.persist(city);
     
     // delete
     Query query= session.createQuery("delete from City where CityId=?");
     query.setInteger(0, 5);
   //  query.executeUpdate();
     
     session.getTransaction().commit();
	 session.close();
	 /*
	 Session sessionInsert=HibernateUtil.getSessionFactory().openSession();
	 sessionInsert.beginTransaction();
	 
	
	 sessionInsert.getTransaction().commit();
	 sessionInsert.close();
	 */
	 System.out.println("Done");
  }
}

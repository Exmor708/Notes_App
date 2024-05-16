package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import dto.User;

public class UserDao {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("biswajit");
	
	EntityManager em = emf.createEntityManager();
	
	EntityTransaction et = em.getTransaction();
	
	public void saveAndUpdateUser(User user) {
		
		et.begin();
		em.merge(user);
		et.commit();
		
		
	}
	
	public User fetchUserById(int id){
			
	 return em.find(User.class, id);
		
	}
	   public User fetchUserByEmailAndPassword(String email, String password) {
	        Query query = em.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.password = :password");
	        query.setParameter("email", email);
	        query.setParameter("password", password);
	        return (User) query.getSingleResult();
	    }
	
	public List<User> fetchAllUser(){
				
		Query query = em.createQuery("select users from user users");
		
		List<User> users=query.getResultList();
		
		for(User u: users) {
			u.getId();
			u.getAge();
			u.getEmail();
			u.getName();
			u.getMobile();
		
		}
		return users;
		
	}

}
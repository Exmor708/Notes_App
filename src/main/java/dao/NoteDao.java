package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import dto.Notes;

public class NoteDao {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("biswajit");
	
	EntityManager em = emf.createEntityManager();
	
	public void fetchNotesById(int id){
		
		Notes note = em.find(Notes.class, id);
		
	}
	
	public List<Notes> fetchAllUser(){
		
		
		Query query = em.createQuery("select users from user users");
		
		List<Notes> notes=query.getResultList();
		
		for(Notes n: notes) {
			n.getId();
			n.getTitle();
			n.getDescription();
		
		}
		return notes;
		
	}


}
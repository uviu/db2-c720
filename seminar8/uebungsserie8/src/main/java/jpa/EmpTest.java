package jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class EmpTest {

    public static void main(String[] args) {
        EntityManagerFactory emf = null;
        EntityManager em = null;
        EntityTransaction tx = null;

        try {
            // Create EntityManagerFactory 
            emf = Persistence.createEntityManagerFactory("default");

            // Create EntityManager
            em = emf.createEntityManager();

            // Start transaction
            tx = em.getTransaction();
            tx.begin();

            // Create test department
            Dept dept = new Dept();
            dept.setId((short) 10);
            dept.setDname("TEST DEPT");
            dept.setLoc("TEST LOC");

            // Check if department already exists
            Dept existingDept = em.find(Dept.class, (short) 10);
            if (existingDept == null) {
                em.persist(dept);
            } else {
                dept = existingDept;
            }

            // Create test employee
            Emp emp = new Emp();
            emp.setId((short) 1);
            emp.setEname("TEST EMP");
            emp.setJob("ANALYST");
            emp.setDeptno(dept);

            // Check if employee already exists
            Emp existingEmp = em.find(Emp.class, (short) 1);
            if (existingEmp == null) {
                em.persist(emp);
            }

            // Commit transaction
            tx.commit();

            // Test reading the data
            System.out.println("Testing read operations:");
            Emp foundEmp = em.find(Emp.class, (short) 1);
            if (foundEmp != null) {
                System.out.println("Found employee: " + foundEmp.getEname());
                System.out.println("Department: " + foundEmp.getDeptno().getDname());
            }

        } catch (Exception e) {
            // Handle any exceptions
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            // Clean up resources
            if (em != null && em.isOpen()) {
                em.close();
            }
            if (emf != null && emf.isOpen()) {
                emf.close();
            }
        }
    }
}
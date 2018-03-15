package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import beans.ProductBean;
import util.DataManager;

public class MenuDAO {
	
    private static  Connection conn = null;  
    private static PreparedStatement pst = null;
    private static ArrayList<ProductBean> menu ;
    
	public static ArrayList<ProductBean> listMenu(String lng){
		ResultSet rs = null;
		
		try {  
			conn = new DataManager().getConnection();
  
			if(lng.equalsIgnoreCase("en"))
	            pst = conn.prepareStatement(""
	            		+ "SELECT *"
	            		+ "FROM view_en ");
			else
	            pst = conn.prepareStatement(""
	            		+ "SELECT *"
	            		+ "FROM view_fr ");
            
            rs = pst.executeQuery();
            menu = new ArrayList<ProductBean>();
            while (rs.next()) {
            	ProductBean product = new ProductBean(
            			rs.getString("id"),
            			rs.getString("category"), 
            			rs.getString("image"), 
            			rs.getString("name"),
            			rs.getString("ingredients"), 
            			rs.getDouble("price"), 
            			rs.getString("description"),
            			rs.getString("size"));
            	
                //Code to fill up your DTO
                menu.add(product);
            }
            
            

		} catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
		return menu;
	}

}

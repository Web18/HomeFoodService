package com.homefood.util;


import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;


import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import javax.xml.xpath.XPathConstants;
import org.w3c.dom.Document;
public class AddressValidation {
	
	/*
	 * This function is to convert a post code into lat and long strings 
	 */
	  public String[] getLatLongPositions(String address) throws Exception
	  {
	    int responseCode = 0;
	    String api = "http://maps.googleapis.com/maps/api/geocode/xml?address=" + URLEncoder.encode(address, "UTF-8") + "&sensor=true";
	    URL url = new URL(api);
	    HttpURLConnection httpConnection = (HttpURLConnection)url.openConnection();
	    httpConnection.connect();
	    responseCode = httpConnection.getResponseCode();
	    if(responseCode == 200)
	    {
	      DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();;
	      Document document = builder.parse(httpConnection.getInputStream());
	      XPathFactory xPathfactory = XPathFactory.newInstance();
	      XPath xpath = xPathfactory.newXPath();
	      XPathExpression expr = xpath.compile("/GeocodeResponse/status");
	      String status = (String)expr.evaluate(document, XPathConstants.STRING);
	      if(status.equals("OK"))
	      {
	         expr = xpath.compile("//geometry/location/lat");
	         String latitude = (String)expr.evaluate(document, XPathConstants.STRING);
	         expr = xpath.compile("//geometry/location/lng");
	         String longitude = (String)expr.evaluate(document, XPathConstants.STRING);
	         return new String[] {latitude, longitude};
	      }
	      else
	      {
	         throw new Exception("Error from the API - response status: "+status);
	      }
	    }
	    return null;
	  }
	  
	  
	  /*
	   * This Function is to calculate the distance between 2 lat and 2 long and return the value in Kilometers 
	   */
	  public double haversine(double lat1, double lng1, double lat2, double lng2) {
		    int r = 6371; // average radius of the earth in km
		    double dLat = Math.toRadians(lat2 - lat1);
		    double dLon = Math.toRadians(lng2 - lng1);
		    double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
		       Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) 
		      * Math.sin(dLon / 2) * Math.sin(dLon / 2);
		    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		    double d = r * c;
		    return d;
		}


}

global with sharing class Deserialization {
	
	
	/* 
* An Apex Class used as Wrapper class for deseralizing responce from JiraSfCaseGet and JiraSfCaseUpsert class
*/


			
		public class AdobeEvents
		{
		  
		    public List<myevents> myevents;
		    
		}    
		
		public class myevents
		{
		  
		    public event events;
		}    
		
		public class event
		{
		    public String scoid;
		    public String name;
		    public String domainname;    
		    public String datebegin;
		    public String dateend;
		    public String expired;
		            
		}   
		
	   
  }
public with sharing class HomeLogOutController {

public HomeLogOutController (){}
     
public PageReference Move()

        {

            PageReference Page = new PageReference('/apex/successVf');
            Page.setRedirect(true);
            return Page;

        }
        
        
       
        
}
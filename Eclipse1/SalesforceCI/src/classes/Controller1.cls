public with sharing class Controller1 {
     
public PageReference Move()

        {

        PageReference Page = new PageReference('https://c.ap2.visual.force.com/apex/Thanku');

        Page.setRedirect(true);

        return Page;

        }
        
        
        public PageReference newLogin()

        {

        PageReference Page = new PageReference('https://ap2.salesforce.com/secur/login_portal.jsp?orgId=00D28000001NODc&portalId=06028000000Pbbv');

        Page.setRedirect(true);

        return Page;

        }
        
}
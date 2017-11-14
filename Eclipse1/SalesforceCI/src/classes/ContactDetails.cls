public class ContactDetails {

    Contact con;
    public Contact getCon() {
    con=[Select Id,Title,Name,Phone,Email,Department,Fax,LeadSource,Description From Contact Where Id In (Select ContactId From User Where Id=:UserInfo.getUserId())];
    return con;
    }
    
     public PageReference updateNow(){
     update con;
     PageReference Page = new PageReference('https://c.ap2.visual.force.com/apex/contactdetailsVf');
     Page.setRedirect(true);
     return Page;   
  
  }
   
   public PageReference cancelNow(){
     update con;
     PageReference Page = new PageReference('https://c.ap2.visual.force.com/apex/contactsVf');
     Page.setRedirect(true);
     return Page;  
  }

    public PageReference logOut() {
    PageReference Page = new PageReference('/apex/successVf');
    Page.setRedirect(true);
    return Page;

  }  
  
   public PageReference view() {
    PageReference Page = new PageReference('/apex/contactdetailsVf');
    Page.setRedirect(true);
    return Page;

  }  
   
    public PageReference goback() {
    PageReference Page = new PageReference('/apex/contactsVf');
    Page.setRedirect(true);
    return Page;

  }  
   
}
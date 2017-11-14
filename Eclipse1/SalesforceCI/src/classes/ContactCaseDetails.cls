Public class ContactCaseDetails{

   Case c = new Case(); 
   public Case getC(){ 
   return c;
  }
    
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController
                (Database.getQueryLocator(
                [Select CaseNumber,Subject,Priority,Status,Description From Case ]));
                //Where ContactId In (Select ContactId From User Where Id=:UserInfo.getUserId())
            }
            return setCon;
        }
        set;
    }
 
   public List<Case> getCases() {
        return (List<Case>) setCon.getRecords();
    } 
      
  public PageReference Now(){
     insert c;
     PageReference Page = new PageReference('https://c.ap2.visual.force.com/apex/QuerySubmitVf');
     Page.setRedirect(true);
     return Page;   
  
  } 
  
  public PageReference cancelNow(){
     insert c;
     PageReference Page = new PageReference('https://c.ap2.visual.force.com/apex/casesVf');
     Page.setRedirect(true);
     return Page;   
  
  } 
 
  public PageReference cas(){
     PageReference Page = new PageReference('/apex/successVf');
     Page.setRedirect(true);
     return Page;
     }
     
     
     public PageReference save(){
     PageReference Page = new PageReference('/apex/commentVf');
     Page.setRedirect(true);
     return Page;
     }
     public PageReference view(){
     PageReference Page = new PageReference('/apex/CaseListVf');
     Page.setRedirect(true);
     return Page;
     
     }
     
     public PageReference submit(){
     PageReference Page = new PageReference('/apex/QuerySubmitVf');
     Page.setRedirect(true);
     return Page;
     

   }
   
     public PageReference goback(){
     PageReference Page = new PageReference('/apex/casesVf');
     Page.setRedirect(true);
     return Page;
     }
     
      public PageReference goback1(){
     PageReference Page = new PageReference('/apex/CaseListVf');
     Page.setRedirect(true);
     return Page;
     }
     
   }
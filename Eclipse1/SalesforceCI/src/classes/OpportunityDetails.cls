Public class OpportunityDetails{

   Opportunity c = new Opportunity (); 
   public Opportunity getC(){ 
   return c;
  }
    
    public ApexPages.StandardSetController setCon {
        get {
         
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController
            
                (Database.getQueryLocator([select name,amount from opportunity where LightiningEd__Contact_Name__c In (select ContactId from User where Id =: UserInfo.getUserId())]));
            }
            return setCon;
        }
        set;
    }
   @AuraEnabled
   public List<Opportunity> getOpportunities() {
   
        return (List<Opportunity>) setCon.getRecords();
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
     PageReference Page = new PageReference('https://locationapp-dev-ed.my.salesforce.com/apex/OpportunitiesListVf');
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
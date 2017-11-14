Public class ContactCaseComments{

     Case c = new Case(); 
     public Case getC(){ 
     return c;
  }
      
   public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                [Select Id,Subject From Case Where ContactId In (Select ContactId From User Where Id=:UserInfo.getUserId())]));

            }
            return setCon;
        }
        set;
    }
    
     public List<Case> getCases() {
        return (List<Case>) setCon.getRecords();
    }
}
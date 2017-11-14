public class MyController{

private Account acc;
   public MyController(){
      acc=[SELECT Id,Name FROM Account WHERE Id=:ApexPages.currentPage().getParameters().get('id')];
      }
   public Account getAcc(){
   return acc;     
   }      
   public PageReference save(){
         update acc;
         return null;   
   }
   
   }
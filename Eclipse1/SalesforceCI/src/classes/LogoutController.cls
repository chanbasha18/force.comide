public class LogoutController { 
    public LogoutController(CaseCommentController controller) {

    }



    public LogoutController (ApexPages.StandardController controller) {}
    
    public PageReference cas()
        {

        PageReference Page = new PageReference('/apex/successVf');

        Page.setRedirect(true);

        return Page;

        }  
        
     
}
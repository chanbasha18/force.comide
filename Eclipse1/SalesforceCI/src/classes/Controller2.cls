public class Controller2 { 

   
    public PageReference logOut()
        {

        PageReference Page = new PageReference('/apex/successVf');

        Page.setRedirect(true);

        return Page;

        }  
        
     
}
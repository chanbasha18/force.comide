public class GoBackController{

    public GoBackController(CaseCommentController controller) {

    }


    public GoBackController(ApexPages.StandardController controller) {

    }


public PageReference goback1(){
     PageReference Page = new PageReference('/apex/CaseListVf');
     Page.setRedirect(true);
     return Page;
     }



}
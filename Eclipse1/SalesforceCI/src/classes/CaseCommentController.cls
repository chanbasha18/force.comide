public class CaseCommentController {
    public CaseCommentController() {}

    private final Case sourceCase;
    public List<CaseComment> CaseCommentsSortedASC{get; set;}
    public List<CaseComment> CaseCommentsSortedDESC{get; set;}
    public string cId {get;set;}

    public CaseCommentController (apexPages.StandardController stdCon) {
        this.sourceCase = (Case)stdCon.getRecord();
        this.CaseCommentsSortedASC = new List<CaseComment>();
        this.CaseCommentsSortedDESC = new List<CaseComment>();
        cId = '';
        sortCaseComments();
    }
    
    private void sortCaseComments() {
        for (Case c : [SELECT (SELECT CommentBody, CreatedById, CreatedBy.Name, CreatedDate, ParentId 
                       FROM CaseComments ORDER BY CreatedDate ASC) FROM Case WHERE Id = :sourceCase.Id]) {
            for (CaseComment cc : c.CaseComments) {
                this.CaseCommentsSortedASC.add(cc);
            }

            for (integer x = this.CaseCommentsSortedASC.Size()-1; x >= 0; x--) {
            this.CaseCommentsSortedDESC.add(this.CaseCommentsSortedASC[x]);
            }
        }
    }

    public PageReference Edit() {
        system.debug(cId + ' ' + sourceCase.Id);
        return new PageReference('/' + cId + '/e?parent_id=' + sourceCase.Id + '&retURL=' + sourceCase.Id);
    }

    public PageReference NewRecord() {
        system.debug(cId + ' ' + sourceCase.Id);
        return new PageReference('/00a/e?parent_id=' + sourceCase.Id + '&retURL=' + sourceCase.Id);
    }
    
     CaseComment csc = new CaseComment();
    
     public CaseComment getcsc(){
 //    csc=  [SELECT (SELECT CommentBody  FROM CaseComments) FROM Case WHERE Id = :sourceCase.Id];  
     return csc;
     }
       
     public PageReference save()  {                         //for Back to page  
        csc.parentid = sourceCase.id;
               
        insert csc;

        PageReference Page = new PageReference('https://ap2.salesforce.com/apex/casecommentVf?id='+ sourceCase.id);

        Page.setRedirect(true);

        return Page;

        } 
            
}
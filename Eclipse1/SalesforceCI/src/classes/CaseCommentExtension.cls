public with sharing class CaseCommentExtension {
    private final Case caseRec;
    public CaseComment comment {get; set;}

    public CaseCommentExtension(ApexPages.StandardController controller) {
        caseRec = (Case)controller.getRecord();
        comment = new CaseComment();
        comment.parentid = caseRec.id;
    }

    public PageReference addComment() {
        insert comment;
        comment = new CaseComment();
        comment.parentid = caseRec.id;
        PageReference Page = new PageReference('https://c.ap2.visual.force.com/apex/comment?id='+ caseRec.id);
        Page.setRedirect(true);
        return Page;
    }   
}
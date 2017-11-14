public class OpportunityController {

    @AuraEnabled
    public static List<Opportunity> getOpportunities() {
        List<Opportunity> opportunities = [select name,amount,closedate from Opportunity where LightiningEd__Contact_Name__c In (select ContactId from User where Id =: UserInfo.getUserId())];
        //where LightiningEd__Contact_Name__c In (select ContactId from User where Id =: UserInfo.getUserId())
        return opportunities;
    }
    
    @AuraEnabled
    public static String getUserName() {
    return userinfo.getName();
        
  }
}
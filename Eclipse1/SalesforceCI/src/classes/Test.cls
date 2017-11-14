public with sharing class Test {

    @AuraEnabled
    public static List<Opportunity> getOpportunities() {
        List<Opportunity> opportunities = [select name,amount from opportunity ];
        return opportunities;
    }
}
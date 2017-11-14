trigger simpleTrigger on Account (before insert) {

    for (Account a : Trigger.new) {}
     Contact[] cons = [SELECT LastName FROM Contact WHERE AccountId IN :Trigger.new];

	}
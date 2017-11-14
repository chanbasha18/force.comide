public class testemail{

public final List<Id> contactids;
public List<Contact> con;

public testemail(Apexpages.StandardController controller){

con= [select id from Contact limit 250] ;
for(Integer i=0;i<250;i++){
   contactids.add(con[i].Id);
  }
}
public void sentEmail(){
Messaging.MassEmailMessage mail= new Messaging.MassEmailMessage ();
mail.setTargetObjectIds(contactids);
Messaging.sendEmail(new Messaging.MassEmailMessage[]{mail});

 }
}
public class AdobeConnectEvents{     
   
   // public List<EventWrap> eventWrapperList{get;set;}   
    public  static void getParticipants(String username, String password){  
        
       // eventWrapperList = new List<EventWrap>();
        Http http = new Http();
        HttpRequest req =  new HttpRequest();  
        HttpResponse res =  new HttpResponse();  
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);              
        req.setEndpoint('https://meet64541292.adobeconnect.com/api/xml?account-id=1290290238&session=apac1breezuanwoz6kfwacfkef&action=report-my-events');                      
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept','application/json'); 
        try {
            res = http.send(req); 
            System.debug('MyResult == :'+res.getBody());
            
            XMLparse s = new XMLparse(res.getBody());
        
           /* 
            if(res.getstatusCode() == 200 && res.getbody()!= null){
              eventWrapperList=(List<EventWrap>)json.deserialize(res.getBody(),List<EventWrap>.class);

            }
*/
               
            //Deserialization.AdobeEvents theresult = (Deserialization.AdobeEvents)JSON.deserialize(res.getBody(), Deserialization.AdobeEvents.class);
            //System.debug('JSON data'+theresult);
        }   catch(System.CalloutException e){
               System.debug('Callout error: '+ e);
               
        }

        
         //return eventWrapperList;
       
  }
                      
}
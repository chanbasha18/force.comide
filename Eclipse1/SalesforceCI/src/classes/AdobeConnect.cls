global with sharing class AdobeConnect{     
   
         
    public static HttpResponse getParticipants(String username, String password, String endpointUrl){  
        
      
        Http http = new Http();
        HttpRequest req =  new HttpRequest();  
        HttpResponse res =  new HttpResponse();  
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');             
        req.setEndpoint(endpointUrl+'');                      
        req.setMethod('GET');
    
        try {
            res = http.send(req);
            System.debug('MyResult == :'+res.getBody());
        } catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            System.debug(res.toString());
        }
        
        return res;
       
  }
    
          
    
}
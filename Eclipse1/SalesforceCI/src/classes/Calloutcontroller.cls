public class Calloutcontroller {

public List<consolewrap> ConsoleWrapperList{get;set;}

public List<consolewrap> getperformcallout(){

ConsoleWrapperList = new List<consolewrap>();

HttpRequest req = new HttpRequest();

HttpResponse res = new HttpResponse();

Http http = new Http();

req.setEndpoint('https://raw.githubusercontent.com/parthiban019/samplejson/master/student.json');

req.setMethod('GET');

res = http.send(req);

if(res.getstatusCode() == 200 && res.getbody() != null){

ConsoleWrapperList=(List<consolewrap>)json.deserialize(res.getbody(),List<consolewrap>.class);

}

return consolewrapperlist;

}

}
global class XMLparse{
    
    public string XMLString {get;set;}
    private list<AdobeEvents__c> lstevents{get;set;}

    LightiningEd__AdobeEvents__c adobeevent;
    
    //public XMLparse(){}
    
    public XMLparse(){
        lstevents = new list<AdobeEvents__c>();
//      XMLString1 = XMLString;
        XMLString = '<?xml version="1.0" encoding="utf-8"?><my-events><event sco-id="1290617895" type="event" icon="event" permission-id="host"><name>Adobe connect demo</name><domain-name>meet64541292.adobeconnect.com</domain-name><url-path>/demo/</url-path><date-begin>2017-11-02T19:30:00.000+05:30</date-begin><date-end>2017-11-03T18:45:00.000+05:30</date-end><expired>true</expired><duration>23:15:00.000</duration></event><event sco-id="1290640959" type="event" icon="event" permission-id="view"><name>salesforce demo</name><domain-name>meet64541292.adobeconnect.com</domain-name><url-path>/dmeosfsf/</url-path><date-begin>2017-11-02T19:30:00.000+05:30</date-begin><date-end>2017-11-02T19:45:00.000+05:30</date-end><expired>true</expired><duration>00:15:00.000</duration></event><event sco-id="1290643314" type="event" icon="event" permission-id="view"><name>Test</name><domain-name>meet64541292.adobeconnect.com</domain-name><url-path>/testadobe/</url-path><date-begin>2017-11-02T18:45:00.000+05:30</date-begin><date-end>2017-11-02T20:00:00.000+05:30</date-end><expired>true</expired><duration>01:15:00.000</duration></event><event sco-id="1292076280" type="event" icon="event" permission-id="view"><name>test1</name><domain-name>meet64541292.adobeconnect.com</domain-name><url-path>/test1/</url-path><date-begin>2017-11-08T18:00:00.000+05:30</date-begin><date-end>2017-11-08T19:00:00.000+05:30</date-end><expired>true</expired><duration>01:00:00.000</duration></event><event sco-id="1292084866" type="event" icon="event" permission-id="host"><name>TestEvent</name><domain-name>meet64541292.adobeconnect.com</domain-name><url-path>/testevent/</url-path><date-begin>2017-11-08T17:45:00.000+05:30</date-begin><date-end>2017-11-09T18:45:00.000+05:30</date-end><expired>false</expired><duration>1d 01:00:00.000</duration></event></my-events>';
        DOM.Document doc=new DOM.Document();
        try{
            doc.load(XMLString);
            DOM.XmlNode rootNode=doc.getRootElement();
            parseXML(rootNode);
            lstevents.add(adobeevent);
            insert lstevents;
        }catch(exception e){
        
            system.debug(e.getMessage());
            
        }//return lstevents;
    }
    
    private List<AdobeEvents__c> parseXML(DOM.XMLNode node) {
        
        if (node.getNodeType() == DOM.XMLNodeType.ELEMENT) {
        
            if(node.getName()=='event'){
                if(adobeevent!=null)
                    lstevents.add(adobeevent);
                adobeevent = new AdobeEvents__c();
                
            }
            if(node.getName()=='name')
                adobeevent.name=node.getText().trim();
            if(node.getName()=='domain-name')
                adobeevent.LightiningEd__domain_name__c=node.getText().trim();
            if(node.getName()=='date-begin')
                adobeevent.LightiningEd__date_begin__c=node.getText().trim();
            if(node.getName()=='date-end')
                adobeevent.LightiningEd__date_end__c=node.getText().trim();
            if(node.getName()=='expired')
                adobeevent.LightiningEd__expired__c=node.getText().trim();
            }
          for(Dom.XMLNode child: node.getChildElements()) {
            parseXML(child);
        }
         return lstevents;
    } 
   
    public List<AdobeEvents__c> getEventsList() {

        return lstevents;

    }

}
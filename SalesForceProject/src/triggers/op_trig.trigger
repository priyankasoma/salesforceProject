trigger op_trig on Top_X_Designation__c (after insert) {
List<Top_X_Designation__c> Desig = Trigger.new;
List<Contact > oppList = new List<Contact >();
for(Top_X_Designation__c check :Desig)
{
if(check.Type__c == 'Contract Flow Down/Handoff' && check.Document_Attached__c == True)
{
Contact opp = new Contact ();
opp.Handoff_Attached__c = 'True
opp.lastname = 'Hello';
oppList.add(opp);
system.debug('i am hetest ');
}
insert oppList;
} 
}
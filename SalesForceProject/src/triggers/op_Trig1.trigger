trigger op_Trig1 on Location__c (after insert,after update){
List<Location__c> location = Trigger.new;
List<state__c> state = new List<state__c>();
for(Location__c check : location )
{
if(check.Status__c == 'Active'){
State__c stat = new State__c(Location__c  = check.id);
stat.Active_Customer_project__c = True;
stat.Name = check.state_optional__c;
state.add(stat);
}
insert state;
}
}
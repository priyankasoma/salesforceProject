trigger studentCount on IntergerValue__c (After insert,After delete,After update) {
 
   public integer total_used;
 
    Set<Id> TeacherIdSet = new Set<Id>();
    
    Map<Id,Integer> MapCount = new Map<Id,Integer>();
    
    List<Teacher1__c> teacherList = new List<Teacher1__c>();
    
    Teacher1__c tech = new Teacher1__c();
    
    if (Trigger.isInsert) {
     
        for (IntergerValue__c initr : Trigger.new) {
        
            TeacherIdSet.add(initr.Teacher__c);   
              
            for(List<AggregateResult> results : [SELECT Count(id) from IntergerValue__c where Teacher__c in :TeacherIdSet])
             
             {
        
             total_used = (Integer) results[0].get('expr0');

             system.debug ('::total_used ::' +total_used );
              system.debug ('::priyanka ::' +total_used );
         
             MapCount.put(initr.Teacher__c, total_used);
             
             system.debug('MapCount--- '+MapCount);
      
             if(MapCount.size()>0 && MapCount!= null){
        
             for(Id Techid: MapCount.keyset())
              {
               system.debug('MapCount.keyset()--- '+MapCount.keyset());
               tech.id = Techid;
                tech.StudentCount__c = total_used;
                   
                teacherList.add(tech);
                   
                  system.debug ('::teacherList::' +teacherList );
                   }
                  } 
                 }  
              }       
            }
           update teacherList;
        }
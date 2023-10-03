trigger ContactTrigger on Contact (after insert, after update, after delete) {
    
    List<Account> accUpdateList = new List<Account>();
    List<Contact> conList = Trigger.isDelete ? Trigger.old:Trigger.new;
    Set<Id> accIds  = new Set<Id>();
    for (Contact c: conList)  {
        accIds.add(c.AccountId);
    }
    List<Account> accList = [Select Name, (Select Id from Contacts)  from Account WHERE Id in: accIds ];
    for (Account a: accList) {
        List<Contact> s = a.Contacts;
        System.debug('Account:' + a.Name + ' No. of Contacts: '+ s.size()); 
        a.Number_of_Contacts__c = s.size();
        accUpdateList.add(a);
    }
    update accUpdateList;
}
public with sharing class contactTriggerHandler 
{
    public static void countContact(list<Contact> lstContact)
    {
        set<Id> AccIdsSet = new set<Id>();
          for(contact con : lstContact)
          {
            if(con.AccountId != Null)
            {
                AccIdsSet.Add(con.AccountId);
            }
          }
        if(! AccIdsSet.IsEmpty())
        {
            list<Account> lstAccounts = new list<Account>();
          list<Account> lstAcc =[SELECT Id, Number_Of_Contacts__c (SELECT Id FROM Contacts) FROM Account WHERE Id IN:AccIdsSet];

          if(! lstAcc.IsEmpty())
          {
             for(Account acc : lstAcc)
             {
                acc.Number_Of_Contacts__c = lstAcc.Contacts.Size();
                lstAccounts.Add(acc);   
             }
          }
          if(! lstAccounts.IsEmpty())
          {
            Update lstAccounts;
          }
        }
    }
}
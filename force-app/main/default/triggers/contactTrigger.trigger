trigger contactTrigger on Contact (after insert, after update,after delete,after undelete) 
{
   if(trigger.isAfter &&(trigger.isInsert || trigger.isUpdate || trigger.isUndelete))
   {
       contactTriggerHandler.countContact(trigger.new);
   }
   if(trigger.isAfter && trigger.isDelete)
   {
      contactTriggerHandler.countContact(trigger.old);
   }
}
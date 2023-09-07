({
    doInit : function(component, event, helper) 
    {
      var action = component.get("c.getRecentAccounts");
      action.setCallback(this, function(response){
          var state = response.getState();
          if(state === "SUCCESS"){
            component.set("v.recentAccounts", response.getReturnValue());
          }
          else {
            console.log("Error while fatching recent account"+ state);
          }
      });
      $A.enqueueAction(action); 
    }
})

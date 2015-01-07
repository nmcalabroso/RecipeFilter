import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    destroySession: function(){
      var self = this;
      if(typeof $.cookie("user_credentials") !== undefined){
       $.ajax({
        url: '/api/users/logout',
        type: 'DELETE',
        success: function(data){
          self.transitionToRoute('/');
        }
       }); 
      }
    }
  }
});

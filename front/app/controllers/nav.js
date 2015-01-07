import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    createSession: function(){
      var self = this;
      var login = this.get('username');
      var password = this.get('password');

      if(!Ember.isEmpty(login) && !Ember.isEmpty(password)){
        $.post(
            '/api/users/login',
            {"user_session": {"login":login, "password":password}},
            function(data){
              $('#login').modal('hide');
              self.transitionToRoute("/recipes");
          });
      }
    },
    
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
  },

});

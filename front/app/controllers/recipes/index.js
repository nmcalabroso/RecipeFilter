import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    createRecipe: function(){
      var self = this;
      var name = this.get('newTitle');
      var description = this.get('newDescription');      

      if(!Ember.isEmpty(name) && !Ember.isEmpty(description)){
        $.post(
            '/api/recipes/',
            {"recipe": {"name":name, "description":description}},
            function(data){
              $('#createRecipe').modal('hide');
              $('#success').modal('show');
        });
      }
    }



  }
});

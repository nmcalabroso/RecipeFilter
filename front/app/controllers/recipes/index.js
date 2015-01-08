import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    createRecipe: function(){
      var self = this;
      var name = this.get('newTitle');
      var description = this.get('newDescription');      

      // save to api
      if(!Ember.isEmpty(name) && !Ember.isEmpty(description)){
        $.post(
            '/api/recipes/',
            {"recipe": {"name":name, "description":description}},
            function(data){
              $('#createRecipe').modal('hide');
              $('#success').modal('show');
        });

        // save record
        var recipe = self.store.createRecord('recipe', {
          name: name,
          description: description
        });

        recipe.save();

        // prepend recipe
        var toPrepend = "<h4><a href=\"/recipes/edit\">"+name+"</a></h4>";
        toPrepend = toPrepend + "\n<h4><small>"+description+"</small></h4>";
        toPrepend = toPrepend + "\n<br>";
        $('#myrecipes').prepend(toPrepend);
      }
    }



  }
});

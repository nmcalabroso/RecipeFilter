import Ember from 'ember';
import ajax from 'ic-ajax';

export default Ember.Route.extend({ 
  model: function(){
    self = this;
    return ajax({
      url: 'api/recipes/',
      type: 'get'
    }).then(function(data){
      data.forEach(function(sample){
        console.log(sample);
        var recipe = self.store.createRecord('recipe', {
          recipe_id: sample.id,
          name: sample.name,
          description: sample.description
        });
      });

      return self.store.all('recipe');
    });


  }
});

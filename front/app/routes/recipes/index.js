import Ember from 'ember';
import ajax from 'ic-ajax';

export default Ember.Route.extend({ 
  model: function(){
    var data = ajax({
      url: 'api/recipes/',
      type: 'get'
    });


    // .then(function(data){
    //   console.log(data);
    //   return data;
    // });

    // data.forEach(function(sample){
    //   console.log(sample);
    // });


    // data.each(function(sample){
    //   console.log(sample);
      // var recipe = this.store.createRecord('recipe', {
      //   name: sample.name,
      //   description: sample.description
      // });

      // recipe.save();
    // });      


    // return this.store.find('recipe');
    return data;



  }
});

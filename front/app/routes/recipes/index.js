import Ember from 'ember';
import ajax from 'ic-ajax';

export default Ember.Route.extend({ 
  model: function(){
    return ajax({
      url: 'api/recipes/',
      type: 'get'
    }).then(function(data){
      console.log(data);
      return data;
    });
  }
});

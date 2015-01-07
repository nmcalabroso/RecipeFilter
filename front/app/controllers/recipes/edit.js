import Ember from 'ember';

export default Ember.Controller.extend({
  order: 0,
  actions: {
    editStep: function(){
      $('#saved').modal('show');
    },

    createStep: function(){
      this.set('order', this.get('order')+1);
      // var step = this.store.createRecord('step', {
      //   description: this.get('newStep'),
      //   order: this.get('order')
      // });

      // step.save();

      var newlabel = document.createElement("Label");
      newlabel.innerHTML = this.get('newStep').trim();
      newlabel.setAttribute("for", "steps");
      $('#add-steps').append(newlabel);
      $('#add-steps').append("<br><br>");
      this.set('newStep', '');
    }
  }
});

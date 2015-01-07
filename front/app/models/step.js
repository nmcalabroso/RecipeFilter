import DS from 'ember-data';

export default DS.Model.extend({
  description: DS.attr(),
  order: DS.attr()  
});

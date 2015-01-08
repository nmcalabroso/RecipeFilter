import DS from 'ember-data';

export default DS.Model.extend({
  recipe_id: DS.attr(),
  name: DS.attr('string'),
  description: DS.attr(),
});

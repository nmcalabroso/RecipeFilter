import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr("string"),
  description: DS.attr("text")
}).reopenClass({
  FIXTURES: [
    {
      id: 1,
      title: "Curry Recipe",
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis veniam reprehenderit, provident adipisci! Doloribus rerum quisquam atque quibusdam harum, expedita odio consequuntur laborum sapiente veniam aspernatur eos quos dolor dolorem!"
    },
  ]
});

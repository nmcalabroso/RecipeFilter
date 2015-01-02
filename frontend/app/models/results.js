import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr("string"),
  description: DS.attr("text")
}).reopenClass({
  FIXTURES: [
    {
      id: 1,
      title: "Curry Recipe 01",
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium provident consequatur aut eaque quo unde incidunt. Quidem dolorem voluptas, quis, itaque saepe obcaecati dolor libero rerum assumenda corrupti. Quos, obcaecati!"
    },
    {
      id: 2,
      title: "Curry Recipe 02",
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit ad quod iste incidunt placeat qui, animi assumenda nam excepturi distinctio aperiam ratione sed, molestiae saepe quis ipsam quaerat aut numquam!"
    },
    {
      id: 3,
      title: "Curry Recipe 03",
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae autem dolorum natus velit aperiam fugiat, maxime impedit possimus minus quos, quis, expedita reiciendis, perferendis cumque quasi assumenda repudiandae in quas."
    }
  ]
});

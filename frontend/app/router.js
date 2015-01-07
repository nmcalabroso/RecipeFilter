import Ember from "ember";
import config from "./config/environment";

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  //Search
  this.resource("search", {
    path: "/"
  });
  this.route("results");
  this.route("recipe");

  // My Recipes
  this.route("recipes");
  this.route("create");
  this.route("edit");

  this.route("login");
});

export default Router;
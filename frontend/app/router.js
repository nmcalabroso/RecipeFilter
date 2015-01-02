import Ember from "ember";
import config from "./config/environment";

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource("search", {
    path: "/"
  });

  this.route("recipes")
  this.route("edit");
  this.route("results");
  this.route("recipe");
  this.route("login");
});

export default Router;
App.PostsRoute = Ember.Route.extend(model: ->
  App.Post.find()
)

App.PostsNewRoute = Ember.Route.extend(model: ->
  App.Post.createRecord(publishedAt: new Date(), author: "current user")
)
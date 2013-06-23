App.PostsRoute = Ember.Route.extend(
  model: ->
    App.Post.find()
  renderTemplate: ->
    @render('post/list')
)

App.PostsNewRoute = Ember.Route.extend(
  model: ->
    App.Post.createRecord(publishedAt: new Date(), author: "current user")
  renderTemplate: ->
    @render('post/new')
)


App.PostRoute = Ember.Route.extend(
  renderTemplate: ->
    @render('post/show')
)

App.PostsIndexRoute = Ember.Route.extend(
  renderTemplate: ->
    @render('post/index')
)
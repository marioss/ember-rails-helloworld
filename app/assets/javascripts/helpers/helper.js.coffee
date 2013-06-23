showdown = new Showdown.converter()

Ember.Handlebars.registerBoundHelper "markdown", (input) ->
  new Handlebars.SafeString(showdown.makeHtml(input)) if input # need to check if input is defined and not null

Ember.Handlebars.registerBoundHelper "date", (date) ->
  moment(date).fromNow()

Ember.Handlebars.registerBoundHelper "submitButton", (text) ->
  new Handlebars.SafeString('<button type="submit" class="btn btn-primary"></button>')
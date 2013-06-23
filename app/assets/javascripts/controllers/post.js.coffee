App.PostController = Ember.ObjectController.extend(
  isEditing: false
  edit: ->
    @set "isEditing", true

  doneEditing: ->
    @set "isEditing", false
    @get('store').commit()

  delete: ->
    if( window.confirm("Are you sure want to delete this post?") )
      @get('content').deleteRecord()
      @get('store').commit()
      @transitionToRoute('posts')
)

App.PostsNewController = Ember.ObjectController.extend(
  save: ->
    @get('store').commit()

  cancel: ->
    @get('content').deleteRecord()
    @get('store').transaction().rollback()
    @transitionToRoute('posts')

  transitionAfterSave: ( ->
    # when creating new records, it's necessary to wait for the record to be
    # an id before we can transition to its route (which depends on its id)
    @transitionToRoute('post', @get('content') if @get('content.id'))
  ).observes('content.id')
)
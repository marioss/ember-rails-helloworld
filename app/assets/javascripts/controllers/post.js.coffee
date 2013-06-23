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
    @transitionToRoute('post', this.get('content'))

  cancel: ->
    @get('content').deleteRecord()
    @get('store').transaction().rollback()
    @transitionToRoute('posts')
)
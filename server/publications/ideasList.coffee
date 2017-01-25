Meteor.publish 'ideasList', (rid, limit = 50) ->
	unless this.userId
		return this.ready()

	pub = this

	cursorFileListHandle = RocketChat.models.Ideas.findNotHiddenFilesOfRoom(rid, limit).observeChanges
		added: (_id, record) ->
			pub.added('ideas_list', _id, record)

		changed: (_id, record) ->
			pub.changed('ideas_list', _id, record)

		removed: (_id, record) ->
			pub.removed('ideas_list', _id, record)

	this.ready()
	this.onStop ->
		cursorFileListHandle.stop()

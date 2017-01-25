RocketChat.models.Ideas = new class extends RocketChat.models._Base
	constructor: ->
		@_initModel 'ideas'

	findOneById: (ideaId) ->
		@findOne { _id: ideaId }
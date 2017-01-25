#database = new MongoInternals.RemoteCollectionDriver("mongodb://127.0.0.1:3001/hubot");
#ideas = new Mongo.Collection("ideas", { _driver: database });
ideasList = new Mongo.Collection 'ideas_list'
ideas = Mongo.createCollection 'ideas'

Template.ideasList.helpers

	test: ->
		ideasList.insert({title: "Hello world", body: "First Idea"});
		return ideasList.find({}, { sort: { createdAt: -1 } });

	countIdeas: ->
		return ideasList.find().count();


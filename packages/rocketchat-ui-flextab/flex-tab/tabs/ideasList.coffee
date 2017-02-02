#database = new MongoInternals.RemoteCollectionDriver("mongodb://127.0.0.1:3001/hubot");
#ideas = new Mongo.Collection("ideas", { _driver: database });
ideasList = new Mongo.Collection 'ideas_list'

Template.ideasList.helpers
  
  ideas: []

  test: ->
    #ideasList.insert({title: "Hello world", body: "First Idea"})
    #ideasList.save({title: "Hello world", body: "First Idea"})
    #return ideasList.find({}, { sort: { createdAt: -1 } })
    "1. putting up a playground beside the gate"

  list_ideas: ->
    "1. putting up a playground beside the gate\n
    2. creating a family gate, seperated from the other gates\n
    3. hiring specially trained people from the airport to watch after the children and play with them while waiting in the queue\n
    4. Build special areas for kids, where they can play without disturbing fellow passengers\n
    5. Use large windows as distractors for kids, where they can observe the airplanes and the operations on the runway\n
    6. Use sections in the waiting area which are built especially for families"


  countIdeas: ->
    return ideasList.find().count()

  addExampleIdea: (content, username, userid, hmw) ->
    idea = {content, username, userid, hmw}
    ideas.push idea

  #Add example data
  exampleIdeaOld: () ->
    ideas = []
    #Question 1 - Jan
    addExampleIdea("putting up a playground beside the gate", "Jan", "iRNCo8sC3qb6Yyz8r", 1)
    addExampleIdea("creating a family gate, seperated from the other gates", "Jan", "iRNCo8sC3qb6Yyz8r", 1)
    addExampleIdea("hiring specially trained people from the airport to watch after the children and play with them while waiting in the queue ", "Jan", "iRNCo8sC3qb6Yyz8r", 1)
    #Question 1 - Max
    addExampleIdea("Build special areas for kids, where they can play without disturbing fellow passengers", "Max", "G49M3Q9v8j5fabQz7", 1)
    addExampleIdea("Use large windows as distractors for kids, where they can observe the airplanes and the operations on the runway", "Max", "G49M3Q9v8j5fabQz7", 1)
    addExampleIdea("Use sections in the waiting area which are built especially for families", "Max", "G49M3Q9v8j5fabQz7", 1)

    #Question 2 - Jan
    addExampleIdea("make it more exciting by putting interesting exhibitions in the airport", "Jan", "iRNCo8sC3qb6Yyz8r", 2)
    addExampleIdea("let the children experience the job of the pilot with a flight simulator", "Jan", "iRNCo8sC3qb6Yyz8r", 2)
    addExampleIdea("reduce waiting times so they don´t get bored", "Jan", "iRNCo8sC3qb6Yyz8r", 2)
    #Question 2 - Max
    addExampleIdea("Provide guided tours, which give insides on the daily operations of an airport (can be booked for groups of children e.g. birthday parties or school classes)", "Max", "G49M3Q9v8j5fabQz7", 2)

  listIdeas: ->
    exampleIdeaOld()
    list = ""
    for idea, index in ideas
      list = list.concat("\n#{index+1}. #{idea.content}")
    list

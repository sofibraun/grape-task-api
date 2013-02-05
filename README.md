# Grape Task API

This is an example of an API made with [Grape](https://github.com/intridea/grape) and [MongoId](http://mongoid.org/). It can be tested with [this](https://github.com/sofibraun/angularjs-task-example) client made with angularjs.

## Installation

```
  $ git clone git://github.com/sofibraun/grape-task-api.git
  $ cd grape-task-api
  $ bundle install
  $ bin/thin start
```

## Example with curl

```
$ curl -s http://localhost:3000/tasks
[]

$ curl -s -d '{"failed":"1"}' http://localhost:3000/tasks
{
  "errors": {
        "name": ["can't be blank"],
        "description":["can't be blank"]
  }
}

$ curl -d '{"name": "new task", "description":"this is a new task"}' 'http://localhost:3000/tasks' -H Content-Type:application/json -v
{
   "taskId" : "51111f9922e47adb1d000001"
}

$ curl -s http://localhost:3000/
[

  { 
    "_id":"51111f9922e47adb1d000001",
    "created_at":"2013-02-05T12:04:57-03:00",
    "description":"this is a new task",
    "name":"new task",
    "updated_at":"2013-02-05T12:04:57-03:00"
    }
]

$ curl -i -X PUT -d '{"_id":"<validId>", "name":"new name"}' http://localhost:3000/tasks/<validId> -H "Content-Type: application/json"
{
   "taskId" : "4f64a394d1dd1b129d000003"
}

$ curl -i -H "Content-Type: application/json" -X DELETE http://localhost:3000/tasks/<validId> -v
```

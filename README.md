# Homework 10 - Building A Rails API using TDD

## Due Date

Tuesday, April 26, 2018 @ 4:00 PM

## Goals

- The purpose of this homework is to build an API using TDD to support the
  following set of functionality:

  - creating player

  - updating player

  - showing player

  - list players

  - deleting player

## Reading and Resources

Using Rails for API-only Applications - http://edgeguides.rubyonrails.org/api_app.html

Rails API - Basics - https://www.driftingruby.com/episodes/rails-api-basics

API Testing Client - https://www.getpostman.com

Active Model Serializers - https://github.com/rails-api/active_model_serializers/blob/master/docs/general/getting_started.md

Rails API - Active Model Serializers - https://www.driftingruby.com/episodes/rails-api-active-model-serializer

Rack CORS - https://github.com/cyu/rack-cors

RSpec Request Specs - https://www.relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec

Ruby Language - http://www.ruby-lang.org/en/documentation/

Rails Guides - http://guides.rubyonrails.org/index.html

Postman API Tool - https://www.getpostman.com

## API Reference

 - request

  GET  /api/players

 - response 
    
  [ {  id: 26,
        first_name: "Nora",
        last_name: "Renner",
        email: "durward@labadie.org",
        age: 22,
        position: "defensive midfielder"
    },
    ....
  ] 
                
  or

  { success: false }

 - format   
 
  JSON

   Note:  For each player instance, you only need to include id, first_name,
          last_name, email, age, position



- request

  POST /api/players

 - response 
 
  { id: ..., first_name: ..., last_name: ..., email: ..., age: ..., success: true } 
  
  or
             
  { success: false }

 - format   
 
  JSON



 - request

  GET  /api/players/:id

 - response 
 
    { id: ..., first_name: ..., last_name: ..., email: ..., age: ..., success: true } 
    
    or
                     
    { success: false }

 - format   
 
  JSON



 - request

  DELETE /api/players/:id

 - response:
 
  { success: true } 
  
  or 
  
  { success: false }

 - format   
 
  JSON



 - request

  PUT /api/players/:id

 - response 
 
  { success: true } 
  
  or 
  
  { success: false }
 
 - format   
 
  JSON

## Player Model

- first_name - string

- last_name - string

- email - string

- age - integer

- position - string

  possible options for position

  - forward

  - right back

  - right midfielder

  - defensive midfielder

  - goalkeeper

  - striker

  - left midfielder

  - defensive midfielder

  - left back

  - stopper

  - sweeper

## Creating Rails API application

  $ cd fh-homework-10
  $ git init
  $ git add .
  $ git commit -am 'Initial commit'
  $ git checkout -b part-01-initial-api

  Note:  The solution for this homework should exist within the branch,
         `part-01-initial-api`.

## Using TDD

You will be using RSpec request specs to test your API and your files for the
spec and implementation will reside in the following folders:

- spec folder

  ```
  spec/requests/api/players_controller_spec.rb
  ```-

- implementation folder

  ```
  app/controllers/api/players_controller.rb
  ```

- running all specs

  ```
  $ rspec
  ```

  Note:  Do not type `$` in the above.  Just the command that follows.

  You are done when the above command generates the similar output:

  ```
  .................

  Finished in 0.23141 seconds (files took 0.77058 seconds to load)
  17 examples, 0 failures
  ```

- running a specific spec

  ```
  rspec ./spec/controllers/api/players_controller_spec.rb:16 # API::PlayersController GET /players retrieves all the requested player
  rspec ./spec/controllers/api/players_controller_spec.rb:28 # API::PlayersController GET /players/:id with valid params retrieves the requested player
  rspec ./spec/controllers/api/players_controller_spec.rb:37 # API::PlayersController GET /players/:id with valid params properly sets the success key
  rspec ./spec/controllers/api/players_controller_spec.rb:49 # API::PlayersController GET /players/:id with invalid params retrieves the requested player
  rspec ./spec/controllers/api/players_controller_spec.rb:58 # API::PlayersController GET /players/:id with invalid params retrieves the requested player
  rspec ./spec/controllers/api/players_controller_spec.rb:72 # API::PlayersController POST /players with valid params creates a new Player
  rspec ./spec/controllers/api/players_controller_spec.rb:82 # API::PlayersController POST /players with valid params properly sets the success key
  rspec ./spec/controllers/api/players_controller_spec.rb:95 # API::PlayersController POST /players with invalid params creates a new player
  rspec ./spec/controllers/api/players_controller_spec.rb:105 # API::PlayersController POST /players with invalid params properly sets the success key
  rspec ./spec/controllers/api/players_controller_spec.rb:124 # API::PlayersController PUT /players/:id with valid params updates the requested player
  rspec ./spec/controllers/api/players_controller_spec.rb:134 # API::PlayersController PUT /players/:id with valid params properly sets the success key
  rspec ./spec/controllers/api/players_controller_spec.rb:147 # API::PlayersController PUT /players/:id with invalid params updates the requested player
  rspec ./spec/controllers/api/players_controller_spec.rb:157 # API::PlayersController PUT /players/:id with invalid params properly sets the success key
  rspec ./spec/controllers/api/players_controller_spec.rb:172 # API::PlayersController DELETE /players/:id with valid params destroys the requested player
  rspec ./spec/controllers/api/players_controller_spec.rb:183 # API::PlayersController DELETE /players/:id with valid params properly sets success key
  rspec ./spec/controllers/api/players_controller_spec.rb:197 # API::PlayersController DELETE /players/:id with invalid params destroys the requested player
  rspec ./spec/controllers/api/players_controller_spec.rb:208 # API::PlayersController DELETE /players/:id with invalid params properly sets success key
  ```

## Generate Fake Data

- Use a Ruby gem called `faker` to generate 50 players

  - add the logic to your `seeds.rb` file for creating the player models

## Deliverables

  - create Github repository called `fh-homework-10`

    Note:  Follow the instructions for connecting your local repository to the Github repository.

  - push changes to Github

    ```
    $ cd fh-homework-10
	  $ git checkout part-01-initial-api
	  $ git push
	  ```

  - merge changes into the master branch and push to Github

  	```
    $ cd fh-homework-10
  	$ git checkout master
  	$ git merge part-01-initial-api
  	$ git push
  	```

## Have Questions

Please make a reasonable effort to complete the homework prior to our next session.  If you have any questions regarding this homework, please do send me a message via Slack.

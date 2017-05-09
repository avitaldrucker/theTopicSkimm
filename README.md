# theTopicSkimm

[Gitwork][live] is a fullstack, versioned web application for filtering world and national topics. It uses Ruby on Rails on the backend, a PostgreSQL database, and React and Redux on the frontend.

[live]: http://thetopicskimm.herokuapp.com/

## Database Schema and Associations

This web application has models for cities, states, and nations. Cities belong to states and states belongs to nations. I implemented a polymorphic association to implement capitals, as both nations and states each have one capital. I did this through creating a `capitable` interface by adding the columns `capitable_id` and `capitable_type` to the cities table. A city can thus reference a state id or nation id in the `capitable_id` column. This association is used to present state capitals for topic filtering.

## Routing

There are two versions of topic routes in this application: version 1 and version 2. Versions  1 and 2 differ on national topics but are the same regarding national topics. I nested the calls to `national` under different scopes in order to call different controller actions. I also used a concern for the route to world topics, to prevent repetition of the same route across both versions. Below are my routes:

```ruby
# config/routes.rb

defaults format: :json do

  concern :nation_attachable do
    get 'world', to: 'nations#index'
  end

  scope 'v1' do
    scope 'topics' do
      get 'national', to: 'states#index'
      concerns :nation_attachable
    end
  end

  scope 'v2' do
    scope 'topics' do
      get 'national', to: 'cities#capitals'
      concerns :nation_attachable
    end
  end

end
```

## JSON Representation

Topics are served to the frontend in JSON format. I used view inheritance to DRY up my Jbuilder code. Because Jbuilder iterates through each topic and provides the same information, I created the file `views/application/_index_shared.json.jbuilder` to execute topic iteration. This partial is rendered in various nested Jbuilder files and is found by Rails by searching up the view inheritance chain.

## Frontend

The web application utilizes React components to organize the page into the header, menu, and topics. The React store holds a slice of state for topics, and clicking a menu item fetches the topics and persists through them in the Redux state through the `TopicsReducer`.

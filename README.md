# Demo application for rails-simple-search

This is a rails 7 application. It demostrates the simplicity and power of gem rails-simple-search.

## Installation
After cloning the project to your local, run the following command:

```
$ cd rails_simple_search_demo
$ bundle install
$ bin/rails db:migrate
$ bin/rails db:fixtures:load  # optional
$ bin/dev
```
## Versions

This project used Ruby 3.1.4, Rails 7.1.4, and RailsSimpleSearch 1.2.0.

## Explanation

In this demo, I'm trying to search for a user by part of her name, her post titles, her comments, her address, her city, her state and so on.

The following is the code related to the search:

1. In file "Gemfile"

  ```
  gem 'rails-simple-search', '>=1.1.9'
  ```

2. In file "app/model"Search"
  ```
  class Search < RailsSimpleSearch::Base
  end
  ```

3. In file "config/route.rb"
  ```
  post 'users/index', controller: 'users', action: 'index', as: :search_users
  ```

4. In file "app/controllers/users_controllers"

  ```
  @search = Search.new(:user, params[:search], exact_match: :first_name)
  @users = @search.run.order(:first_name)
  ```
 
5. In file "app/views/users/index.html.erb"
  ```
  <%= form_for @search, url: search_users_path, data: {turbo: false} do |f| %>
    <%= f.label "First Name" %>
    <%= f.text_field 'first_name' %>
    <br/>
    <%= f.label "Last Name" %>
    <%= f.text_field 'last_name' %>
    <br/>
    <%= f.label "Age" %>
    <%= f.text_field 'age_greater_than_equal_to' %>
    <br/>
    <%= f.label "Address1" %>
    <%= f.text_field 'address.address1' %>
    <br/>
    <%= f.label "City" %>
    <%= f.text_field 'address.city' %>
    <br/>
    <%= f.label "Post title" %>
    <%= f.text_field 'posts.title' %>
    <br/>
    <%= f.label "Post title or body" %>
    <%= f.text_field 'posts.title_or_posts.body' %>
    <br/>
    <%= f.label "Comment" %>
    <%= f.text_field 'comments.body' %>
    <br/>
    <%= f.label "Author who commented my posts", class: "block" %>
    <%= f.text_field 'posts.comments.user.first_name_or_posts.comments.user.last_name' %>
    <br/>
    <%= f.submit "search" %>
  <% end %>
  ```

For more info about rails-simple-search,
please see [https://github.com/yzhanginwa/rails-simple-search](https://github.com/yzhanginwa/rails-simple-search).

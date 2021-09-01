# RAILS TEMPLATES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# FORM TEMPLATES
``` ruby
<%= form_tag posts_path do %>
  <label>Post title:</label><br>
  <%= text_field_tag :'post[title]' %><br>

  <label>Post description:</label><br>
  <%= text_area_tag :'post[description]' %><br>

  <%= submit_tag "Submit Post" %>
<% end %>
<%= params.inspect %>
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<%= form_for(@model) do |f| %>
  <% if @model.errors.any? %>
    <div id="error_explanation">
      <h2>There were some errors:</h2>
      <ul>
        <% @model.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= f.label :title %> <br>
    <%= f.text_field :title %>
  </div>

  <div class="field">
    <%= f.label :check_box %><br>
    <%= f.check_box :released %>
  </div>

  <div class="field">
    <%= f.label :release_year %><br>
    <%= f.number_field :release_year %>
  </div>

  <div class="field">
    <%= f.label :collection_check_box %><br>
    <%= f.collection_check_box :genre %>
  </div>

  <div class="field">
    <%= f.label :collection_select %><br>
    <%= f.collection_select :artist_name %>
  </div>

  <div class="actions">
    <%= f.submit %>
  </div>

<% end %>
```

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  CREATE
``` ruby
def create
  @post = Post.new             # post variable is an instance variable
  @post.title = params[:title]
  @post.description = params[:description]
  @post.save
  redirect_to post_path(@post)  # redirect that leverages a route helper method
end # Type Post.last into the Rails console, and it will display the most recently created record
```

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  TEMPLATE
``` ruby
rake db:migrate RAILS_ENV=test
```
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Seed.rb TEMPLATE
``` ruby
@boat_types = ["two-masted schooner", "paddleboat", "motorboat", "yacht", "canoe"]
booleans = [true, false]
10.times do
  Boat.create(
    name: "The #{Faker::Creature::Animal.name}",
    boat_type: boat_types.sample,
    length: rand(1..100),
    afloat: booleans.sample
  )
end
50.times do
  Passenger.create(name: Faker::Name.name, age: rand(1..60))
end
20.times do
  trip = Trip.new
  trip.boat = Boat.all.sample
  trip.passenger = Passenger.all.sample
  trip.save
end
```
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  TEMPLATE
``` ruby
<h1>Songs</h1>

<div><%= link_to 'Create Song', new_song_path %></div>
<br />

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Year</th>
      <th>Genre</th>
      <th>Artist name</th>
      <th></th>
    </tr>
  </thead>

  <tbody>
    <% @songs.each do |song| %>
      <tr>
        <td><%= song.title %></td>
        <td><%= song.release_year %></td>
        <td><%= song.genre %></td>
        <td><%= song.artist_name %></td>
        <td>
          <%= link_to 'View', song %> |
          <%= link_to 'Edit', edit_song_path(song) %> |
          <%= link_to 'Delete', song, method: :delete, data: { confirm: 'For real?' } %>
        </td>
      </tr>
    <% end %>
  </tbody>
</table>
```
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  TEMPLATE
``` ruby
```
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  TEMPLATE
``` ruby
```
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  TEMPLATE
``` ruby
```
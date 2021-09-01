
# RAILS ERB TEMPLATES


# ======================================================================================
#  SEED Data
# ======================================================================================
``` ruby
boat_types = ["two-masted schooner", "paddleboat", "motorboat", "yacht", "canoe"]
booleans = [true, false]
10.times do
  Boat.create( name: "The #{Faker::Creature::Animal.name}", boat_type: boat_types.sample, length: rand(1..100), afloat: booleans.sample)
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

# ======================================================================================
#  VIEWS
# ======================================================================================

# NEW and EDIT FORM VIEWS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Edit.html.erb
``` ruby
<h1>Edit Post</h1>
<%= form_for(@post) do |f| %>
  <div class="field">
    <%= f.label :title, 'Post Title:' %><br>
    <%= f.text_field :title %>
  </div>
  <div class="field">
    <%= f.label :description, 'Post Description:' %><br>
    <%= f.text_area :description %>
  </div>
  <div class="field">
    <%= f.label :category_id, 'Post Category:' %><br>
    <%= f.collection_radio_buttons :category_id, @categories, :id, :name %> # <-------- radio button setting association
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>
```

# INDEX and SHOW VIEWS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# categories/show.html.erb for Category has_many posts
``` ruby
  <h1><%= @category.name %></h1>

  <h3><%= pluralize(@category.posts.count, 'Post') %></h3>
  <ul>
    <% @category.posts.each do |p| %>
      <li><%= link_to p.title, post_path(p) %></li>
    <% end %>
  </ul>
  ```

#  posts/index.html.erb
``` ruby
  <h1>Posts</h1>
  <ul>
    <% @posts.each do |p| %>
      <li><%= link_to p.title, post_path(p) %></li>
    <% end %>
  </ul>
  ```

#  posts/show.html.erb for Post belongs_to category
``` ruby
  <h1><%= @post.title %></h1>
  <h3>Category: <%= link_to @post.category.name, category_path(@post.category) if @post.category %></h3>
  <p><%= @post.description %></p>
  ```

# ======================================================================================
#  CONTROLLERS
# ======================================================================================

#  post_controller.rb
``` ruby
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
    @categories = Category.all
  end
  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
  end
  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end
  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end
  private
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
```

#  TEMPLATE
``` ruby

```

#  TEMPLATE
``` ruby

```

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  TEMPLATE

#  TEMPLATE
``` ruby

```

#  TEMPLATE
``` ruby

```

#  TEMPLATE
``` ruby

```

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  TEMPLATE

#  TEMPLATE
``` ruby

```

#  TEMPLATE
``` ruby

```

#  TEMPLATE
``` ruby

```

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  TEMPLATE

#  TEMPLATE
``` ruby

```

#  TEMPLATE
``` ruby

```

#  TEMPLATE
``` ruby

```

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  TEMPLATE

#  TEMPLATE
``` ruby

```

#  TEMPLATE
``` ruby

```

#  TEMPLATE
``` ruby

```

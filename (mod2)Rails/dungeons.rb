
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ApplicationController < ActionController::Base
 
  private
 
  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# application.html.erb
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%= yield :header %>
  <%= csrf_meta_tags %>
</head>
<body>
<nav class="navbar is-light" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="/">Dungeon</a>
    <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="dungeon-nav-menu">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="dungeon-nav-menu" class="navbar-menu">
    <div class="navbar-end">
      <% if current_user %>
        <%= link_to "About", about_path, class: 'navbar-item' %>
        <%= link_to "Profile", edit_user_path, class: 'navbar-item' %>
        <%= link_to "Logout", logout_path, class: 'navbar-item' %>
      <% end %>

    </div>
  </div>
</nav>



<%= render :partial => 'layouts/flash_message' %>

<section class="section">
  <div class="container">
    <%= content_for?(:content) ? yield(:content) : yield %>
  </div>
</section>

<footer class="footer has-text-right">
  <span>&copy; 2013-2020 Dan Elbert</span>
</footer>

<div id="dialog_container"></div>

</body>
</html>
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class LoginsController < ApplicationController

  # "Create" a login, aka "log the user in"
  def create
    if user = User.authenticate(params[:username], params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end

  # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    session.delete(:current_user_id)
    # Clear the memoized current user
    @_current_user = nil
    redirect_to root_url
  end
  
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# users/_form.html.erb
<%= form_for(@user, :url => user_path) do |f| %>

  <%= render partial: 'shared/error_list', locals: {model: @user} %>

  <div class="field">
    <%= f.label :name, class: 'label' %>
    <%= f.text_field :name, class: 'input' %>
  </div>
  <div class="field">
    <%= f.label :email, class: 'label' %>
    <%= f.text_field :email, class: 'input' %>
  </div>
  <div class="field">
    <%= f.label :username, class: 'label' %>
    <%= f.text_field :username, class: 'input' %>
  </div>
  <div class="field">
    <%= f.label :display_name, class: 'label' %>
    <%= f.text_field :display_name, class: 'input' %>
  </div>

  <div class="field">
    <%= f.label :password, class: 'label' %>
    <%= f.password_field :password, class: 'input' %>
  </div>
  <div class="field">
    <%= f.label :password_confirmation, class: 'label' %>
    <%= f.password_field :password_confirmation, class: 'input' %>
  </div>
  
  <div class="actions">
    <%= f.submit nil, class: 'button is-primary' %>
    <%= link_to "Back", lobby_path, class: 'button is-secondary' %>
  </div>
<% end %>

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# LOGIN FORM

<%= form_tag(login_path, :method => :post) do %>

  <div class="field">
    <%= label_tag :email, "Email or Username", class: 'label' %>
    <%= text_field_tag :email, nil, class: 'input', autofocus: true %>
  </div>

  <div class="field">
    <%= label_tag :password, "Password", class: 'label' %>
    <%= password_field_tag :password, nil, class: 'input' %>
  </div>

  <%= submit_tag("Login", class: 'button is-primary') %>
<% end %>

<br />

<%= link_to "Create an Account", new_user_path, class: 'button is-secondary' %>
<%= link_to "Forgot Password", forgot_password_user_path, class: 'button is-secondary' %>
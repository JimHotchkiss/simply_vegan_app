After evaluating my earlier project, I decided it was too much like a blog post, and so I've decided to make a recipe organizing app.  

1. I need to build a user migration, model, controller and views.
  * rails g resource User
  * user will need a
    ~ username
    ~ email
    ~ password_digest (bcrypt -> has_secure_password)
2. Want a basic registration process for the user.  
3. Now going to build basic login authentication.
  * Include routes
  * form
  * bcrypt
Now, want to build out the association between recipe and ingredient.   
  * I will need nested routes
  * migrations
  * models
  * controllers
  * views with forms
I will also need a join table recipe_ingredients

I need to make the appropriate views and forms
# for style sake, I'd like to keep all recipe titles and ingredient names downcase. So I will have to do a before_ action.  

I want to add a ingredient show page that list all the recipes associated with that ingredient.  

<%= link_to "New Comment", new_project_comment_path(@project) %>
<p style="font-weight:bold;">Comments:</p>
<% @project_comments.each do |comment| %>
  <div class="container" style="border : solid 1px #ffffff; color:blue; padding : 4px; width : 800px; height : 200px; overflow : auto; ">
      <h2 style="color:red"><%= flash[:notice] %></h2>
   ~> <%= comment.description %><br>

       <%= link_to 'Edit', edit_comment_path(comment) %> | <%= link_to "Delete", comment, method: :delete, data: { confirm: "WAIT! Seriously?" } %>

 </div><br>
<% end %>

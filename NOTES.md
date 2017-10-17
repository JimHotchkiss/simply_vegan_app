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

So, I've added the layout for comments, no I want I link_to comments, and create a new comment.
  * With comments, I need a new form
  * Add validations
  * With validation errors
  * Also, remember, when using bootstrap_form_for, to install gem 'bootstrap_form'
  <%= link_to 'Edit', edit_comment_path(comment) %> | <%= link_to "Delete", comment, method: :delete, data: { confirm: "WAIT! Seriously?" } %>

  Add a scope method to show the most recent comment.
  And add link_to ingredients on recipe show page

  I want to add the ability for a user to edit or delete their own recipe
    * TO GET LINK_TO DELETE TO WORK, INCLUDE ON LAYOUT/APPLICATION FILE

    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>


    * also had to edit application_controller to include, protect_from_forgery prepend: true, will double check about security risk

    Suggestion to fix token authenticity problem
      * Rails guide authenticity token as a google search should point you in the right direction
      * Avi: aviflombaum @jim it’s about how you built to logout link. Since it’s submitting a post request (faked as a delete).  You need to include a csrf token.  If you changed your layout recently.  Or just your js or anything. It’s possible it got lost.  Google csrf token and logout links. Or just change the route to also accept a get request to /logout at sessions#destrot

May have fixed with:
    * application_controller/ protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

Giong to try another fix, by adding '<%= csrf_meta_tags %>' into the <head>
  * This seems to work, and is required in Rails 4 for jQuerry UJS to send the aunthenticity token on non-GET requests.

So, add edit/delete on the comment section

Now, make an ingredient show page that list all the recipes under that ingredient. 

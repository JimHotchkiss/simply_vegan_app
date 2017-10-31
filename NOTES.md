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


Blog Gif link: <iframe src="https://giphy.com/embed/CDH0spsSaqQUg" width="900" height="192" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p>

I need to build out a nest form that allows the user to assign an attribute, in this case, quantity, to the recipe_ingredient.  

We've already nest ingredients within recipe, but now we need to nest, either, ingredients in recipe_ingredients, or recipe_ingredients in ingredients.  

I need to access to @recipe.ingredient.first.name, and @recipe.ingredient.first.quantity
  * First thing I'll do is add 'quantity' to the recipe_ingredients table.  
  * Then I'll look at the recipe form.
I can access each instantiated recipe and ingredient through recipe_ingredient

Going to try nesting recipe_ingredients and ingredients with @recipe.recipe_ingredients.build.build_ingredient

Then I will nest these in the form

Then I will move the ingredient_attributes from recipe model to the recipe_ingredient model.  

Then I will put accepts_nested_attributes_for :recipe_ingredients on the recipe model.

Then I will nest ingredient_attributes inside of recipe_ingredients_attributes in the recipe_params.

I need to make a custom url.  The url will route to a action controller that will preform some type of functionality.  
  * I think I will make a most_comments route that will return the user with the most comments and those comments.  
So, I think I got the array of comments sorted so it will return an array of the most comments.  
  * Next, build a most_comments show form.  
Test out this functionality by adding more comments to an already existing recipe.  

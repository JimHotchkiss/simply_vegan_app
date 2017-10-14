After evaluating my earlier project, I decided it was too much like a blog post, and so I've decided to make a recipe organizing app.  

1. I need to build a user migration, model, controller and views.
  * rails g resource User
  * user will need a
    ~ username
    ~ email
    ~ password_digest (bcrypt -> has_secure_password)
2. Want a basic registration process for the user.  

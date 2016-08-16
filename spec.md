# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [ ] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
- [ ] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- [ ] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- [ ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [ ] Include signup (how e.g. Devise)
- [ ] Include login (how e.g. Devise)
- [ ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate

<%= f.fields_for :categories, @recipe.categories do |cat| %>
  <%= cat.label :categories %>
  <%= cat.collection_check_boxes :categories_id, Category.all, :id, :name %>
  <% end %>


Steps:

1. created devise - x
2. each model, controller - x
3. add associations - x
4. seed database - x
5. homepage - x
6. user authentication devise and only show current_user stuff - x
7. logout link works - x
7.1 Add home link in header. - x
8. setup facebook authorization, add to homepage. - x
9. setup so you can't access another recipe by changing browser. edit them this way. - x
10. change status button like before - x
11. show on show page of recipe that you havent cooked or not. - x
12. show all ingredients on recipe show - x
13 - can edit ingredients - x
16. need to create a new comment - x
14 - cant go to show or edit for ingre and comment if not yours - x
15 - check why the comment nested params was opposite but ingredients worked??? - x


17 - add validation messages in layout - x
18 - add validations to models - x
19 - make some scope methods to show all the recipes you cooked. or ones with highest ratings etc. 
20 - add a instructions section in the database for recipe. I need to add the field to the forms and also to the params. 
21 - go through categories. make sure all works. CRUD. 
22. set recipe home page to list the categories of it at the top. Can edit and add more categories.not nested. make sure you cant view them by changing the url

**cant check if someone is logged in via facebook???


Create Devise - X
Create Each Migration model, controller using resource - x
Add associations - x
Seed database - x
Test my associations - x
setup homepage ( includes signup, signin, information on the program, current date) - x 
test login - x
setup logout link to work - x
test signup - x 
setup faceboook login, add to homepage - x
create recipe form  - x
show current recipes with links on homepage - x
make nested resource - commments inside recipes, also ingredients insdie recipe.  - x
add button - cooked recipe on show page, delete recipe and add comment recipe - x
cancancan - authorize so you can only see, edit etc your own recipes. 
add a before action _ set_recipe

add ingredients ( need drop down and also text field)
edit ingredients on a recipe


**Not able to recognize that a user is signed in when its facebook, so cant show their name or also change the links based on that. 


nested resource - commments inside recipes, also ingredients insdie recipe. 


Recipe Manager

1. Have at least one join table. This table should have each id from the other tables its joining as well as additional information like content, or permission

2. include validations in your models to make sure all information needed it inputted.

3. Scope method. So like a method giving us the overdue tasks. Use these methods to display different information. ** cooked a recipe changes the status. show all that have cooked . show all that havent cooked. show rating for that recipe.

4. Nested form with a custom attribute writer. this is initiated in our strong params. could use the accepts_nested_attributes_for method. 

5. devise authentication

6. faceboook login capability

7. nested resources. profiles/1/pictures/new. being able to create an item from inside another. 

8. display validation errors. Your fields should be enclosed within a fields_with_errors class and error messages describing the validation failures must be present within the view. Make sure to include those 3 sentences in the layout application for this. 

9. DRY!! Don’t repeat. all logic in controllers is methods in your models. use partials in views. 
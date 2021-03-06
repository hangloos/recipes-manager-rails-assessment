Specifications for the Rails with jQuery Assessment

Step 1: Must render at least one index page (index resource - 'list of things') via jQuery and an Active Model Serialization JSON Backend. For example, in a blog domain with users and posts, you might display the index of the users posts on the users show page, fetching the posts via an AJAX GET request, with the backend rendering the posts in JSON format, and then appending the posts to the page.

Notes - On the users home page. show all the recipes from that user. use ajax to get it and then convert the objects from active record to JSON to show on the page. 


Changes:
*Show comments button on show page for recipe
*submit comment ajax 


Step 2: create recipe should use jquery and prevent default. 


Step 3: Must render at least one show page (show resource - 'one specific thing') via jQuery and an Active Model Serialization JSON Backend. For example, in the blog domain, you might allow a user to sift through the posts by clicking a 'Next' button on the posts show page, with the next post being fetched and rendered via JQuery/AJAX.

Notes - Recipes/46/ingredients show page. click next through all the ingredients. 


- add javascript - x 
- make link with <li> - x
- add the prevent default - x



Specs:

 [] Use jQuery for implementing new requirements
 [] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
 [] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
 [] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
 [] Include at least one link that loads or updates a resource without reloading the page.
 [] Translate JSON responses into js model objects.
 [] At least one of the js model objects must have at least one method added by your code to the prototype.

d[] Confirm

 [] You have a large number of small Git commits
 [] Your commit messages are meaningful
 [] You made the changes in a commit that relate to the commit message
 [] You don't include changes in a commit that aren't related to the commit message
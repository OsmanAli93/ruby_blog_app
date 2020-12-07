# Project 2 - Blog App
A CRUD blog app that allows user to read,add,update,delete a blog posts .
This will require users to sign up before they can have full CRUD capabilites . 

# Technologies
* HTML
* CSS
* JAVASCRIPT
* RUBY (SINATRA)

# Challenges
As the app being under development , i face a some quite tricky issues in storing values in the database .
The issues began when you about to submit a post , if there's a single quote in the text editor , it would conflicted with your database single quotes .
This will rendered your page an error messages , so what i did to solve this issues is i've put a '$$' signs at the beginning and ending in my SQL syntax .
With this approach, the '$$' signs will ignore all single quotes that exists in the text editor so conflict in SQL will be resolved .

# Setup
To run this project, you can go to https://sei01-blogapp.herokuapp.com/

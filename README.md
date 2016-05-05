# 3d-printing-management-system

##Branches

To clone the 'develop' branch and then push after adding and commiting changes

    git clone -b develop https://github.com/tranfong1991/3d-printing-management-system.git

    git add .

    git commit -m "message"

    git push origin develop

##Adding a new column to a table in the db

Use the following template:

    rails generate migration add_email_to_users email:string

For example, if I wanted to add a 'year' column of string type to the students table, I would run:

    rails generate migration add_year_to_students year:string

You should get the following output to confirm that the column was added:

    Running via Spring preloader in process 5817
    invoke  active_record
    create    db/migrate/20160426020031_add_year_to_students.rb

Migrations are now pending because you added a new column; to avoid and resolve this issue, run:

    bin/rake db:migrate RAILS_ENV=development

You should be good to go!

##RSpec

For this app, you can find the "expectations of how our code should behave" tests under spec/

In your terminal, navigate to root directory and run the following command:

    rspec

##Cucumber & Capybara

For this app, you can find the step definitions under features/step_definitions/web_steps.rb

In your terminal, navigate to 3d-printing-management-system and run the following command:

    cucumber

###P.S. If you're testing file uploads, use the following line of code:

    attach_file('file_id', File.absolute_path('./filename.extension'))

For example:

    attach_file('print_file', File.absolute_path('./test.txt'))

I have the file "test.txt" in the root directory 3d-printing-management-system/ and "print_file" is referring to the id of the HTML code that handles file uploading.

NOTE: In case any of the CSS changes, if you want Cucumber to go through the new version of the app, make sure you run this command:

    RAILS_ENV=test rake assets:precompile

##Tag Iterations

To tag your git repository revision with Iteration1, Iteration2, etc. Here are some example commands for how to tag revisions:

To tag the current revision:

    git tag -a Iteration1

vim will appear in the terminal. Type in a message, and close and save the file with the command

    :x!

You must explicitly push your tags with the command:

	git push --tags.

This creates new releases of the app which can be found here:
https://github.com/tranfong1991/3d-printing-management-system/releases

##ENV Credentials and what not (for Mac)

So yeah, you know that AWS instance you have to test that upload feature? Make sure you don't upload your credentials to GitHub...because it's public.

Instead, run the following commands in Terminal and get rolling.

    export AWS_ACCESS_KEY_ID=your-aws-access-key-id

    export AWS_SECRET_ACCESS_KEY=your-aws-secret-key

    export GMAIL_USERNAME=your-gmail-address

    export GMAIL_PASSWORD=your-gmail-password

##To view a list of gems installed, run this command:

    gem query --local

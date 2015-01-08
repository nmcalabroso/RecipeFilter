# RecipeFilter

## Recipe Filter | UP CSI 2 | Hackathon Training 01

### RecipeFilter API
Set-up first the API server of the application. This subproject serves as the back-end
of the whole RecipeFilter app.

### Dependencies

Install the following dependencies:

1. Git
2. PostgreSQL
3. Node
4. Rbenv
5. Ruby
6. Rails
7. Bundle

#### ElementaryOS/Ubuntu:

Install Git, Postgres, Node:
```bash
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install libssl-dev
sudo apt-get install postgresql libpq5 libpq-dev
sudo apt-get install git nodejs
```

Note: If this is your first time on git, it is advisable to configure your credentials first:
```bash
git config --global user.name "Neil Calabroso"
git config --global user.email "nmcalabroso@up.edu.ph"
```

Install Rbenv:

See ```https://github.com/sstephenson/rbenv``` and complete the installation instructions including the optional part:```ruby-build```.

Upon installing ```rbenv```, install Ruby 2.2.0:
```bash
rbenv install 2.2.0
rbenv global 2.2.0
rbenv local 2.2.0
```

Install Rails:
```bash
gem install rails
```

Install Bundler:
```bash
gem install bundler
```

### Database
Create a Postgres user for the Rails app that we will create in the next step. To do this, switch into the Postgres user:
```
sudo -u postgres psql postgres
```

Then create a user (or a "role", as Postgres calls it):
```
create role "recipefilter" with createdb login password 'recipefilter';
```

Quit the postgre REPL by typing ```\q```.

### Development Environment

1. Clone our repository to your own directory.
2. In the terminal, go to ```api``` directory.
3. Run ```bundle install```.
4. Run ```rake db:create```.
5. Run ```rake db:migrate```.
6. Run ```rake db:seed```.
7. Run ```rails server```.

Note:
Please make sure that your ruby version is 2.2.0 where the project was cloned.
You can check the version using the command ```ruby -v```. If it is not, try
to use ```rbenv local 2.2.0``` while you are in that directory. Check again.

### RecipeFilterClient

Update npm.
```bash
sudo npm cache clean -f
sudo npm install -g n
```

Install ember-cli and its dependencies.
```bash
sudo npm install ember-cli -g
sudo npm install -g bower           # package manager for front-end dependencies
sudo npm install -g phantomjs       # for integration tests
```

### Development Environment

Clear the cache and download the plugins.
```bash
sudo npm cache clean
sudo npm install
bower install
```

### API Documentation
Please see this [document](https://docs.google.com/spreadsheets/d/1Xxr3Op3GrXQ-Z8cwgBjLelSu1vRyhwFq4ivBjnlUlOA/edit?usp=sharing).

### Starting the App

After setting everything up, go to the ```api``` directory and start the rails app.
```bash
cd path/to/RecipeFilter/api
rails s
```

Open another terminal tab and go to the ```front``` directory. Start the ember app with a proxy.
```bash
cd path/to/RecipeFilter/api
ember serve --proxy http://localhost:3000
```

You can visit your app at [http://localhost:4200](http://localhost:4200).

### Further Notes

For a high quality and readable codebase, please make these conventions as references:

1. Ruby Style Guide ```https://github.com/bbatsov/ruby-style-guide```
2. Rails Style Guide ```https://github.com/bbatsov/rails-style-guide```

For reference, here are the ember docs:
* [ember.js](http://emberjs.com/)
* [ember-cli](http://www.ember-cli.com/)


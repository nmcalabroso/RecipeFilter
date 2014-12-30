# RecipeFilter

## Recipe Filter | UP CSI 2 | Hackathon Training 01

### Dependencies

Install the following dependencies:

1. Git
2. SQLite
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
sudo apt-get install git nodejs
```

Note: If this is your first time on git, it's advisable to configure your credentials first:
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

### Development Environment

1. Clone our repository to your own directory.
2. In the terminal, go to the root of the project directory.
3. Run ```bundle install```.
4. Run ```rake db:create```.
5. Run ```rake db:migrate```.
7. Run ```rake db:seed```.
7. Run ```rails server```.
8. Using your browser, go to ```http://localhost:3000```.

Note:
Please make sure that your ruby version is 2.2.0 where the project was cloned.
You can check the version using the command ```ruby -v```. If it is not, try
to use ```rbenv local 2.2.0``` while you are in that directory. Check again.

### Further Notes

For a high quality and readable codebase, please make these conventions as references:

1. Ruby Style Guide ```https://github.com/bbatsov/ruby-style-guide```
2. Rails Style Guide ```https://github.com/bbatsov/rails-style-guide```
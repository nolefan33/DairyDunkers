# README

Setup:

If bundler isn't installed, run command "gem install bundle".
Run command "bundle install"
Install Postgres if it's not already installed.
The development instance uses a database called "dairy_dunkers_dev", and the test instance uses "dairy_dunkers_test".
Make a postgres user (role) with username "dairyuser" and password "password".
    - I logged in as the default created postgres user and ran this command: "CREATE ROLE dairyuser WITH CREATEDB LOGIN PASSWORD 'password';",
      but I'm sure there's a way to do it through pgAdmin or something similar.
Run command "rake db:setup".
if on windows, make sure the "file" command works. It's required for paperclip.
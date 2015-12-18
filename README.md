# Curriculum vitae

This project is my personal web site, it is available at the following address : http://fabienoger.com/

## Informations
This project uses PostgreSQL.

## Usage
To launch the rails application you need to run the followings commands :
```shell
bundle install
rake db:create
rake db:migrate
```

For the mail system you need to configure the smtp at config/application.rb
I use the gem Figaro so you need to run :
```shell
figaro install
```
And set the environment(s) variable(s) at config/application.yml
And of course launch rails application
```shell
rails s
```

## Module
### Expenditure
The expenditure module is to improve.
### Projects
The project module is being developed.

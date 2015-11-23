# Blocmetrics

Blocmetrics is an analytics service and reporting tool that you can use with web apps to track user activity and report results. This analytics service offers a few key features:

- A client-side JavaScript snippet that allows a user to track events on their website.
- A server-side API that captures and saves those events to a database.
- A Rails application that displays the captured event data for a user.

This app powers Blocmetrics at *coming soon*

## Getting Started

## Software requirements

- Rails 4.2.5

- Ruby 2.2.3

- PostgreSQL 9.3.x or higher

## Navigate to the Rails application

```
$ cd ~/bloc/blocmetrics
```

## Set configuration files

```
$ cp config/database.yml.template config/database.yml
$ cp config/initializers/mail.rb.template config/initializers/mail.rb
```

## Create the database

```
$ pgstart
$ rake db:create
```

## Migrating and seeding the database

```
$ rake db:migrate
$ rake db:seed
```

## Starting the local server

```
$ rails server

    or

$ rails s
```

## Production Deployment

```
$ git push heroku master
$ heroku run rake db:migrate
```

## Support

Bug reports and feature requests can be filed with the rest for the Ruby on Rails project here:
* [File Bug Reports and Features](https://github.com/yamuda9/blocmetrics/issues)

## License

Blocmetrics is released under the *LICENSE-NAME* license.

## Copyright

copyright:: (c) Copyright 2015 Blocmetrics. All Rights Reserved.

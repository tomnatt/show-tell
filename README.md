show-tell
=========

An application for managing bits of Show &amp; Tell

Uses [RGraph](http://www.rgraph.net/)

## Starting it up

```
ruby scraper/scraper.rb
rake db:reset
rails s
```

Seed data will be automatically loaded on start-up.

## Data views

* How many talks by a person?
* Talks in a year?
* Talks by a person (by year)?

## Todo

* scraper runs via controller, resets talks db table
* users seeded properly
* move to postgres
* version upgrades
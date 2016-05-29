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

* ~~scraper runs via controller~~
* ~~resets talks db table~~
* ~~connects users to talks~~
* ~~users seeded properly~~
* complete speaker list
* move to postgres
* security on admin stuff
* ~~version upgrades~~
* replicate wiki listing pages as output
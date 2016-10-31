show-tell
=========

An application for managing bits of Show &amp; Tell

Uses [RGraph](http://www.rgraph.net/)

## Starting it up

```
rake db:reset
rails s
```

Speaker seed data will be automatically loaded on start-up.

Then hit http://localhost:3000/admin/talks/scrape to scrape the wiki data.

## Data views

* How many talks by a person?
* Talks in a year?
* Talks by a person (by year)?

## Todo

* ~~scraper runs via controller~~
* ~~resets talks db table~~
* ~~connects users to talks~~
* ~~users seeded properly~~
* ~~complete speaker list~~
* ~~version upgrades~~
* move to postgres
* security on admin stuff
* replicate wiki listing pages as output
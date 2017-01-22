# README

The core idea of this app is to make it easy for anyone to find how the NEA has benefitted their area and then call their congressperson.

Core flow: enter zipcode, get taken to page highlighting your congressional district and projects the NEA supported in it.

The congressional district page should show your congressperson's name, contact info, and suggest a script for calling them.

## Getting setup

```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

NOTE:  Seeds will take a long time, they're parsing a lot of data.

## Help wanted!

This is getting wired up as quickly as possible, but I'd definitely love help. Here's some ideas of how you could jump in...

  1. Backend: Pulling down congressperson info
  2. A beautiful design
  3. Frontend implementation
  4. Figuring out interaction & virality (comment on the conversation you had, and share with your friends?)

Ping me on twitter at @kbal11 to let me know if you're interested

# DevveD

DevveD is a **Rails** Software-as-a-Service web application that allows developers to create accounts and connect with other developers. Whether it is to find a partner for a hackathon, practice with pair programming, attending meetups with, grabbing coffee, whatever.

Developers of all skills are welcomed to join the site!

There is a basic level and a pro level membership.
  - Basic members have access to only see other user names and dev-level
  - Pro members pay $5/month for access to see other users contact information

#### Note for users going into Production
DevveD is connected to Stripe test environment so no payments will be charged.
If signing up as a pro member please use fake credit card number:
  - CC #4111111111111111
  - CVC #123
  - Exp Date #any future date

### Technology used
Boostrap
Stripe - integration for payments
Devise - user authentication
Paperclip - uploading images

### Installing

- [ ] run `bundle install` to download all necessary gems
- [ ] `rake db:create` to create the database
- [ ] `rake db:migrate` to create the tables
- [ ] `rake db:seed` to populate with seed data, optional

## Development Deployment

Run `rails s` and is defaulted to localhost:3000.

## Authors

* **Kevin Wang** - (https://github.com/kevwang424)

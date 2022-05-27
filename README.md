# Sequra Disbursements Challenge

This is a web app created for the Sequra challenge. Basically, logic is included here to handle order disbursements that can be created from cron jobs and background jobs and that are exposed to be queried through an endpoint as an API.

## Built With

- Ruby v3.0.2
- Ruby on Rails v6.1.5
- Rspec
- Clockwork

## Getting Started

To get a local copy up and running follow these simple example steps.

-[x] 1.- Click on the install or download button under the repository name and copy the URL by clicking on the icon.

### Prerequisites

Ruby: 3.0.2
Rails: 6.1.5
Postgres: >=9.5

### Setup

> Remember that you need install all the gems before trying to run the program. It's very important to follow the next instructions.

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

Seed your database

`rails db:seed`

`rails s`

You can hit the endpoint using your terminal:
`curl -X GET -G 'http://localhost:3000/api/v1/disbursements' -d 'merchant_id=1'`

### Run tests

```
    bundle exec rspec
```

## Authors

👤 **Emilio Contreras**

- Github: [@emiliocm9](https://github.com/emiliocm9)
- Email: [email](emilio.contreras97@gmail.com)

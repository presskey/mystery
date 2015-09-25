# Mysterious Ruby Backend 
[![Circle CI](https://circleci.com/gh/presskey/mystery.svg?style=svg)](https://circleci.com/gh/presskey/mystery)

Simple REST API Backend with basic access authentication and role-based authorization using [Pundit](https://github.com/elabs/pundit) policies.

## Features
* API (REST, JSON)
* Secured by basic auth
* Contains User model with different roles (admin, user, guest)
* Limits access to given part of API depending on User role
  * Admin has access to everything
  * User can read all, create all, but update and deleted only his records
  * Guest has only read access
* Contains two additional models (Spell and Ingredient) that are in relation 1 to many

## Installation
```
$ git clone git@github.com:presskey/mystery.git
$ cd mystery/
$ bundle install
$ rake db:setup
```

## Usage
```
$ rails s
```

## Running tests
```
$ rspec -fd spec/
```

## License
Mysterious Ruby Backend is released under the [MIT License](http://www.opensource.org/licenses/MIT).

# Jungle

A mini e-commerce application built with Rails 4.2. This project was meant to be a goal to work towards while self-learning a new language (ruby). 

The following features have been implemented: 

* As a Visitor I can go to the registration page from any page in order to create an account
* As a Visitor I can sign up for a user account with my e-mail, password, first name and last name
* As a Visitor I can sign in using my e-mail and password
* As a User I can log out from any page
* As a User I cannot sign up with an existing e-mail address (uniqueness validation)
* Passwords are not stored as plain text in the database. Instead, has_secure_password is used in the User model, leveraging the bcrypt gem
* When a product has 0 quantity, a sold out badge should be displayed on the product list page
* The order page contains items, their image, name, description, quantities and line item totals
* The final amount for the order is displayed
* The email that was used to place the order is displayed
* User must enter HTTP auth login/password to access admin functionality


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


## Final Project

![Home page](https://github.com/jvongsana/jungle-rails/blob/master/docs/home.png "Home page")
![Product Info](https://github.com/jvongsana/jungle-rails/blob/master/docs/product_info.png "Product Info")
![My Cart](https://github.com/jvongsana/jungle-rails/blob/master/docs/cart.png "My Cart with items added")
![Order Confirmation](https://github.com/jvongsana/jungle-rails/blob/master/docs/order_confirmation.png "Order Confirmation")

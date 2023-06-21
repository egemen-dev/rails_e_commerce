# Rails E Commerce

This is a Fullstack Ruby on Rails e-commerce application that provides a shopping cart experience. It allows users to browse products, add them to their cart, modify their choices, and proceed to checkout. It also provides a RESTful API that can be used to interact with the app.

Note: App can be further developed according to future needs or requirements.

![Screenshot 2023-06-19 at 15-54-06 RailsECommerce](https://github.com/egemen-dev/rails_e_commerce/assets/93445248/809bebfc-ac27-4306-9bbc-03eb705d84fa)

![Screenshot 2023-06-19 at 01-50-34 RailsECommerce](https://github.com/egemen-dev/rails_e_commerce/assets/93445248/dec1fe2d-fef6-4ca3-8376-099ea6aa52ea)

---

# Table of contents

<!--ts-->

- [Key Features](#key-features)
- [Design and Implementation](#design-and-implementation)

- [Getting started](#getting-started)
- [API Usage](#api-usage)
  - [User](#user)
    - [Sign up](#sign-up)
    - [Sign in](#sign-in)
  - [Items](#items)
    - [Get all items](#get-all-items)
    - [Get an item](#get-an-item)
  - [Cart](#cart)
    - [Show cart](#show-cart)
    - [Add item to cart](#add-item-to-cart)
    - [Update cart item](#update-cart-item)
    - [Delete cart item](#delete-cart-item)
    - [Checkout](#checkout)
  - [Bought Items](#bought-items)
    - [Get bought items](#get-bought-items)

<!--te-->

---

# Key Features

### User Authentication:

- Sign up and sign in functionality.

### Shopping Cart Functionality:

- Allows users to easily add and remove products from their shopping cart.
- Shows how many items are in the cart on the navigation bar.
- Verifies product availability before adding items to the cart.
- Provides the ability to update the quantity of products within the cart.
- Displays comprehensive cart details, including product information and total cost.

### Real-time Stock Updates:

- Instantly reflects changes when a product goes out of stock or the stock count is modified while browsing. All users are notified in real-time via TurboStreams.

### Data Validations:

- Secure data validations at the database, model, and controller levels to ensure the integrity and validity of entered data.

### Thorough Testing:

- Ensures a high-quality and reliable application through extensive testing.
- Robust test coverage of 99% across the entire application.

### Fullstack Rails App and RESTful API:

- Utilizes the same routes and controllers for both web and API interactions.
- Provides the complete functionality of a _fullstack_ RoR and _RESTful API_ application.

---

# Design and Implementation

![modelstr](https://github.com/egemen-dev/rails_e_commerce/assets/93445248/dc5a433f-5f66-453c-9312-b486456f6fc2)

I designed the app with a focus on simplicity, following the Keep It Simple Stupid (KISS) design principle, to achieve this I applied the following design and implementation strategies:

- For handling authentication, I integrated the Devise gem along with Devise-JWT to provide a secure and convenient authentication system. This allowed users to authenticate and access protected resources effortlessly.

- I utilized the simplecss framework, which is a semantic CSS framework and simple_form gem, which greatly simplified the process of generating HTML forms. This allowed me to focus on the functionality of the app rather than styling.

- To enable real-time UI updates, I adopted TurboStreams, which allowed me to update the UI seamlessly. Although JavaScript was rarely necessary, I employed StimulusJS controllers to automatically remove flash messages after a few seconds.

- To handle JSON responses, I utilized Rails Jbuilder, which made it straightforward to generate JSON structures for JSON type responses.

- For testing purposes, I employed MiniTest and Capybara to ensure the quality and reliability of the application through unit, controller, and system testing.

I wanted to make the app as simple as possible, so I decided to use the same controllers and routes for json requests and html requests. Instead of creating a new module for the API, I leveraged the Rails built-in functionality to handle both type of requests at the same time.

---

# Getting started

### Installation, setup and running locally

- Make sure you have ruby 3.2.1 and rails 7.0.5 installed.
- Git clone the repo and run `bundle install` to install all the gems.
- Run `rails db:setup` to create the database, load the schema, and load seed data.
- Run `rails s` to run the local server.
- Go to `localhost:3000` in web browser to access the application.
- Run `rails test:all` to run all the tests.

# API Usage

To test the API, you can use POSTMAN or any other API testing tool. I used Thunder Client, which is a VS Code extension.

Successful authentication returns a Bearer token. That must be included in the header of all subsequent requests.

The app has the following API endpoints:

## User

#### Sign up

```
Action: POST

Route: /users

Parameters:

{
  "user": {
    "email": "string",
    "password": "string",
    "password_confirmation": "string"
  }
}

Response: Created object will be returned and a Bearer token will be included in the header.
```

#### Sign in

```
Action: POST

Route: /users/sign_in

Parameters:

{
  "user": {
    "email": "string",
    "password": "string"
  }
}

Response: A Bearer token will be included in the header.
```

## Items

#### Get all items

```
Action: GET

Route: /items

* Returns all the items.

Example response:

[
  {
    "id": 1,
    "name": "Item 1",
    "description": "Item 1 description",
    "price": "9.99",
    "stock": 10,
    "created_at": "2023....",
    "updated_at": "2023...."
  },
  {
    "id": 2,
    "name": "Item 2",
    "description": "Item 2 description",
    "price": "9.99",
    "stock": 10,
    "created_at": "2023....",
    "updated_at": "2023...."
  }
]
```

#### Get an item

```
Action: GET

Route: /items/:id

* Returns an item.

Example response:

{
  "id": 1,
  "name": "Item 1",
  "description": "Item 1 description",
  "price": "9.99",
  "stock": 10,
  "created_at": "2023...",
  "updated_at": "2023..."
}
```

## Cart

#### Show cart

```
Action: GET

Route: /cart

* Returns the items in the cart and the cart total.

Example response:

{
  "cart_total": 999,
  "cart_items": [
    {
      "id": 15,
      "cart_id": 2,
      "item_id": 3,
      "quantity": 1,
      "created_at": "2023...",
      "updated_at": "2023..."
    }
  ]
}
```

#### Add item to cart

```
Action: POST

Route: /cart_items

Parameters:

{
  "cart_item": {
    "item_id": 1,
    "quantity": 3
  }
}

* Returns the cart item and the message.

Example response:

{
  "message": "Item added to cart.",
  "cart_item": {
    "id": 1,
    "cart_id": 1,
    "item_id": 1,
    "quantity": 3,
    "created_at": "2023...",
    "updated_at": "2023..."
  }
}
```

#### Update cart item

```
Action: PATCH

Route: /cart_items/:id

Parameters:

{
  "id": 1,
  "cart_item": {
    "item_id": 1,
    "quantity": 2
  }
}

* Returns the cart item and the message.

Example response:

{
  "message": "Cart item updated.",
  "cart_item": {
    "quantity": 2,
    "id": 1,
    "cart_id": 1,
    "item_id": 1,
    "created_at": "2023...",
    "updated_at": "2023..."
  }
}
```

#### Delete cart item

```
Action: DELETE

Route: /cart_items/:id

Parameters:

{
  "id": 1
}

* Returns the message.

Example response:

{
  "message": "Cart item deleted."
}
```

#### Checkout

```
Action: POST

Route: /cart/checkout

Parameters:

{
  "checkout": {
    "cart_number": "4242424242424242",
    "cart_expiration_month": "12",
    "cart_expiration_year": "2023",
    "shipping_address": "example address",
    "cart_cvv": "123"
  }
}

* Returns the message.

Example response:

{
  "message": "Checkout successful."
}
```

## Bought Items

#### Get bought items

```
Action: GET

Route: /bought_items

* Returns the bought items and total money spent.

Example response:

{
  "total_spending": 50,
  "bought_items": [
    {
      "id": 1,
      "cart_id": 2,
      "user_id": 2,
      "item_id": 1,
      "quantity": 1,
      "created_at": "2023...",
      "updated_at": "2023..."
    }
  ]
}
```

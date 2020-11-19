# T2A2 Marketplace Project

## artPlace

## Table of Content
---

| #   | Content                                                                      |
| --- | ---------------------------------------------------------------------------- |
| 1   | [Heroku and Github links](#R9)                                               |
| 2   | [Problem I am trying to solve](#R7)                                          |
| 3   | [Functionality and features](#R11)            |
| 4   | [Sitemap](#sitemap)                              |
| 5   | [Screenshots](#screenshots)                              |
| 6   | [Target audience](#target-audience)                                      |
| 7   | [Tech stack](#tech-stack)                      |
| 8   | [User stories](#R12)                        |
| 9   | [Wireframes](#R13)                                             |
| 10  | [ERD](#R14)      |
| 11  | [Explain the different high-level components (abstractions) in your app](#R15)  |
| 12  | [Detail any third party services that your app will use](#R16)|
| 13  | [Describe your projects models in terms of the relationships (active record associations) they have with each other](#R17)  |
| 14  | [Discuss the database relations to be implemented in your application](#R18)|
| 15  | [Describe the way tasks are allocated and tracked in your project](#R20)|


## R9

[Click here](https://artmarketplace.herokuapp.com/) to visit the deployed site on Heroku<br />
[Click here](https://github.com/Taeverenele/artPlace) to visit the GitHub repository

It's a two sided marketplace app where users can buy and sell art

## R7
## Problem I am trying to solve

There are many online marketplaces to sell and buy goods, but they are often cluttered and finding something specific can be difficult, furthermore they can often be complicated and not very user friendly.

artPlace is a  marketplace purely for affordable artwork, sold by the person next door, who just happens to be a hobbyist artist and is very talented (or not). Up until now she has created many paintings which she occasionally gifts to friends and family, but mainly puts into storage gathering dust and inevitably eventually throws in the bin. Here is a platform for her to try and sell some of these creations to make some extra cash. This website is also for people who cannot afford art, as art is usually expensive and often consider a luxury item, not a necessity. Here is a site that sells art for as little as $10, so everybody can score a bargain and you never know, this artwork might one day become a collectable worth thousands of dollars.

In the future, I would like to also add a page where a user is able to view the seller's profile with ratings and comments, as with any online marketplace, the buyer usually does not know the seller, so by having feedback from previous customers, it would give the artist more credibility (or not).

## R11

## Functionality and Features

The main functionality of this app is to buy and sell artworks. 

When a user visits the page, they are able to browse the gallery, but they have to be a registered user to view individual artwork, buy and sell items.

User registration is handled by Devise which comes with built in validation for user input such as:
  - email and password must be present when a new user signs up
  - on new user sign up form the password has to be entered twice and the entered passwords need to match
  - password needs to be at least 6 characters
Additionally I have added custom validation for registration form where first name and last name have to be present.

When creating a new listing, the user input has custom validation that checks:
- title of the artwork needs to be a certain length
- description has to be a certain length so it is descriptive enough and not just a word
- photo of the artwork has to be attached for buyers to see what the artwork actually looks like
- price needs to be more than a dollar but less than $1000

When purchasing an artwork, user is redirected to card payment service called Stripe, where the user enters their card details and once the sale has gone through, a confirmation of purchase is displayed.

User is able to easily view all their current, sold and purchased items through their personal dashboard. 

The website uses strong access controls to assure user's details are kept secure and only user who created a listing is able to modify that listing. The admin user though is able to modify and delete all listings to assure the website is kept pure and serves the purpose it was created for.

## Sitemap

![Sitemap](app/assets/images/docs/artWorld_sitemap.png)

## Screenshots

![Home Screen for desktop and tablet view](app/assets/images/docs/home_tablet_and_desktop.png)
![Home Screen for mobile view](app/assets/images/docs/home_mobile.png)
![Sign-Up form same for all devices](app/assets/images/docs/sign_up_form.png)
![Sign-In form same for all devices](app/assets/images/docs/sign_in_form.png)
![Gallery View for desktop and tablet view](app/assets/images/docs/gallery_tablet_and_desktop.png)
![Gallery View for mobile view](app/assets/images/docs/gallery_mobile.png)
![Show Screen for desktop and tablet view](app/assets/images/docs/show_tablet_and_desktop.png)
![Show Screen for mobile view](app/assets/images/docs/show_mobile.png)
![Dashboard for desktop view](app/assets/images/docs/dashboard_desktop.png)
![Dashboard for tablet and mobile view](app/assets/images/docs/dashboard_tablet_and_mobile.png)
![Edit Profile Form for all views](app/assets/images/docs/edit_profile.png)
![Payment Screen for desktop view](app/assets/images/docs/payment_desktop.png)
![Payment Screen for tablet and mobile views](app/assets/images/docs/payment_tablet_and_mobile.png)
![Sale Confirmation Screen for all views](app/assets/images/docs/sale_confirmation.png)

## Target-Audience

This app is for any hobbyist artist looking to sell their art or anyone looking to buy affordable art.

## Tech-Stack

- Ruby on Rails
- HTML
- SCSS (Bootstrap)
- JavaScript for Stripe check out
- PostgreSQL for database
- Heroku for deployment
- Cloudinary for image storage
- Git/GitHub for source control

## R12

## User Stories

- As an admin user, I want to be able to modify and delete all listings, so that I can have full control over what is being sold on the website.
- As an admin user, I want to be able to buy and sell, so that I can buy and sell artworks.
- As a visitor (not signed up), I want to be able to browse the gallery, so that if I find something I like I can create an account.
- As a visitor (not signed up), my access should be restricted, so that I cannot view, create, delete, buy art without registering first.
- As a visitor (not signed up), I want to be able to sign up, so that I can shop for art.
- As a user, I want to be able to sign in, so that I can buy and sell art.
- As a user, I want to be able to add listings, so that people can buy them.
- As a user, I want to be able to edit and delete my listings, so that I can update them when I need to.
- As a user, I want to be able to buy items, so that I can own them.
- As a user, I want to be able to edit my personal details, so that I can update them if anything changes.

## R13

## Wireframes

![Home Page](app/assets/images/docs/home_page.png)
![Sign-In Page](app/assets/images/docs/sign_in.png)
![Sign-up Page](app/assets/images/docs/sign_up.png)
![Index Page](app/assets/images/docs/index_page.png)
![Show Page](app/assets/images/docs/show_page.png)
![Create Artwork Page](app/assets/images/docs/create_artwork.png)
![Dashboard Page](app/assets/images/docs/dashboard.png)

## R14

## ERD

![ERD](app/assets/images/docs/erd.png)

## R15

## Explain the different high-level components (abstractions) in your app

**MODELS:**

<hr />

**User**

The model was generated as part of Devise gem, which is a user authentication system for Rails applications. User model has first name, last name, email and password attributes and Devise provides built in validations for email and password. I added validation to assure user is not able to sign up without providing first and last name.

**Roles**

Roles database was generated as part of Rolify Gem and it allows us to allocate users a role, which then makes it possible to control user access within the application. Rolify creates a table of role_ids and role_names and by also creating a connecting table between users and roles, it links together user_ids and role_ids. Rolify also creates an 'ability' model, where the logic of access control is stored. In this application, every user is by default given a role 'client', meaning they have full access to view the webpage but can only modify data that is specific to this user. There is one admin user, created through seeds.rb file, that has the ability to modify all data within the database, with the aim of keeping the data pure and specific to this website's purpose.

**Artwork**

Is a table where all listed artwork is stored. Every time a user adds a new artwork to be sold, the new entry gets saved in the database linking the current users ID to this artwork, therefore creating an association between users and artworks. To assure all artwork has the same relevant information throughout the application, the validation in this model validates that all fields are filled out and certain restrictions on user input fields to make sure there is no incorrect data.

**Sales**

Sales model consists of buyer_email, seller_email, amount, artwork_id and user_id. Both artwork_id and user_id are Foreign Keys from their relevant tables, creating associations between users and sales, and artworks and sales. Every time a user buys a piece of art, a new instance of a Sale is saved in the Sales model.

**CONTROLLERS:**

<hr />

**application_controller** is where functions needed for the whole application are stored. Here is where we allowed Devise to have access to additional parameters first and last name, also here is where we catch any CanCanCan Gem exceptions (errors) showing an error message and redirecting them to a safe page. More about CanCanCan below...

**artworks_controller** is where we have methods to action every CRUD operation to do with our artworks. As selling artworks is the main functionality of this website, these actions required their own controller as per convention. Before we can run any of the CRUD methods, the controller checks to see if there is a logged in user by running ```before_action :authenticate_user!, except: [:index]``` Rails method, made available to us because of Devise, which says that for every action, other than index, user needs to be signed in. If a non user tries to access an unauthorized page, they will be redirected to login page. Then when a user is logged in, they are able to create, read, update and destroy the artwork belonging to them.

**pages_controller** is a more generic controller that renders the root route (home page) and also the user dashboard, neither which require their own controller as their main functionality is accessing data from the database through models and allowing corresponding views to have access to that data. Just like in artworks_controller, here we have ```before_action :authenticate_user!, only: [:dashboard]``` to assure only a logged in user can see the dashboard information and this is not visible when manually manipulating the URL.

**sales_controller** homes the methods to create a new payment session, making use of Stripe gateway payment system, and also controls what happens when the sale goes through or gets cancelled. In our situation, a new sale gets created following a successful payment, inserting a new instance of a sale in the sales model and then redirecting us to the show page in the sales controller. If a sale gets cancelled, we get redirected with an error message.

**VIEWS:**

<hr />

Artworks, Pages and Sales controllers all have the appropriate views folders created to generate necessary views as per Rails convention. Additionally we have a Devise views folder and shared views folder. Devise views folder gets generated when adding Devise to your project and homes all necessary views to action user related actions. In our shared views folder we would have all partials that would be the same throughout our whole application. Currently there is only 'Navbar' partial in our shared folder as the only feature that is consistent throughout our application is the navbar.

**artworks folder** has the corresponding views from the artworks_controller for index, edit, new and show methods.<br />
In this folder I have also created couple of partials called: 
  - '_artwork' used in the index view to keep the view easy to read and clean.
  - '_form' used in the new artwork view separating the user input logic from what is actually rendered on the page.

**devise folder** gets generated when installing Devise in your project and homes all necessary views to action user related actions.

**layouts folder** is where we have the 'application.html.erb' file that gets autogenerated when first creating a new rails app. This is where all our views get rendered from using ```<%= yield %>```. This is also where we would add any partials that are the same all throughout the application, for example ```<%= render 'shared/navbar' %>``` to render navbar to all pages.

**pages folder** has the corresponding views from the pages_controller for home and dashboard methods.<br />
In this folder I have also created a few partials that are used in the dashboard to keep the code clean:
  - '_artworks' renders all currently available artworks listed by the current user
  - '_purchases' renders all purchased artworks by the current user
  - _sales' renders all bought artworks for the current user

**sales folder** has the corresponding view from sales_controller show method, that gets displayed after a successful sale of an artwork. 

**shared folder** is where all partials would be that are the same throughout the application. In this current app the only consistent view is the navbar. Partials are Rails convention to keep views clean and easy to read.

## R16

## Detail any third party services that your app will use

**Stripe** is one of the most popular payment gateway systems that allows credit and debit card processing through websites. It is easy to integrate to any online application and one of the biggest benefits is that it already comes PCI compliant, meaning it meets all security requirements for accepting online card payments. As per industry standards, eCommerce websites are not to store credit card information in their database, and when using Stripe, the user is redirected to Stripe's site to securely handle the credit card info and then redirected back to the eCommerce site when the payment is successfully processed.

**Heroku** is a cloud based deployment platform made easy through Git integration, meaning it is easy to push your local changes into Heroku through Git. Heroku is also compatible with PostgreSQL which is the database used in our project. Heroku is so widely used amongst developers because of its scalability, making it accommodating for apps of all sizes.

**Cloudinary** is a cloud based image and video management service and is used in our application to upload, store and manipulate images. It is industry standard nowadays not to store the images needed in your application locally, but instead in a server based storage such as cloud storage. Using such a service gives you seamless access to the photos from anywhere with an internet connection and does not clutter your local storage with thousands of photos (eCommerce sites usually have a lot of photos). Should an application use local storage, if the local server was to crash, the application would very likely lose all the files, whereas a cloud base service backs up all files, therefore should one server fail, the application still has access to everything.

**Bootstrap Gem** is a website styling tool to assist in quickly creating modern websites and apps. It is open-sourced for everyone to use and in extremely helpful especially when making use of its grid system, making website responsiveness easy to accomplish. Bootstrap is basically a giant collection of handy, reusable bits of code to style webpages quickly, allowing developers to spend less time on CSS and more on the development work.

**Simple Form Gem** makes form views clearer and user-friendly. It automatically creates labels and guesses if a text_area or text_field is required according to the input tag, resulting in significantly fewer lines of code. 

**Devise Gem** is a widely used authentication solution for Rails applications, making a simple authentication implementation quick and easy. Another thing that has made Devise so popular is the amount of documentation that is available, making it easily customizable. When creating a User model with Devise it creates all the code and routes required for users to be able to sign up, sign in, log out etc, a process that would take a developer a long time to create manually.

**Dotenv Gem** is a security feature that uses a hidden file system to keep all sensitive information used in an application, such as passwords, hidden from prying eyes. It allows for a creation of .env file where we can store all our sensitive data in environment variables and instead of using the sensitive information throughout the application, we are able to just use the variables. In order for the .env file to be not visible on hosting services such as GitHub, the .env file needs to be added to the .gitignore file, which means when pushing our local repository to a hosting service, the application is still able to make use of the information stored in the .env file but people viewing our repository are not able to see the file.

**Rolify Gem** is a role management library which allows us allocate roles to every user of the application. The true potential of Rolify is unleashed when using it together with CanCanCan Gem.

**CanCanCan Gem** is an authorization library for Rails that restricts user access. Together with Rolify Gem, we can check what role the current user has and grant a level of access depending on that role. As part of CanCanCan Gem set up, we are required to create an Ability Model where all the logic of access control is set up.

**Will_paginate Gem** is a easy solution to limit the amount of database calls made, for example on an index page of an eCommerce application, you can limit the amount of items displayed and have a link to show the next lot of items, only accessing that number of items from the database at one time.

## R17

## Describe your projects models in terms of the relationships (active record associations) they have with each other

In Rails active records associations are used to create connections between Active Record Models, making our database queries more efficient.

The **User** model has an association with Role model, created by Rolify Gem, in a form of calling a 'rolify' function within the User model. It adds a relationship between users and roles by creating a connecting table called users_roles, by pairing a user_id with a role_id. Under the hood, the relationship formed is: ```user has_and_belongs_to_many roles``` which uses a connecting table of data without having to create a separate model for that connecting table.<br />
Users also have a relationship with the Artwork model, as the main functionality of the app is that a user is able to sell their art, therefore a user has a relationship: ```user has_many artworks```. The relationship is optional as a user can exist without having any artwork for sale and if a user is deleted, the artworks belonging to that user get deleted as well. <br />
User is also connected to the Sales model by ```user has_many sales``` where the relationship is optional as a user can exist without having sold anything.
Below is how the relationships look in our User model in Rails:

```ruby
class User < ApplicationRecord
  rolify
  has_many :artworks, dependent: :destroy
  has_many :sales
end
```

The **Artwork** model has an association with the User model stating that: ```artwork belongs_to user```. This is a mandatory relationship as artwork can only ever be created by a user, so no artwork can exist without a connecting user_id. As mentioned above, adding the option ```dependent: :destroy``` in the User model association to the Artwork model will assure there are no orphaned records where a user no longer exists but the artwork created by them still does. <br />
Artwork model also has an association with the Sale model, where an artwork can only be bought once as this app is selling only unique artwork. In Rails we show that relationship as ```artwork has_one sale``` and this relationship is optional as an artwork can exist without being sold. Once again we utilise ```dependent: destroy``` option after this relationship to make sure all sales get destroyed when an artwork is destroyed. This is necessary for resetting the seeds file, otherwise sales will still exist in the database but the artwork_id attached to sale, does not match the newly generated artwork_ids. <br />
Lastly, we have a relationship between artworks and an image that we attach using Active Storage. The relationship ```artwork has_on_attached image``` allows for one-to-one mapping, where an artwork can have one file attached. This relationship also needs ```dependent: :destroy``` option to assure the image gets destroyed if an artwork gets destroyed, eliminating the possibility of orphaned records.

```ruby
class Artwork < ApplicationRecord
  belongs_to :user
  has_one :sale, dependent: :destroy
  has_one_attached :image, dependent: :destroy
end
```

The **Role** model is linked to User model in the same way User was linked to Role. The relationship is created when adding Rolify gem and it is ```role has_and_belongs_to_many users``` again making use of the joining table that was created by Rolify called users_roles.

```ruby
class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles
end
```

The last model that has relationships with other tables is the **Sale**. The relationship between the sale and artwork models states that ```sale belongs_to artwork``` and this is a mandatory relationship, meaning a sale can only exist if it has an artwork linked to it. <br />
Sale model also has an association with the user model with ```sale belongs_to user``` which again is mandatory because a sale cannot exist without a user who is currently in the process of buying this artwork.

```ruby
class Sale < ApplicationRecord
  belongs_to :artwork
  belongs_to :user
end
```
## R18

## Discuss the database relations to be implemented in your application

The database implemented in our project is a relational database, meaning data is stored in tables with rows that represent the instance of the model and columns that represent attributes of the model. These tables are related to each other using Primary Keys and Foreign Keys, using the SQL language for queries and maintenance. At design phase (outlining the ERD) we looked to make sure the data was up to date, relevant and there was no duplications in our tables. All tables have to have a Primary Key (PK) which is a column in a table that can uniquely identifies each row in the table. In order to establish relationships between tables we use Foreign Keys (FK), which is a column in a table that provides the link between tables as it references the PK of another table. In a relational database a PK can exist without a reference to a FK but a FK cannot exist if it has no corresponding PK, this is known as Orphaned Record, therefore all records that depend on a PK, should be destroyed if the record consisting the PK gets destroyed.

In this current project we have a User table that is linked to all other tables using its Primary Key user_id. 
- in Artwork table, user_id is used as a Foreign Key to link the two tables together, showing that an artwork is created by a user.
- in Role table, using role_id and user_id as Foreign Keys in a connecting table called users_roles, we link the tables together to show that a user can have many roles and a role can belong to many users. This is called a many-to-many relationship and is often represented by a connecting table like ours.
- in Sale table we reference the user_id as a Foreign Key because a sale must belong to a user.

The only other connection between tables in our database is that the artwork_id which is a Primary Key in our Artwork table, is used in our Sale table to link together those tables. This assures that a sale is associated with a specific artwork.

## R20

## 	Describe the way tasks are allocated and tracked in your project

[Click here](https://trello.com/b/kNR02ULs/artplace) to view my Trello board <br />

I made use of Trello, which is a Project Management Tool, but I found it more useful to break down tasks to do per a day and review the next day if the tasks from the previous day all got completed and if something still wasn't finished, I moved that task to be completed in the future.

Daily schedule
Day One (Fri 6th Nov)
- Get idea approved (Art Gallery)
- Create a sitemap of what the app will look like. From home page you can go to the gallery page, or you can sign in or sign up. From gallery page, when wanting to view details of one specific artwork, user is redirected to sign in page, where they are able to also sign up if they are not users already. Once user is signed in, they have the ability to sign out, view their activity in dashboard, edit their profile or view details of individual artworks. In the dashboard they are able to create a new artwork to sell or view their previous sales and purchases. In profile edit page they are able to change their personal details as well as cancel their account. On artwork show page, user is able to buy the artwork, in which case they are redirected to Stripe payment gateway and redirected back to the app when purchase has gone through successfully. 
- Write user stories for guest user, signed in user and admin user
- Make wireframes

Day Two (Mon 9th Nov)
- Create a new project called artPlace
- Add gems I know I will definitely make use of in the app:
  - Bootstrap
  - Simple Forms
  - Devise
- Create GitHub repository
- Deploy to Heroku and check if everything works

Day Three (Tue 10th Nov)
- Plan the ERD (user model, artworks model, sales model)
- Add Rolify gem and update ERD to have Roles model
- Start building the MVP
  - Users model with Devise
  - Artworks model (scaffold, as will need all CRUD functions for this model)
  - minimal style pages
  - Dashboard - think of what would be displayed
  - Authorization (CanCan gem to implement strong access control)

Day Four (Wed 11th Nov)
- Create seeds file to have users and artworks 
- Use Rolify to give users a role and restrict access using those roles
- Add roles to users in seeds file
- Add Stripe Gem
- Create SalesController and add methods (buy, success and cancel)
- Think about what a Sales model would need
- Create a Sales model
- Implement Stripe and add logic into buy method in SalesController
- Add 'Buy Now' button
- add eventListener to 'Buy Now' button using JavaScript on the show page

Day Five (Thur 12th Nov)
- Implement Active Storage and Cloudinary
- Admin user and Authorization with CanCanCan
- Look at destroying artwork when artwork has been bought or add availability to artwork table, which is true to start with and false when artwork has been purchased

Day Six (Fri 13th Nov)
- Sort out Navbar responsiveness (hamburger menu)
- Display Dashboard sales and purchases logic
- Check dependent destroy for all relationships
- Check and implement validations for user inputs
- Limit items shown in index view (pagination?)

Day Seven (Mon 16th Nov)
- Update documentation
- Create a user to sales association 
- Fix bugs

Day Eight (Tue 17th Nov)
- Start working on slide deck
- Add more sorting and searching functionalities to gallery page
- Fix bugs
- Add comments to code

Fix bugs
- change artwork association with sale from has_many to has_one and deal with consequences
- when user views purchases from dashboard, they should not have a buy now button (if available display the button)
- test if user has_many sales needs dependent destroy
- dashboard artworks should only show available artworks



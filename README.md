## Design Choices:

I wasn't too sure what the requested design called for, so I made some assumptions. 
I also namespaced all routes under "api" since these are only api calls

**User**
    
+ I added an admin boolean instead of an admin resource, so admins don't need to create an extra user to interact
    with the app.
+ I had users sign up with a unique email, mimicing other APIs and allowing the server to send emails to users (or admins for now)

**Coins**

+ I chose to set a starting value and have it increment/decrement based on transactions. Thus, emails are also sent based on coin values
+ I chose to include email logic in the transactions instead of coin, because I figured withdraws should normally trigger the emails

**Transactions**

+ I chose to use an integer 1 for deposit, and 0 for withdraw, so additional actions could be added in the future
+ Each transaction is made by a user and features one coin


Most of my notes can also be found commented out on relevant files. 

## MortgageHippo Coding Challenge: Coin Machine API
------
Welcome to the MortgageHippo Coding Challenge. For this challenge you will need to create a RESTful Rails API that will act as a Coin Machine, taking in Coins and performing a variety of functions. This README will be broken up into steps, please read through the entire README before beginning.

__If you have any questions during the course of this challenge please feel free to email elliott@mortgagehippo.com!__

### Setup & Technical Requirements
Setup for this is simple, please create a new Rails App and configure it to act exclusively with JSON format for the endpoints. Use any gems or patterns you feel are necessary, but be ready to explain any and all decisions you make along the way.

This project will not require Users or typical authentication, with devise or otherwise, instead please track Api Keys for the system and confirm validity of all api keys before a request is accepted.

Please interpret all steps as "direction", not "law", if you'd like to change something to make the system work better please do. Once again, however, please be ready to justify such changes.

### Step 1: Coins
Please create a resource called `Coin`. This should have two primary attributes: `Value` and `Name`. This resource will represent the accepted coins to be deposited into the system. Please allow any valid User to perform the following actions on `Coin`s:

* Create a New Coin
* Update Attributes on an existing Coin
* Delete a Coin from the System
* View all Coins
* View a single Coin
* Get the total Value of all Coins in the system at a given time

### Step 2: Deposits
Now that we have `Coin`s in our system we will need to track when `Coin`s are deposited. Create a new resource called `Transaction`, that will track whenever a deposit is made, one coin at a time. A `Transaction` resource should track the following information:

* When the `Transaction` took place
* The deposited `Coin`
* The Api User that performed the `Transaction`

Additionally, please enable the following endpoints for any valid User to perform for `Transaction`s:

* Get a list of all `Transaction`s
* Create a new `Transaction` & deposit a `Coin`
* Get a list of all `Transaction`s scoped to a specific Api User

### Step 3: Withdrawals
Since there is money in the system Users will want to take some of it out. Please extend the created `Transaction` resource to include when a User takes coins out of the system, again, only one coin at a time. A User is not limited by the amount they can withdraw (don't worry about tracking balances), but they can't take out `Coin`s that aren't there. Please create/modify the following endpoints:

* Decrement the amount of a specific `Coin` from the system. Also gracefully handle any errors associated with overdrawing a certain type of `Coin`
* Include all Withdrawals in any lists of all `Transaction`s

### Step 4: Alerting!
Since we don't want our Coin Machines to run low very often we will need to fill them up; in order to do this we will need to know when they are running low. Please set up a system for alerting all `Admin`s when the count of certain coin is low (> 4 in the system after a `Transaction`). Please keep the following in mind when sending alerts:

* Please send a single consistent email to all `Admin` emails, create an `Admin` resource to track this (single email means one email with all `Admin`s on it, not an individual email to each `Admin`)
* The email should contain the kind of `Coin`, the count, and the current value of all `Coin`s in the system
* Bonus Points if you send the email asynchronously

## Submission
When you are ready to submit this challenge, please email elliott@mortgagehippo.com with the following included:

* The URL of the deployed site
* The URL of the GitHub Repo
* Any additional notes you'd like to include

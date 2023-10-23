# Simple e-commerce app

This simple app can be cloned and set up locally by running the following commands in the terminal:
`rails db:create`
`rails db:migrate`
`rails db:seed`

The final command is to run the seed file that populates the app with a few items. 

To run the specs that ar cover the controllers and models, the command `spec` can be used, or `spec/<file location>` to run individual tests.

To run the app, use the `rails s` command in the console. When trying to add an item to your cart, you will be asked to create a new user to proceed.

I have used the gem Devise because it is a simple and fast way to create a User mode with authentication.

I made an effort to keep all classes relatively 'skinny' and single purpose, to keep the code simple and readable. I have purposely ignored some of the preferences in Rubocop, including names of Memoized variables and model validations, because I believed the files were clear as they are, and because I had other priorities for this projects that I wanted to spend my time on.

Initially, I modeled the app after a simple shop app with discount codes that I recently worked on in my spare time because I believed this would save me time. But unfortunately, because this app is quite a bit simpler I had to remove quite some functionality to keep the code more readable and to the point, which took time. However, it is now a fully functioning app for all the requirements with test coverage. I did not tick the payment requirement, because it is hardly a payment functionality, it is a button that changes two booleans, but works for this purpose. Because of this, I did not need to handle much of a possible exception for it. For an actual payment I would have wrapped the transfer in a database transaction block instead to ensure the data integrity.

Also for the sake of time, I have kept the front end for this app very simple. I have also not used any error logging, which would be very useful for in real life purposes if anything were to go wrong.

There is a total_price attribute for cart that I have not used, but for simplicity's sake I have used a simple method instead.

Again, if this was a real life used app it would be possible to improve certain parts of it. Orders and payments are a complex process, and rather than using two simple booleans, it would make more sense to implement state machines for all the possible scenarios and changes that ordering and paying through an app brings (such as unpaid, pending, paid, in progress, packed, picked up, shipped, etc.). Another thing I would change is that at the moment it is possible to 'pay and order' with an empty basket, which of course should not be possible.

## The Challenge

- [X] There should be an index page which lists the products that are available
- [X] Clicking on a product should show a details page
- [X] You can add items to your cart from the details page
- [X] There should be a cart page which shows the items in the cart and the total of everything in there
- [X] Add a checkout option to the cart
- [ ] Allow a user to make a (fake!) payment and handle success and failure


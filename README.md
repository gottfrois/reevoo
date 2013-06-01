# Reevoo programing assignment

*By Pierre-Louis Gottfrois*

Ruby version:

	$ ruby -v
	ruby 1.9.3p125 (2012-02-16 revision 34643) [x86_64-darwin11.4.0]

## Usage

From console please run:

	$ ./reevoo
	19.34
	3.11
	16.61

## How do I change the rules ?

In reevoo's file:

	fr_rule 		= ->(quantity, price) { (quantity / 2) * price }
	sr_rule 		= ->(quantity, price) { (quantity >= 3 ? quantity * 0.5 : 0) }
	my_new_rule = ->(quantity, price) { # do something here }

Simply define / update rules using `lambda`.

* `quantity` is the quantity of the item represented by the rule in the checkout object (already in the cart)
* `price` is the unitary price of the item represented by the rule
* the `lambda` **MUST** return a *Float* representing a price to substract to the final checkout price (represent how much money is saved due to the rule)

Push rules into an array like so:

	rules = []
	rules << fr_rule
	rules << sr_rule
	rules << my_new_rule

Then passe the array when creating a new checkout:

	Checkout.new(rules)

When you'll call `total` on `checkout` instance, it will apply each rules automaticaly.

## Specs

	$ rspec --version
	2.12.2

You can launch the specs with:

	rake

## Test Data error

I notice an error in the test data provided:

	Basket: FR1, SR1, FR1, CF1
	Total price expected: £22.25
Should be:
	Basket: FR1, SR1, FR1, CF1
	Total price expected: £19.34
Since:

* Rule: *buy-one-get-one-free offers and of fruit tea*
* 3.11 + 5.00 + ~~3.11~~ + 11.23 = 19.34

I choose to fully respect the rules given since in real life, an error could appear in the given specifications.

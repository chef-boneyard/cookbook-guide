# Chef Partner Cookbook Program

## Who should write a Chef Partner Cookbook?
This document is a specification for the Chef's Partner Cookbook Program. This is
a general guideline taken from the [technical specification][cookbook_guide] and
condensed down to these general points.

If you have any questions or thoughts, please reach out to <partnereng@chef.io>.

## What is a Chef Partner Cookbook?
* A cookbook written by a vendor with guidance from Partner Engineering at Chef
* A higher level of code quality compared to generic Community Cookbooks
* A vendor ongoing support of the cookbook for their application or integration
* A verified cookbook by both Chef and the vendor of the application or integration

## Why Write a Chef Partner Cookbook?

### Why Do People Write Chef Community Cookbooks?
* Help customers succeed
* Reach thousands of joint users
* Users provide real-world feedback
* Good marketing opportunity

### Why Would Your Company Want to Write a Chef Partner Cookbook?
* Chef's Partner Engineering helps you write your cookbook
* The cookbook is Open Source and freely available
 * we want to help all our users succeed with both companies' software
* Joint marketing opportunities
* A [Supermarket][supermarket] badge and working on a [Chef.io][chef.io] landing page
* All the benefits of Community Cookbooks!

### What is the Difference Between a Community and Partner Cookbook?
* Partner cookbooks follow the [cookbook guide][cookbook_guide]
* Partner cookbooks have a vendor behind them to have ongoing support and development
* Partner cookbooks are vetted by Partner Engineering at Chef before being approved
* Community cookbooks are best effort from the community
* Community cookbooks may or may not have ongoing vendor support
* Community cookbooks are not vetted by Partner Engineering

## What is Needed For a Chef Partner Cookbook?

### Partner Cookbook Documentation
* `README.md` explaining an overarching scope of the cookbook
 * Including sections on `SCOPE`, `REQUIREMENTS`, and `USAGE`
 * A good example is [here][readme_example]
* `CONTRIBUTING.md` explaining how to help further development
* `LICENSE` Apache v2 license provided (our preferred license)
* `TESTING.md` explaining how to test this cookbook
* Examples for how Chef Software cookbooks are managed
 * [github.com/chef-cookbooks/community_cookbook_documentation][community_cookbook_documentation]

### Partner Cookbook Style and Testing
* A constant ruby style by using [Rubocop][rubocop]
* A constant usage of [foodcritic][foodcritic]
* Unit tests done via [Chefspec][chefspec]
* Integration tests via [Test Kitchen][test_kitchen] and [Inspec][inspec] or [Serverspec][serverspec]
* Hosted tracking of the cookbook via [Code Climate][code_climate]

### Other Things We Look For
* Semantic versioning observed
* Use Chef's built-in Resources
* Windows support and testing where applicable
* Attributes defined and documented in the `attributes/default.rb`
* Idempotent recipes
 * recipes requiring multiple runs are generally discouraged
 * run the recipes twice to catch non-idempotent behavior
 * Private Recipes are generally a good pattern

## Where Will the Chef Partner Cookbook be Stored?

### Supermarket
* Chef's community site for sharing cookbooks
 * and other extensions
* A place to publish your cookbook
* "Chef Partner Cookbook" badge
 * [filter searches][list_of_partners] to highlight these results

### Official Chef Site
* Marketing will eventually add a landing page
* Links to your cookbook
* Light weight marketing

## When is the Chef Partner Cookbook Program starting?
* It's already started!
* A [list][list_of_partners] is here

## How can our company join the Chef Partner Cookbook Program?
* Contact Chef's Partner Engineering <partnereng@chef.io>
  * Discuss proposed cookbook features
  * Provide examples and documentation
  * Answer technical questions, code reviews, and provide feedback
  * Help promote usage


[cookbook_guide]: https://github.com/chef-partners/cookbook-guide
[supermarket]: https://supermarket.chef.io
[chef.io]: https://chef.io
[community_cookbook_documentation]: https://github.com/chef-cookbooks/community_cookbook_documentation
[readme_example]: https://github.com/
[rubocop]: https://github.com/bbatsov/rubocop
[foodcritic]: https://www.foodcritic.io
[chefspec]: https://github.com/sethvargo/chefspec
[test_kitchen]: https://kitchen.ci
[inspec]: https://github.com/chef/kitchen-inspec
[serverspec]: https://serverspec.org
[code_climate]: https://codeclimate.com/changelog/56030367e30ba04323004eea
[list_of_partners]: https://supermarket.chef.io/cookbooks?utf8=%E2%9C%93&q=&badges%5B%5D=partner&platforms%5B%5D=

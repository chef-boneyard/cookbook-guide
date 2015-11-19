## How do we Test our Cookbook? Integration Tests
* [Test Kitchen](https://kitchen.ci)
* Integration test with "real" machines
* Tests on each supported platform
* <https://kitchen.ci>
* Start with `chef generate cookbook`'s `.kitchen.yml`
* Use InSpec to test, use the Test Kitchen driver
 * https://docs.chef.io/inspec_reference.html
 * https://github.com/chef/kitchen-inspec

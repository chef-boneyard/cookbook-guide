## Integration Tests
* [Test Kitchen](https://kitchen.ci)
 * It's included with the [ChefDK](https://downloads.chef.io/chef-dk/).
* Integration test with "real" machines.
* Tests on each supported platform.
* Start with `chef generate cookbook`'s `.kitchen.yml`
* Use InSpec to test, use the Test Kitchen driver
 * [docs.chef.io/inspec_reference.html](https://docs.chef.io/inspec_reference.html)
 * [github.com/chef/kitchen-inspec](https://github.com/chef/kitchen-inspec)
* Multiple plugins and options, check the [ECOSYSTEM.md](https://github.com/test-kitchen/test-kitchen/blob/master/ECOSYSTEM.md).

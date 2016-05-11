## Hosted Testing Tools
* These may be configured to automatically test incoming PRs on GitHub
* Code Climate
 * checks code quality and runs automated tools
 * [Code Climate blog post on testing for Chef](https://codeclimate.com/changelog/56030367e30ba04323004eea)
 * example [github.com/chef-cookbooks/mysql/blob/master/.codeclimate.yml](https://github.com/chef-cookbooks/mysql/blob/master/.codeclimate.yml)
* Travis.CI
 * Rubocop, Food Critic, and ChefSpec are all supported
 * example: [github.com/chef-cookbooks/mysql/blob/master/.travis.yml](https://github.com/chef-cookbooks/mysql/blob/master/.travis.yml)
 * Be cautious on putting Test-Kitchen on Travis.CI, there is a possibility of being charged by public clouds

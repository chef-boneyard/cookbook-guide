## Advanced Debugging
* [Pry](https://pryrepl.org/) is an interactive shell for debugging Ruby.
* Chef has the pry gem already included as a dependency.
* Include this block in your recipes, libraries or custom Resources to drop into pry during a ```chef-client``` run.
```ruby
require 'pry'
binding.pry
```

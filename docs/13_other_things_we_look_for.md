## Other Things We Look For
* Semantic versioning observed
* Use Chef's built-in Resources
* Windows support and testing where applicable
* Attributes defined and documented in the `attributes/default.rb`
* Idempotent recipes
 * recipes requiring multiple runs are generally discouraged
 * run the recipes twice to catch non-idempotent behavior
* Private Recipes are generally a good pattern

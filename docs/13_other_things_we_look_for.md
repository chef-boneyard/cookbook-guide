## Other Things We Look For
* Semantic versioning observed
* Use Chef's built-in Resources
* Windows support and testing where applicable
* Attributes defined and documented in the `attributes/default.rb`
* Idempotent recipes
 * Recipes requiring multiple runs are generally discouraged
 * Run the recipes twice to catch non-idempotent behavior
* Private Recipes are generally a good pattern

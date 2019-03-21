Decision Tree

Build a decision tree (https://en.wikipedia.org/wiki/Decision_tree) for the TDD Cycle.

It should accept a User Story as an input. It should output a Feature.

It should include the following levels:

Feature Test
Unit Test
Implementation

It should include Refactoring.


How to use in the IRB to test TDD flow:

Deannas-MBP:decision_tree deanna@paddle.com$ irb
irb(main):001:0> require './lib/user_story.rb'
=> true
irb(main):002:0> user_story = UserStory.new
=> #<UserStory:0x007f8326836ea8 @rspec="Red">
irb(main):003:0> user_story.create_objects_messages
=> true
irb(main):004:0> user_story.feature_test
=> true
irb(main):005:0> user_story.unit_test
=> true
irb(main):006:0> user_story.run_rspec
=> "Red"
irb(main):007:0> user_story.write_code
=> true
irb(main):008:0> user_story.run_rspec
=> "Green"
irb(main):009:0> user_story.refactor_code
=> true
irb(main):010:0> user_story.implement
=> "Feature implemented!"

# Administrate::Field::ActsAsTaggable

An [Administrate](https://github.com/thoughtbot/administrate) field for supporting [ActsAsTaggableOn](https://github.com/mbleigh/acts-as-taggable-on).

## Usage

Add this line to your application's Gemfile:

```ruby
gem 'administrate-field-acts_as_taggable'
```

Then, in your dashboard, configure your `ActsAsTaggable` attribute with `Field::ActsAsTaggable`:

```ruby

# models/post.rb
class Post < ActiveRecord::Base
  acts_as_taggable_on :categories
end

# dashboards/post_dashboard.rb
class PostDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  ATTRIBUTE_TYPES = {
    name: Field::String,
    content: Field::Text,
    categories: Field::ActsAsTaggable
  }.freeze
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To generate documentation run `yard`. To view undocumented files run `yard stats --list-undoc`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/apsislabs/administrate-field-acts_as_taggable.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

---

# Built by Apsis

[![apsis](https://s3-us-west-2.amazonaws.com/apsiscdn/apsis.png)](https://www.apsis.io)

`slayer` was built by Apsis Labs. We love sharing what we build! Check out our [other libraries on Github](https://github.com/apsislabs), and if you like our work you can [hire us](https://www.apsis.io/work-with-us/) to build your vision.

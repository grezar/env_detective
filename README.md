# EnvDetective
[![Build Status](https://travis-ci.org/grezar/env_detective.svg?branch=master)](https://travis-ci.org/grezar/env_detective)

This gem is for detecting environment variables referred from ruby.

In the case which multiple applications share the same server and so many environment variables are exported in it, it may difficult to grasp which environment variable is referred from which application.

 `ENV.[]` and `ENV.fetch` will be caught and logged by this gem. It helps you to grasp the above thing.

**I wouldn't recommend using this gem in production.** You would achieve the purpose even in a staging or another environment.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'env_detective'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install env_detective

## Usage

### Minimum
This will override `ENV` and when `ENV` is referred, that will be logged to STDOUT.

```
require 'env_detective'

ENV = EnvDetective::Extension.new(ENV)
```

### Use another logger
If you want to use another logger or change output file, you can set logger like below.

```
require 'env_detective'
require 'logger'

ext = EnvDetective::Extension.new(ENV)
ext.logger = Logger.new(File.join(__dir__, 'log/env_detective.log'))
ENV = ext
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/grezar/env_detective.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

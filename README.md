
# DeviceDetectorRegexes

DeviceDetectorRegexes is a simple extender for [device_detector](https://github.com/podigee/device_detector) gem that makes it easy to add new regular expressions

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'device_detector_regexes'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install device_detector_regexes

## Usage

Map device_detector [regexes folder](https://github.com/podigee/device_detector/tree/develop/regexes) into your custom folder

```ruby
DeviceDetector.configure do |config|
  config.dir = "path/to/your/custom/folder"
end
```

Add new regexes to the appropriate file

```yaml
# your/custom/folder/regexes/client/mobile_apps.yml

# [] # leave an empty array here if the file is empty
- regex: 'Foo(?:[ /]([\d\.]+))'
  name: 'Bar'
  version: '$1'
  prefix: false # do not append piwik dd prefix
```

```ruby
client = DeviceDetector.new("Foo/2.1.2; Android: 9; Model:PAR-LX1; okhttp/3.12.8")
client.name         # => "Bar"
client.full_version # => "2.1.2"
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DeviceDetectorRegexes project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/karpinovsky/device_detector_regexes/blob/master/CODE_OF_CONDUCT.md).

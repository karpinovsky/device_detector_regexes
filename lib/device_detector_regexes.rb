require "device_detector"
require "dry/configurable"

Gem.find_files('device_detector_regexes/*.rb').each { |path| require path }

module DeviceDetectorRegexes

  extend Dry::Configurable

  setting(:dir, Dir.pwd) { |dir| Pathname(dir) }
end

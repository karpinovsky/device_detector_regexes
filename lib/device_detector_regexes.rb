require "device_detector_regexes/version"

require "device_detector"
require "dry/configurable"

module DeviceDetectorRegexes
  extend Dry::Configurable

  setting(:dir, Dir.pwd) { |dir| Pathname(dir) }

  class DeviceDetector::Parser
    private

    def filepaths
      filenames.each_with_object([]) do |filename, filenames|
        filenames << [filename.to_sym, File.join(ROOT, 'regexes', filename)]

        custom_file_path = File.expand_path(filename, File.join(DeviceDetectorRegexes.config.dir, 'regexes'))

        if File.exists?(custom_file_path)
          filenames << [filename.to_sym, custom_file_path]
        end
      end
    end
  end
end

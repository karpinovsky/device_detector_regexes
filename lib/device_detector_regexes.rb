# frozen_string_literal: true

require 'pathname'
require 'device_detector'

module DeviceDetectorRegexes; end

class DeviceDetector
  class << self
    class Configuration
      def dir
        @dir || Dir.pwd
      end

      def dir=(dir)
        @dir = Pathname(dir)
      end
    end
  end

  class Parser
    private

    def filepaths
      filenames.each_with_object([]) do |filename, filenames|
        # push custom files first due to higher precedence lookup than default files
        custom_file_path = File.expand_path(filename, File.join(DeviceDetector.config.dir, 'regexes'))
        filenames << [filename.to_sym, custom_file_path] if File.exist?(custom_file_path)

        filenames << [filename.to_sym, File.join(ROOT, 'regexes', filename)]
      end
    end

    def parse_regexes(path, raw_regexes)
      raw_regexes.map do |meta|
        raise "invalid device spec: #{meta.inspect}" unless meta[:regex].is_a? String

        meta[:regex] = build_regex(meta[:regex], meta[:prefix])
        meta[:path] = path
        meta
      end
    end

    def build_regex(src, prefix = true)
      Regexp.new (prefix ? '(?:^|[^A-Z0-9\-_]|[^A-Z0-9\-]_|sprd-)(?:' + src + ')' : src), Regexp::IGNORECASE
    end
  end
end

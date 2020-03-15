module DeviceDetectorRegexes
  class ::DeviceDetector::Parser
    private

    def filepaths
      filenames.each_with_object([]) do |filename, filenames|

        # push custom files first due to higher precedence lookup than default files
        custom_file_path = File.expand_path(filename, File.join(DeviceDetectorRegexes.config.dir, 'regexes'))
        if File.exists?(custom_file_path)
          filenames << [filename.to_sym, custom_file_path]
        end

        filenames << [filename.to_sym, File.join(ROOT, 'regexes', filename)]
      end
    end
  end
end

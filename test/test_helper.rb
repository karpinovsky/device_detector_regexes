# frozen_string_literal: true

require 'minitest/autorun'

$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require 'device_detector_regexes'

begin
  require 'pry'
end

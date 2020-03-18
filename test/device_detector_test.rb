# frozen_string_literal: true

require_relative 'test_helper'

class DeviceDetectorTest < Minitest::Test
  DIR = 'fixtures'

  def setup
    DeviceDetector.configure do |config|
      config.dir = File.join(__dir__, DIR)
    end
  end

  def test_configure_dir_returns_pathname
    assert DeviceDetector.config.dir == Pathname(File.join(__dir__, DIR))
  end

  def test_client_new_regexes
    client = DeviceDetector.new('Foo/2.5.5; iOS: 13.3.1')

    # look at test/fixtures/regexes/client/mobile_apps.yml; test/fixtures/regexes/oss.yml
    assert client.name == 'Foo'
    assert client.full_version == '2.5.5'
    assert client.os_name == 'iOS'
    assert client.os_full_version == '13.3.1'
  end
end

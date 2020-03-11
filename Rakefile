require "bundler/gem_tasks"

require "fileutils"

task :map_into, [:target_dir] do |t, args|
  files = [
    ["client", "browser_engine.yml"],
    ["client", "browsers.yml"],
    ["client", "feed_readers.yml"],
    ["client", "libraries.yml"],
    ["client", "mediaplayers.yml"],
    ["client", "mobile_apps.yml"],
    ["client", "pim.yml"],
    ["device", "cameras.yml"],
    ["device", "car_browsers.yml"],
    ["device", "consoles.yml"],
    ["device", "mobiles.yml"],
    ["device", "portable_media_player.yml"],
    ["device", "televisions.yml"],
    [".", "bots.yml"],
    [".", "oss.yml"],
    [".", "vendorfragments.yml"]
  ]

  files.each do |dir, filename|
    FileUtils.mkdir_p "#{args[:target_dir]}/regexes/#{dir}"
    File.open("#{args[:target_dir]}/regexes/#{dir}/#{filename}", "a") { |file| file.write("[] # live an empty array here if the file is empty") }
  end
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "logger"
require "env_detective"

require "minitest/autorun"

file = File.open(File.join(__dir__, '../tmp/env_detective.log'), File::WRONLY | File::CREAT)
ext = EnvDetective::Extension.new(ENV)
ext.logger = Logger.new(file, 0)
ENV = ext

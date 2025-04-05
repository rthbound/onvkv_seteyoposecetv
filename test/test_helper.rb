# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "onvkv_seteyoposecetv"

require "minitest/autorun"
require "minitest/focus"
require "pry"
Dir.glob(File.expand_path("conjugators/**/*_test.rb", __dir__)).each { |file| require file }

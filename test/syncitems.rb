#!/usr/bin/ruby

# Contributed by Georgy Buranov

require 'livejournal/login'
require 'livejournal/sync'

require 'test/unit'
require_relative 'credentials'

class TC_SyncEntries < Test::Unit::TestCase
  def setup
    @user = default_test_user
  end

  def test_zero_lastsync
    request = LiveJournal::Request::SyncItems.new(@user)
    request.run

    entries = request.all
    puts "Entries " + entries.inspect

    assert_not_nil entries.length > 3
  end

end
#!/usr/bin/ruby

# Contributed by Georgy Buranov

require 'livejournal/login'
require 'livejournal/entry'

require 'test/unit'
require_relative 'credentials'

class TC_ReadExistingEntries < Test::Unit::TestCase
  def setup
    @user = default_test_user
  end

  def test_read_entry_by_number

  end

  def test_read_last_3_entries
    request = LiveJournal::Request::GetEvents.new(@user, :recent => 3)
    entries = request.run

    puts "Entries " + entries.inspect
    entry3 = entries.find_by_display_id(2357)
    assert_equal entry3.subject, "Запись 3"
  end


end
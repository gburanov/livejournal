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

  def test_zero_lastsync
    request = LiveJournal::Request::GetEvents.new(@user, :lastsync => nil)

    entries = request.run
    #puts "Entries " + entries.inspect

    assert_not_nil entries.length > 3
  end

  def test_read_entry_by_number
    request = LiveJournal::Request::GetEvents.new(@user,
      :itemid => LiveJournal::Entry.item_id_from_public_id(2357))
    entry = request.run

    assert_equal entry.subject, "Запись3 "
  end

  def test_read_last_3_entries
    request = LiveJournal::Request::GetEvents.new(@user, :recent => 3)
    entries = request.run

    #puts "Entries " + entries.inspect
    assert_equal entries.length, 3

    entry3 = entries.find_by_display_id(2357)
    assert_equal entry3.subject, "Запись3 "
    assert_equal entry3.taglist, ["tag1", "tag2", "tag3"]
    assert_equal entry3.security, :private
    assert_equal entry3.event, "запись 3"

    entry2 = entries.find_by_display_id(2241)
    assert_equal entry2.subject, "Запись 2"
    assert_equal entry2.taglist, ["tag1", "tag2"]
    assert_equal entry2.security, :friends
    assert_equal entry2.event, "Test entry 2"

    entry1 = entries.find_by_display_id(1857)
    assert_equal entry1.subject, "Запись 1"
    assert_equal entry1.taglist, ["tag1"]
    assert_equal entry1.security, :public
    assert_equal entry1.event, "Текст записи 1"
  end


end
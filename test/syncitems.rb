#!/usr/bin/ruby

# Contributed by Georgy Buranov

require 'livejournal/login'
require 'livejournal/sync'
require 'livejournal/filter'

require 'test/unit'
require_relative 'credentials'

class TC_SyncEntries < Test::Unit::TestCase
  def setup
    @user = default_test_user
  end

  def test_zero_syncitems
    request = LiveJournal::Request::SyncItems.new(@user)
    request.run

    entries = request.all
    #puts "Entries " + entries.inspect
    assert_not_nil entries.length, 4

    entries_l = request.subset('L')
    assert_not_nil entries_l.length, 4
    #puts "Entries " + entries_l.inspect

    # get zero entry
    request = LiveJournal::Request::GetEvents.new(@user,
                                                  :itemid => entries_l[3])
    entry = request.run
    assert_equal entry.subject, "Запись3 "
  end

  def test_real_sync_entries
    sync = LiveJournal::Sync::Entries.new(@user)
    ret = sync.run_syncitems
    assert_equal ret, true

    sync.run_sync do |entries, lastsync, remaining|
      assert_equal entries.length, 4
      assert_equal remaining, 0
      assert_equal entries[9].subject, "Запись3 "

      # test tag filter at the same point of time
      tag_entries = LiveJournal::Filter.new(entries).by_tag('tag2')
      assert_equal tag_entries.length, 2
      #puts "Entries " + tag_entries.inspect
    end

  end

end
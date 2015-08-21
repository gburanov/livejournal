#!/usr/bin/ruby

$:.unshift '../lib'

require 'livejournal/entry'
require 'test/unit'

require_relative 'credentials'

include LiveJournal

class TC_RoundTrip < Test::Unit::TestCase
  def setup
    @user = default_test_user
  end

  def roundtrip entry
    postevent = Request::PostEvent.new(@user, entry)
    postevent.run

    getevents = Request::GetEvents.new(@user, :itemid => entry.itemid)
    new_entry = getevents.run
    assert_equal(new_entry, entry)

    delete = Request::EditEvent.new(@user, entry, :delete => true)
    delete.run
  end

  def test_roundtrip
    e = Entry.new
    e.subject = 'subject'
    e.event = 'event here'
    e.time = LiveJournal::coerce_gmt Time.now
    roundtrip e

    e = Entry.new
    e.subject = 'subject here'
    e.event = 'eventblah here'
    e.time = LiveJournal::coerce_gmt Time.now
    e.comments = :noemail
    e.preformatted = true
    e.security = :friends
    e.location = "test"
    roundtrip e
  end
end

# vim: set ts=2 sw=2 et cino=(0 :

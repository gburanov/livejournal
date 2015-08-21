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

  # Assert e1 and e2 are light equals (check not for all field)
  def assert_event_are_light_equal e1, e2
    return false if e1.class != e2.class

    [:subject, :event, :moodid,
     :mood, :music, :location, :taglist, :pickeyword,
     :preformatted, :backdated, :comments, :security, :allowmask,
     :screening,].each do |attr|
      return false if e1.send(attr) != e2.send(attr)
    end

    e1.compare_time(e2)
  end

  # We send new postevent and then try to get information about it
  # and remove it afterwards
  def roundtrip entry
    postevent = Request::PostEvent.new(@user, entry)
    postevent.run

    getevents = Request::GetEvents.new(@user, :itemid => entry.itemid)
    new_entry = getevents.run
    assert_event_are_light_equal(new_entry, entry)

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

#!/usr/bin/ruby

# Contributed by Georgy Buranov

require 'livejournal/login'
require 'livejournal/friends'

require 'test/unit'
require_relative 'credentials'

class TC_CheckFriendsList < Test::Unit::TestCase

  def setup
    @user = default_test_user
  end

  def test_friends
    request = LiveJournal::Request::Friends.new(@user)
    friends = request.run
    #puts "friends " + friends.inspect

    assert_equal friends.length, 2
    assert_equal friends[0].username, "navy_99"
    assert_equal friends[1].username, "gem_test"
  end

  def test_friends_of
    request = LiveJournal::Request::FriendOfs.new(@user)
    friendsof = request.run
    #puts "friends of " + friendsof.inspect

    assert_equal friendsof.length, 1
    assert_equal friendsof[0].username, "gem_test"
  end


end
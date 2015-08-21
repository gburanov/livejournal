#!/usr/bin/ruby

def default_test_user
  LiveJournal::User.new('gem_test','MyFakePass123456')
end
# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: livejournal 0.3.10 ruby lib

Gem::Specification.new do |s|
  s.name = "livejournal"
  s.version = "0.3.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Evan Martin", "Roman Shterenzon"]
  s.date = "2014-04-30"
  s.description = "LiveJournal module.  Post to livejournal, retrieve friends lists, edit entries, sync journal to an offline database."
  s.email = "romanbsd@yahoo.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "Changes",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/livejournal.rb",
    "lib/livejournal/basic.rb",
    "lib/livejournal/comment.rb",
    "lib/livejournal/comments-xml.rb",
    "lib/livejournal/database.rb",
    "lib/livejournal/entry.rb",
    "lib/livejournal/friends.rb",
    "lib/livejournal/login.rb",
    "lib/livejournal/logjam.rb",
    "lib/livejournal/request.rb",
    "lib/livejournal/sync.rb",
    "sample/export",
    "sample/fuse",
    "sample/graph",
    "sample/progressbar.rb",
    "setup.rb",
    "test/checkfriends.rb",
    "test/comments-xml.rb",
    "test/database.rb",
    "test/login.rb",
    "test/roundtrip.rb",
    "test/time.rb"
  ]
  s.homepage = "http://neugierig.org/software/livejournal/ruby/"
  s.rubygems_version = "2.2.2"
  s.summary = "Module for interacting with livejournal"
end


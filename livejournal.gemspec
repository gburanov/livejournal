# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{livejournal}
  s.version = "0.3.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Evan Martin"]
  s.date = %q{2010-11-19}
  s.description = %q{LiveJournal module.  Post to livejournal, retrieve friends lists, edit entries, sync journal to an offline database.}
  s.email = %q{martine@danga.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "Changes",
    "LICENSE",
    "README.md",
    "Rakefile",
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
  s.homepage = %q{http://neugierig.org/software/livejournal/ruby/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Module for interacting with livejournal}
  s.test_files = [
    "test/checkfriends.rb",
    "test/comments-xml.rb",
    "test/database.rb",
    "test/login.rb",
    "test/roundtrip.rb",
    "test/time.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end


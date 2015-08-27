module LiveJournal

  class Filter

    def initialize (entries)
      @entries = entries
    end

    def by_tag(tag)
      @entries.select { |key, entry|
        entry.taglist.include? tag
      }
    end

  end

end
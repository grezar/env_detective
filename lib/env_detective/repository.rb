module EnvDetective
  class Repository
    include Singleton

    def self.store(key, name)
      instance.store(key, name)
    end

    def self.stored?(key)
      instance.stored?(key)
    end

    def store(key, name)
      repo[key] ||= name
    end

    def stored?(key)
      repo[key]
    end

    def repo
      @repo ||= {}
    end
  end
end

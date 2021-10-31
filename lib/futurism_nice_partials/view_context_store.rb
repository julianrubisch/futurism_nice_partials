module FuturismNicePartials
  class ViewContextStore
    include Singleton

    def initialize
      @blocks = {}
    end

    def [](key)
      @blocks[key]
    end

    def []=(key, value)
      @blocks[key] = value
    end
  end

  ContextStoreItem = Struct.new(:context, :block, keyword_init: true)
end

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
      mutex.synchronize do
        @blocks[key] = value
      end
    end

    private

    def mutex
      @mutex ||= Mutex.new
    end
  end

  ContextStoreItem = Struct.new(:context, :block, keyword_init: true)
end

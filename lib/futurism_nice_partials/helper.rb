require "cable_ready/compoundable"

module FuturismNicePartials
  module Helper
    include Futurism::Helpers
    include CableReady::Compoundable

    alias_method :orig_futurize, :futurize

    def futurize(records_or_string = nil, extends:, **options, &block)
      compound_key = compound([records_or_string, extends, *options.to_a])
      FuturismNicePartials.store[compound_key] = ContextStoreItem.new(context: self, block: block.dup)

      renderer = PlaceholderRenderer.new
      orig_futurize(records_or_string, extends: extends, **options) { block.call(renderer) }
    end
  end

  class PlaceholderRenderer
    def placeholder(content = nil, options = {}, &block)
      block.call
    end

    def method_missing(symbol, *args); end
  end
end

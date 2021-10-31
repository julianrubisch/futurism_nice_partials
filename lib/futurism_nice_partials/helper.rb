require "cable_ready/compoundable"

module FuturismNicePartials
  module Helper
    include Futurism::Helpers
    include Futurism::OptionsTransformer
    include CableReady::Compoundable

    alias_method :orig_futurize, :futurize

    def futurize(records_or_string = nil, extends:, **options, &block)
      FuturismNicePartials.store[compound_key(records_or_string, extends: extends, **options)] = ContextStoreItem.new(context: self, block: block.dup)

      renderer = PlaceholderRenderer.new
      orig_futurize(records_or_string, extends: extends, **options) { block.call(renderer) }
    end

    def compound_key(records_or_string, extends:, **options)
      if records_or_string.is_a?(String)
        html_options = options.delete(:html_options)
        compound({partial: records_or_string, locals: dump_options(options)})
      else
        compound(dump_options(options))
      end
    end
  end

  class PlaceholderRenderer
    def placeholder(content = nil, options = {}, &block)
      block.call
    end

    def method_missing(symbol, *args); end
  end
end

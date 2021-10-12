module FuturismNicePartials
  module Helper
    include Futurism::Helpers

    alias_method :orig_futurize, :futurize

    def futurize(records_or_string = nil, extends:, **options, &block)
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

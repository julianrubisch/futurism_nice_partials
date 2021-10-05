module FuturismNicePartials
  module Helper
    include Futurism::Helpers

    alias_method :orig_futurize, :futurize

    def futurize(records_or_string = nil, placeholder:, extends:, **options, &block)
      # render records_or_string, &block
      orig_futurize(records_or_string, extends: extends, **options) { placeholder }
    end
  end
end

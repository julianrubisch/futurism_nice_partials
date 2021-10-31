module FuturismNicePartials
  module PartialExtension
    def placeholder(content = nil, options = {}, &block)
      @placeholder = capture(&block)
    end
  end
end

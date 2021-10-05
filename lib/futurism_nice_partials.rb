require "futurism"

require "futurism_nice_partials/version"
require "futurism_nice_partials/railtie"
require "futurism_nice_partials/helper"

module FuturismNicePartials
  extend ActiveSupport::Autoload

  autoload :Helper, "futurism_nice_partials/helper"

  ActiveSupport.on_load(:action_view) do
    include FuturismNicePartials::Helper
  end
end

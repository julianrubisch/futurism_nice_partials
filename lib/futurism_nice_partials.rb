require "futurism"
require "nice_partials"

require "futurism_nice_partials/version"
require "futurism_nice_partials/railtie"
require "futurism_nice_partials/helper"
require "futurism_nice_partials/partial_extension"
require "futurism_nice_partials/resources_extension"
require "futurism_nice_partials/view_context_store"

module FuturismNicePartials
  extend ActiveSupport::Autoload

  autoload :Helper, "futurism_nice_partials/helper"

  mattr_reader :store, instance_reader: false, default: FuturismNicePartials::ViewContextStore.instance

  ActiveSupport.on_load(:action_view) do
    include FuturismNicePartials::Helper

    Futurism::Resolver::Resources.prepend(FuturismNicePartials::ResourcesExtension)
    NicePartials::Partial.prepend(FuturismNicePartials::PartialExtension)
  end
end

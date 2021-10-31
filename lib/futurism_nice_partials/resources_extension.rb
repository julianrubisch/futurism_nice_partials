require "cable_ready/compoundable"

module FuturismNicePartials
  module ResourcesExtension
    include CableReady::Compoundable

    def resolve
      resolved_models.zip(@resources_with_sgids).each do |model, resource_definition|
        html = renderer_for(resource_definition: resource_definition).render(model)

        yield(resource_definition.selector, html, resource_definition.broadcast_each)
      end

      @resources_without_sgids.each do |resource_definition|
        options = options_from_resource(resource_definition)
        renderer = renderer_for(resource_definition: resource_definition)
        html =
          begin
            store_item = FuturismNicePartials.store[compound(dump_options(options))]

            partial = options.delete(:partial)
            renderer.render(partial, store_item.context, store_item.block).body
          rescue => exception
            error_renderer.render(exception)
          end

        yield(resource_definition.selector, html, resource_definition.broadcast_each)
      end
    end

    def renderer_for(resource_definition:)
      options = options_from_resource(resource_definition)

      @lookup_context = ActionView::LookupContext.new(ActionController::Base.view_paths)
      ActionView::PartialRenderer.new(@lookup_context, options)
    end
  end
end

module FuturismNicePartials
  module ResourcesExtension
    def resolve
      resolved_models.zip(@resources_with_sgids).each do |model, resource_definition|
        html = renderer_for(resource_definition: resource_definition).render(model)

        yield(resource_definition.selector, html, resource_definition.broadcast_each)
      end

      @resources_without_sgids.each do |resource_definition|
        resource = lookup_resource(resource_definition)
        renderer = renderer_for(resource_definition: resource_definition)
        html =
          begin
            partial = resource.delete(:partial)
            renderer.render(partial, resource_definition.controller.new.view_context, nil).body
          rescue => exception
            error_renderer.render(exception)
          end

        yield(resource_definition.selector, html, resource_definition.broadcast_each)
      end
    end

    def renderer_for(resource_definition:)
      options = lookup_resource(resource_definition)

      @lookup_context = ActionView::LookupContext.new(ActionController::Base.view_paths)
      @renderer ||= ActionView::PartialRenderer.new(@lookup_context, options)
    end
  end
end

# -*- encoding : utf-8 -*-

module ::Perspective::BindingTypes::HTMLViewModelBindings::InstanceBinding

  include ::Perspective::HTML::ViewModel::Bindings
  include ::CascadingConfiguration::Array

	##################
  #  to_html_node  #
  ##################
  
	def to_html_node( document = «initialize_document», view_rendering_empty = @«view_rendering_empty» )	  
    
    html_node = nil
    
    # if we have a pathmap we render conditionally
    if pathmap = «pathmap»
      
      if pathmap.match( ::Perspective.request.path )
        # lazy initialize binding (and run config proc)
        «initialize_container_from_class»
        «configure_container»
        html_node = super
      end

    else

      html_node = super

    end
    
    return html_node
  
  end
    
end

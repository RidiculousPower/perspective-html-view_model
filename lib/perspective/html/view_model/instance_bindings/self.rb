# -*- encoding : utf-8 -*-

module ::Perspective::HTML::ViewModel::InstanceBindings::Self
  
  ##################
  #  to_html_node  #
  ##################
  
	def to_html_node( document = «initialize_document», view_rendering_empty = @«view_rendering_empty» )	  
  
    return @«bound_container».«pathstack».to_html_node( document, view_rendering_empty )
	
  end
  
end

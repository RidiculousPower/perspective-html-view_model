# -*- encoding : utf-8 -*-

module ::Perspective::HTML::ViewModel::ObjectInstance

  include ::Perspective::HTML::View::ObjectInstance
  include ::Perspective::HTML::ViewModel::Configuration
  include ::Perspective::HTML::ViewModel::ObjectAndBindingInstance
  
  ############################
  #  «configure_containers»  #
  ############################

  def «configure_containers»
    
    «bindings».each do |this_binding_name, this_binding|
      this_binding.«configure_container» unless this_binding.«pathmap»
    end
    
  end

	##################
  #  to_html_node  #
  ##################
  
  # this is how a view_model renders
	def to_html_node( document = «initialize_document», view_rendering_empty = @«view_rendering_empty» )	  
  
    html_node = nil

    «pathstack».each do |this_binding|
      if this_binding.«pathmap».match( ::Perspective.request.path )
	      # lazy initialize binding (and run config proc)
	      this_binding.«initialize_container_from_class»
        this_binding.«configure_container»
	      html_node = super( document, view_rendering_empty )
        break
	    end
    end

    return html_node
	
  end

end

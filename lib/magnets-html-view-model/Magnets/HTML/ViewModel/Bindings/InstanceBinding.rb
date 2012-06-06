
module ::Magnets::HTML::ViewModel::Bindings::InstanceBinding

  include ::Magnets::HTML::ViewModel::Bindings
  
  ##############################
  #  __initialize_container__  #
  ##############################
  
  def __initialize_container__( initializing_for_path_match = false )
    
    container_instance = nil
    
    # If we're initializing for a path match or if we aren't path-based, initialize normally.
    # Otherwise we wait to initialize conditionally upon path match.
    if initializing_for_path_match or 
       ! __pathmap__
      
      container_instance = super()
      
    end
    
    return container_instance
    
  end

  #########################################
  #  __validate_binding_name_for_order__  #
  #########################################
  
  def __validate_binding_name_for_order__( binding_name )

    case binding_name
      
      when Symbol, String
      
        super
      
      else

        unless binding_name == self.class
          super
        end

    end
    
  end
  
  ##################
  #  to_html_node  #
  ##################
  
	#def to_html_node( document_frame, current_value = __value__ )
	#
	#end
	
  #########################################
  #  __render_element_in_binding_order__  #
  #########################################
	
	#def __render_element_in_binding_order__( self_as_html_node, binding_order_name )
	#
	#  html_node = nil
	#  
	#  
	#	return html_node
	#
	#end
	
end


module ::Perspective::HTML::ViewModel::Bindings::InstanceBinding

  include ::Perspective::HTML::ViewModel::Bindings
  
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

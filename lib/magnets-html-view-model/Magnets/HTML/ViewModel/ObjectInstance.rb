
module ::Magnets::HTML::ViewModel::ObjectInstance

  include ::Magnets::HTML::View::ObjectInstance

  include ::CascadingConfiguration::Array::Unique

	###################
  #  __pathstack__  #
  ###################

  attr_configuration_unique_array  :__pathstack__ do

    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_instance, is_insert )

      return __bindings__[ binding_instance.__name__ ]

    end
    
  end

	########################
  #  __render_binding__  #
  ########################
  
	def __render_binding__( document_frame, container_node, binding_instance )
    
    html_node = nil
    
	  case binding_instance
	    
      when self
      
        __pathstack__.each do |this_binding_instance|

          if this_binding_instance.__pathmap__.match( ::Magnets.request.path )

    	      # lazy initialize binding (and run config proc)
    	      this_binding_instance.__initialize_container__( true )

    	      # render
    	      html_node = super( document_frame, container_node, this_binding_instance )

            break
          
    	    end
      
        end

      else
      
    	  # if we have a pathmap we render conditionally
    	  if pathmap = binding_instance.__pathmap__
	    
    	    if pathmap.match( ::Magnets.request.path )

    	      # lazy initialize binding (and run config proc)
    	      binding_instance.__initialize_container__( true )

    	      # render
    	      html_node = super

    	    end
	    
    	  else
	    
    	    # render
    	    html_node = super

        end
	               
	  end

    return html_node

  end

end

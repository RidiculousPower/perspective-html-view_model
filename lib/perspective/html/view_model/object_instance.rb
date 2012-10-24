
module ::Perspective::HTML::ViewModel::ObjectInstance

  include ::Perspective::HTML::View::ObjectInstance

  include ::CascadingConfiguration::Array::Unique

  ############################
  #  __configure_bindings__  #
  ############################

  def __configure_bindings__
    
    __bindings__.each do |this_binding_name, this_binding_instance|
      unless this_binding_instance.__pathmap__
        this_binding_instance.__configure_container__
      end
    end
    
  end

	###################
  #  __pathstack__  #
  ###################

  attr_unique_array  :__pathstack__ do

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
  
	def __render_binding__( document_frame, 
	                        container_node, 
	                        binding_instance, 
	                        view_rendering_empty = @__view_rendering_empty__ )
    
    html_node = nil
    
	  case binding_instance
	    
      when self
      
        __pathstack__.each do |this_binding_instance|

          if this_binding_instance.__pathmap__.match( ::Perspective.request.path )

    	      # lazy initialize binding (and run config proc)
    	      this_binding_instance.__initialize_container_from_class__
            this_binding_instance.__configure_container__

    	      # render
    	      html_node = super( document_frame, container_node, this_binding_instance )

            break
          
    	    end
      
        end

      else
      
    	  # if we have a pathmap we render conditionally
    	  if pathmap = binding_instance.__pathmap__
	    
    	    if pathmap.match( ::Perspective.request.path )

    	      # lazy initialize binding (and run config proc)
    	      binding_instance.__initialize_container_from_class__
            binding_instance.__configure_container__

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

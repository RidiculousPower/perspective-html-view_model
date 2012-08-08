
module ::Perspective::HTML::ViewModel::ClassInstance

  ::Perspective::Bindings::Attributes.define_container_type( :HTML_view_model, true, :HTML_view )
  
  include ::Perspective::Bindings::AttributeContainer::HTMLViewModel
  
  ##################
  #  attr_pathmap  #
  ##################

  def attr_pathmap( binding_name, 
                    *optional_view_and_paths_or_parts_or_descriptors, 
                    & configuration_proc )
    
    view_class = nil
    
    case optional_view_and_paths_or_parts_or_descriptors[ 0 ]

      when ::Perspective::HTML::View::ClassInstance, 
           ::Perspective::HTML::ViewModel::ClassInstance

        view_class = optional_view_and_paths_or_parts_or_descriptors.shift

    end

    paths_or_parts_or_descriptors = optional_view_and_paths_or_parts_or_descriptors

    # Declare corresponding view binding.
    attr_view( binding_name, view_class, & configuration_proc )
    
    # Create pathmap instance.
    pathmap = ::Perspective::Request::PathMap.new( binding_name, *paths_or_parts_or_descriptors )
    
    binding_instance = __bindings__[ binding_name ]
    
    # Store pathmap with binding configuration it's associated with.
    binding_instance.__pathmap__ = pathmap
    
    # Put pathstack on self-match stack.
    # This stack is used when self is inserted in the binding_order.
    # First match will be used for insert in place of self.
    # Items that have been explicitly included in the binding_order will not be matched against.
    __pathstack__.push( binding_instance )
    
    return pathmap
    
  end
  
  ###################
  #  attr_basepath  #
  ###################
  
  def attr_basepath( binding_name, 
                     *optional_view_model_and_paths_or_parts_or_descriptors, 
                     & sub_declaration_proc )

    view_model_class = nil
    
    case optional_view_model_and_paths_or_parts_or_descriptors[ 0 ]
      when ::Perspective::HTML::ViewModel::ClassInstance
        view_model_class = optional_view_model_and_paths_or_parts_or_descriptors.shift
      when ::Perspective::HTML::View::ClassInstance
        raise ::ArgumentError, __method__.to_s + ' requires a View-Model, not a View.'
    end

    paths_or_parts_or_descriptors = optional_view_model_and_paths_or_parts_or_descriptors

    if view_model_class and block_given?
      
      raise ::ArgumentError, __method__.to_s + ' expects either View-Model or block, not both.'
      
    elsif block_given?
      
      view_model_class = ::Class.new do
        include ::Perspective::HTML::ViewModel
        attr_order self
      end
      
      constant_name = 'PerspectiveViewModel__' + binding_name.to_s
      const_set( constant_name, view_model_class )
      
      view_model_class.module_eval( & sub_declaration_proc )
      
    end

    # Declare corresponding view binding.
    attr_view( binding_name, view_model_class )
    
    # Create pathmap instance.
    pathmap = ::Perspective::Request::PathMap::BasePath.new( binding_name, *paths_or_parts_or_descriptors )

    binding_instance = __bindings__[ binding_name ]
    
    # Store pathmap with binding configuration it's associated with.
    binding_instance.__pathmap__ = pathmap
    
    # Put pathstack on self-match stack.
    # This stack is used when self is inserted in the binding_order.
    # First match will be used for insert in place of self.
    # Items that have been explicitly included in the binding_order will not be matched against.
    __pathstack__.push( binding_instance )
    
    return pathmap
    
  end

	################
  #  attr_order  #
  ################

	def attr_order( *binding_order_array )

    # Remove elements included in binding order from self-matching.
    # Self-matching returns the first matched path not included in binding order.
    binding_order_array.each do |this_binding_name|
      
      case this_binding_name
        
        when Symbol, String

          __pathstack__.delete( this_binding_name )

      end
      
    end
    
    return super
    
  end
  
  ##########
  #  path  #
  ##########
  
  def path( *descriptors )
    
    return ::Perspective::Request::Path.new( *descriptors )
    
  end
  
  #########################################
  #  __validate_binding_name_for_order__  #
	#########################################
	
	def __validate_binding_name_for_order__( binding_name )
	  
	  unless binding_name == self
      super
    end
	  
  end
	
  
end

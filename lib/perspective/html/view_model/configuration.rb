
module ::Perspective::HTML::ViewModel::Configuration

  include ::CascadingConfiguration::Array::Unique

	################
  #  attr_order  #
  ################

	def attr_order( *binding_order_array )

    # Remove elements included in binding order from self-matching.
    # Self-matching returns the first matched path not included in binding order.
    binding_order_array.each do |this_binding_name|
      case this_binding_name
        when ::Symbol, ::String
          «pathstack».delete( this_binding_name )
      end
    end
    
    return super
    
  end
  
	#################
  #  «pathstack»  #
  #################

  # This stack is used when self is inserted in the binding_order causing matching against self.
  # First match will be used for insert in place of self.
  # Items that have been explicitly included in the binding_order will not be matched against.
  attr_unique_array  :«pathstack» do

    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_instance, is_insert, parent_hash )

      return «bindings»[ binding_instance.«name» ]

    end
    
  end
  
end

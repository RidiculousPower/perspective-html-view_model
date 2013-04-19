# -*- encoding : utf-8 -*-

module ::Perspective::HTML::ViewModel::Configuration

  include ::CascadingConfiguration::Array::Unique

	################
  #  attr_order  #
  ################

	def attr_order( *binding_order_array )

    # Remove elements included in binding order from self-matching.
    # Self-matching returns the first matched path not included in binding order.
    binding_order_array.collect! do |this_binding_name|
      if this_binding_name.equal?( self )
        attr_self( this_binding_name = :«self» )
      else
        case this_binding_name
          when self
            attr_self( this_binding_name = :«self_as_view_model» )
          when ::Symbol, ::String
            «pathstack».delete( «binding»( this_binding_name ) )
        end
      end
      this_binding_name
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

    #================#
	  #  to_html_node  #
	  #================#

  	def to_html_node( document = configuration_instance.«initialize_document», 
  	                  view_rendering_empty = configuration_instance.view_rendering_empty? )	  

      html_node = nil

      each do |this_binding|
        if this_binding_html_node = this_binding.to_html_node( document, view_rendering_empty )
          html_node ||= ::Nokogiri::XML::NodeSet.new( document )
          html_node << this_binding_html_node
        end
      end

      return html_node

    end

    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_instance, is_insert, parent_hash )

      return configuration_instance.«bindings»[ binding_instance.«name» ]

    end
    
  end
  
end

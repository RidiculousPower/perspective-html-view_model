# -*- encoding : utf-8 -*-

module ::Perspective::HTML::ViewModel::ObjectAndBindingInstance

  include ::Perspective::HTML::View::ObjectAndBindingInstance

  include ::CascadingConfiguration::Array

  #####################
  #  «binding_order»  #
  #####################

  attr_array  :«binding_order» do

    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_name_or_instance, is_insert, parent_array )
      
      return case binding_name_or_instance
        when ::Symbol, ::String, ::Perspective::Binding::ClassBinding, ::Perspective::Binding::InstanceBinding
          super
        else
          case instance = configuration_instance
            when ::Perspective::HTML::ViewModel::ObjectInstance
              instance
            else
              binding_name_or_instance
          end
      end

	  end

  end

end

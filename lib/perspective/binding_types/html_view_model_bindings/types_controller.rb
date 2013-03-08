
class ::Perspective::BindingTypes::HTMLViewModelBindings::TypesController

  #############################
  #  self.new_class_bindings  #
  #############################
  
  ###
  # Can be overridden in BindingType modules.
  #
  def self.new_class_bindings( binding_type, bound_to_container, binding_name, *args, & configuration_proc )

    binding_instance = binding_type.class_binding_class.new( bound_to_container, 
                                                             binding_name, 
                                                             view_class,
                                                             *paths_or_parts_or_descriptors, 
                                                             & configuration_proc )
    
    bound_to_container.«pathstack».push( binding_instance )

    return binding_instance

  end
  
end

# -*- encoding : utf-8 -*-

class ::Perspective::BindingTypes::HTMLViewModelBindings::TypesController

  #############################
  #  self.new_class_bindings  #
  #############################
  
  ###
  # Can be overridden in BindingType modules.
  #
  def self.new_class_bindings( binding_type, bound_to_container, binding_name, *args, & configuration_proc )
    
    view_class = nil
    view_class = args.shift if ::Perspective::HTML::View::SingletonInstance === args[ 0 ]
    paths_or_parts_or_descriptors = args

    return binding_type.class_binding_class.new( bound_to_container, 
                                                 binding_name, 
                                                 view_class,
                                                 *paths_or_parts_or_descriptors, 
                                                 & configuration_proc )
    
  end

  ###############################
  #  self.enable_class_binding  #
  ###############################
  
  ###
  # 
  #
  def self.enable_class_binding( bound_to_container, binding_instance )
    
    super
    
    unless ::Perspective::BindingTypes::HTMLViewModelBindings::Self === binding_instance
      bound_to_container.«pathstack».push( binding_instance )
    end
    
    return binding_instance
    
  end

end

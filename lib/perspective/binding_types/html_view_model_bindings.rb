# -*- encoding : utf-8 -*-

module ::Perspective::BindingTypes::HTMLViewModelBindings
  
  ###############
  #  attr_path  #
  ###############
  
  define_binding_type( :path, :view )

  ###################
  #  attr_basepath  #
  ###################
  
  define_binding_type( :basepath, :path )
  
end

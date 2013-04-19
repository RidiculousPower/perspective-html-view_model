# -*- encoding : utf-8 -*-

module ::Perspective::BindingTypes::HTMLViewModelBindings
  
  ###############
  #  attr_self  #
  ###############
  
  define_binding_type( :self, :nil_property )

  ###############
  #  attr_path  #
  ###############
  
  define_binding_type( :path, :view )

  ###################
  #  attr_basepath  #
  ###################
  
  define_binding_type( :basepath, :path )
  
end

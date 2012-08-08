
module ::Perspective::HTML::ViewModel::Bindings
  
  include ::CascadingConfiguration::Setting
  
  ##################
  #  __pathmap__   #
  #  __pathmap__=  #
  ##################

  attr_configuration :__pathmap__
  
  Controller.alias_module_and_instance_methods( :pathmap, :__pathmap__ )
  
end

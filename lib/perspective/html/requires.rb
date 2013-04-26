# -*- encoding : utf-8 -*-

[

  'view_model/class_bindings/basepath',

  'view_model/instance_bindings/self',

  'view_model/configuration',
  'view_model/bindings',

  '../binding_types/html_view_model',
  '../binding_types/html_view_model_bindings/types_controller',
  '../binding_types/html_view_model_bindings/class_binding',
  '../binding_types/html_view_model_bindings/instance_binding',
  '../binding_types/html_view_model_bindings',

  '../binding_types/html_view_model_bindings/basepath/class_binding',
  '../binding_types/html_view_model_bindings/self/instance_binding',

  'view_model/singleton_instance',
  'view_model/object_instance'

].each { |this_file| require_relative( this_file << '.rb' ) }

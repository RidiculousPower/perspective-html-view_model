# -*- encoding : utf-8 -*-

files = [

  'view_model/class_bindings/basepath',

  '../binding_types/html_view_model',
  '../binding_types/html_view_model_bindings/types_controller',
  '../binding_types/html_view_model_bindings/class_binding',
  '../binding_types/html_view_model_bindings/instance_binding',
  '../binding_types/html_view_model_bindings',

  'view_model/configuration',
  'view_model/object_and_binding_instance',
  'view_model/bindings',
  'view_model/singleton_instance',
  'view_model/object_instance'

]

files.each { |this_file| require_relative( this_file << '.rb' ) }

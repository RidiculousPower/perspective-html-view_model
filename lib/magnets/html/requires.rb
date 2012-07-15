
basepath = 'view_model'

files = [

  'bindings',
  'bindings/class_binding',
  'bindings/instance_binding',

  'class_instance',
  'object_instance'
  
]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end

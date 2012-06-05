
require_relative '../../view/lib/magnets-html-view.rb'
require_relative '../../../pathmap/lib/magnets-pathmap.rb'
require_relative '../../../request/lib/magnets-request.rb'

module ::Magnets::HTML::ViewModel
  module Bindings
  end
end

basepath = 'magnets-html-view-model/Magnets/HTML/ViewModel'

files = [

  'Bindings',
  'Bindings/ClassBinding',
  'Bindings/InstanceBinding',

  'ClassInstance',
  'ObjectInstance'
  
]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end

require_relative( basepath + '.rb' )

module ::Magnets::Bindings::AttributeContainer::HTMLViewModel::ClassBinding
  include ::Magnets::HTML::ViewModel::Bindings::ClassBinding
end

module ::Magnets::Bindings::AttributeContainer::HTMLViewModel::InstanceBinding
  include ::Magnets::HTML::ViewModel::Bindings::InstanceBinding
end

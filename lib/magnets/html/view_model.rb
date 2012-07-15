
begin ; require 'development' ; rescue ::LoadError ; end

require 'magnets/html/view'
require 'magnets/path_map'
require 'magnets/request'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

# post-require setup
require_relative './setup.rb'

module ::Magnets::HTML::ViewModel

	extend ::Module::Cluster

	include ::Magnets::HTML::View

	include ::Magnets::HTML::ViewModel::ObjectInstance
	
	cascade = cluster( :magnets ).before_include_or_extend.cascade
	cascade.extend( ::Magnets::HTML::ViewModel::ClassInstance )
  
end

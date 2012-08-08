
begin ; require 'development' ; rescue ::LoadError ; end

require 'perspective/html/view'
require 'perspective/request/path_map'
require 'perspective/request'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

# post-require setup
require_relative './setup.rb'

module ::Perspective::HTML::ViewModel

	extend ::Module::Cluster

	include ::Perspective::HTML::View

	include ::Perspective::HTML::ViewModel::ObjectInstance
	
	cascade = cluster( :perspective ).before_include_or_extend.cascade
	cascade.extend( ::Perspective::HTML::ViewModel::ClassInstance )
  
end

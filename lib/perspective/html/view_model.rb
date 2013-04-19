# -*- encoding : utf-8 -*-

require 'perspective/html/view'
require 'perspective/request/pathmap'
require 'perspective/request'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

module ::Perspective::HTML::ViewModel

	include ::Perspective::HTML::View
	include ::Perspective::HTML::ViewModel::ObjectInstance
	
	extend ::Module::Cluster
	cluster( :perspective ).before_include_or_extend.cascade.extend( ::Perspective::HTML::ViewModel::SingletonInstance )

end

# ::Perspective::HTML::ViewModel::AnonymousViewModel uses ::Perspective::HTML::ViewModel so has to be loaded last
require_relative 'view_model/anonymous_view_model.rb'

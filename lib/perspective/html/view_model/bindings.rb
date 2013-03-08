# -*- encoding : utf-8 -*-

module ::Perspective::HTML::ViewModel::Bindings
  
  include ::Perspective::HTML::ViewModel::Configuration
  include ::Perspective::HTML::ViewModel::ObjectAndBindingInstance

  include ::CascadingConfiguration::Setting
  
  ################
  #  «pathmap»   #
  #  «pathmap»=  #
  ################

  attr_configuration :«pathmap»

  #############
  #  pathmap  #
  #############

  alias_method :pathmap, :«pathmap»

  ##############
  #  pathmap=  #
  ##############

  alias_method :pathmap=, :«pathmap»=
  
end

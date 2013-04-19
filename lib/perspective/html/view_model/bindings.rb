# -*- encoding : utf-8 -*-

module ::Perspective::HTML::ViewModel::Bindings
  
  include ::Perspective::HTML::ViewModel::Configuration

  include ::CascadingConfiguration::Setting
  
  ################
  #  «pathmap»   #
  #  «pathmap»=  #
  ################

  attr_instance_configuration :«pathmap»

  #############
  #  pathmap  #
  #############

  alias_method :pathmap, :«pathmap»

  ##############
  #  pathmap=  #
  ##############

  alias_method :pathmap=, :«pathmap»=

end

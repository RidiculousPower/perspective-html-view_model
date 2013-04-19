# -*- encoding : utf-8 -*-

module ::Perspective::HTML::ViewModel::ObjectInstance

  include ::Perspective::HTML::View::ObjectInstance
  include ::Perspective::HTML::ViewModel::Configuration
  
  #######################################
  #  «configure_container_for_binding»  #
  #######################################
  
  def «configure_container_for_binding»( binding_instance )

    super unless binding_instance.respond_to?( :pathmap ) and binding_instance.«pathmap»

  end


end

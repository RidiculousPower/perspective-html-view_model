# -*- encoding : utf-8 -*-

module ::Perspective::BindingTypes::HTMLViewModelBindings::ClassBinding
    
  include ::Perspective::HTML::ViewModel::Bindings

  ####################################
  #  initialize«new_between_common»  #
  ####################################

  def initialize«new_between_common»( binding_name, view_class = nil, *path_parts )

    super( binding_name, view_class )

    self.«pathmap» = ::Perspective::Request::Pathmap.new( «name», *path_parts )

  end
  
end

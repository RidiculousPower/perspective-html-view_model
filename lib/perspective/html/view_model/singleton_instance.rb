# -*- encoding : utf-8 -*-

module ::Perspective::HTML::ViewModel::SingletonInstance
  
  include ::Perspective::HTML::View::SingletonInstance
  
  include ::Perspective::BindingTypes::HTMLViewModelBindings
  include ::Perspective::HTML::ViewModel::Configuration

  ##########
  #  path  #
  ##########
  
  def path( *descriptors )
    
    return ::Perspective::Request::Path.new( *descriptors )
    
  end
	
end

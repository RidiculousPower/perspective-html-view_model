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
  
  #######################################
  #  «validate_binding_name_for_order»  #
	#######################################
	
	def «validate_binding_name_for_order»( binding_or_name )
	  
	  super unless binding_or_name.equal?( self )
	  
  end
	
end

# -*- encoding : utf-8 -*-

module ::Perspective::BindingTypes::HTMLViewModelBindings::ClassBinding
    
  include ::Perspective::HTML::ViewModel::Bindings

  ################
  #  initialize  #
  ################

  ###
  # 
  # @overload new( bound_container, binding_name, *path_parts, & configuration_proc )
  # @overload new( bound_container, binding_name, view_class, *path_parts, & configuration_proc )
  # @overload new( bound_container, ancestor_binding )
  #
  def initialize( bound_container, *args, & configuration_proc )
    
    binding_name = args.shift
    view_class = args.shift if ::Perspective::HTML::View::SingletonInstance === args[ 0 ]
    paths_or_parts_or_descriptors = args
    
    super( bound_container, binding_name, view_class, & configuration_proc )
    
    «initialize_pathmap»
    
  end
  
  ##########################
  #  «initialize_pathmap»  #
  ##########################
  
  def «initialize_pathmap»
    
    self.«pathmap» = ::Perspective::Request::Pathmap.new( «name», *paths_or_parts_or_descriptors )
    
  end

  #######################################
  #  «validate_binding_name_for_order»  #
	#######################################
	
	def «validate_binding_name_for_order»( binding_or_name )
	  
	  super unless binding_or_name.equal?( «view_class» )
	  
  end
  
end

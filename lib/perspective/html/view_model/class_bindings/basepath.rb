# -*- encoding : utf-8 -*-

module ::Perspective::HTML::ViewModel::ClassBindings::Basepath
  
  ##########################
  #  «initialize_pathmap»  #
  ##########################
  
  def «initialize_pathmap»
    
    self.«pathmap» = ::Perspective::Request::Basepath.new( «name», *paths_or_parts_or_descriptors )
    
  end
  
end

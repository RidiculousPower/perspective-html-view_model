
module ::Magnets::HTML::ViewModel

	extend ::ModuleCluster

	include ::Magnets::HTML::View

	include ::Magnets::HTML::ViewModel::ObjectInstance
	
	include_or_extend_cascades_prepend_extends ::Magnets::HTML::ViewModel::ClassInstance
  
end

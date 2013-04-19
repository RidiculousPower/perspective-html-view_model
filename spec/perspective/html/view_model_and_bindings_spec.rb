# -*- encoding : utf-8 -*-

require_relative '../../../lib/perspective/html/view_model.rb'

require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/container_and_bindings_spec/container_and_bindings_test_setup.rb'
require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/container_and_bindings_spec/container_and_bindings.rb'

describe ::Perspective::HTML::ViewModel do

  setup_container_and_bindings_tests( ::Perspective::HTML::ViewModel )
  
  it_behaves_like :container_and_bindings

end

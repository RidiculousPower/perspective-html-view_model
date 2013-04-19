# -*- encoding : utf-8 -*-

require_relative '../../../lib/perspective/html/view_model.rb'

require_relative '../../../../perspective-html-elements/lib/perspective/html/elements.rb'

describe ::Perspective::HTML::ViewModel do
  
  class ::Perspective::HTML::ViewModel::Mock
    include ::Perspective::HTML::ViewModel
    attr_path( :binding_name, 'some/path' ) { self.binding_name = 'some text' }
    attr_path :other_binding_name, ::Perspective::HTML::Elements::Text::Paragraph, 'some/other/path' do
      self.other_binding_name = 'some other text'
    end
    attr_path :binding_for_self_match, 'third/path' do
      self.binding_for_self_match = 'third binding text'
    end
    attr_order :binding_name, self, :other_binding_name
  end
  
  let( :view_model_class ) { ::Perspective::HTML::ViewModel::Mock }
  
  before( :all ) { ::Perspective.root = ::Perspective::HTML::ViewModel::Mock }
    
  ###############
  #  attr_path  #
  ###############
  
  context '#attr_path' do
    
    context 'without a view' do
      it 'is a binding with a pathmap' do
        view_model_class.has_binding?( :binding_name ).should == true
        view_model_class.•binding_name.«view_class».should == nil
        view_model_class.•binding_name.«pathmap».is_a?( ::Perspective::Request::Pathmap ).should == true
      end
      it 'will model a dynamic view based on view bindings and conditional pathmap bindings' do
        mock_request = ::Rack::MockRequest.new( ::Perspective )
        mock_response = mock_request.get( 'some/path' )
        mock_response.body.should == '<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
	<body>
		<div class="Perspective::HTML::ViewModel::Mock" id="[root]">some text</div>
	</body>
</html>
'
      end
    end
    
    context 'with a view' do
      it 'is a binding with a pathmap' do
        view_model_class.has_binding?( :other_binding_name ).should == true
        view_model_class.•other_binding_name.«view_class».should == ::Perspective::HTML::Elements::Text::Paragraph
        view_model_class.•other_binding_name.«pathmap».is_a?( ::Perspective::Request::Pathmap ).should == true
      end
      it 'will model a dynamic view based on view bindings and conditional pathmap bindings' do
        mock_request = ::Rack::MockRequest.new( ::Perspective )
        mock_response = mock_request.get( 'some/other/path' )
				mock_response.body.should == '<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
	<body>
		<div class="Perspective::HTML::ViewModel::Mock" id="[root]">
			<p class="Perspective::HTML::Elements::Text::Paragraph" id="other_binding_name">some other text</p>
		</div>
	</body>
</html>
'
      end
    end
    
    context 'with self' do
      it 'is a binding with a pathmap' do
        view_model_class.has_binding?( :binding_for_self_match ).should == true
        view_model_class.•binding_for_self_match.«view_class».should == nil
        view_model_class.•binding_for_self_match.«pathmap».is_a?( ::Perspective::Request::Pathmap ).should == true
      end
      it 'will model a dynamic view based on view bindings and conditional pathmap bindings' do
        mock_request = ::Rack::MockRequest.new( ::Perspective )
        mock_response = mock_request.get( 'third/path' )
        mock_response.body.should == '<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
	<body>
		<div class="Perspective::HTML::ViewModel::Mock" id="[root]">third binding text</div>
	</body>
</html>
'
      end
    end
    
  end

end

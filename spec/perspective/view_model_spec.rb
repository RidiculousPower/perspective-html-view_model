# -*- encoding : utf-8 -*-

require_relative '../../lib/perspective/html/view_model.rb'

require_relative '../../../perspective-html-elements/lib/perspective/html/elements.rb'

describe ::Perspective::HTML::ViewModel do
  
  ##################
  #  attr_pathmap  #
  ##################
  
  it 'will model a dynamic view based on view bindings and conditional pathmap bindings' do

    class ::Perspective::HTML::ViewModel::Mock

      include ::Perspective::HTML::ViewModel

      attr_pathmap :binding_name, 'some/path' do
        self.binding_name.«value» = 'some text'
      end

      has_binding?( :binding_name ).should == true
      binding_name.«view_class».should == nil
      binding_name.«pathmap».is_a?( ::Perspective::Request::Pathmap ).should == true
      
      attr_pathmap :other_binding_name, ::Perspective::HTML::Elements::Text::Paragraph, 'some/other/path' do |view_instance|
        self.other_binding_name.«value» = :value
        other_binding_name.view.content.«value» = 'some other text'
      end

      has_binding?( :other_binding_name ).should == true
      other_binding_name.«view_class».should == ::Perspective::HTML::Elements::Text::Paragraph

      attr_order :binding_name, :other_binding_name


    end

    ::Perspective.root = ::Perspective::HTML::ViewModel::Mock
    mock_request = ::Rack::MockRequest.new( ::Perspective )
    mock_response = mock_request.get( 'some/other/path' )

    mock_response.body.should == '<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
	<body>
		<div class="Perspective::HTML::ViewModel::Mock">
			<p class="Perspective::HTML::Elements::Text::Paragraph" id="other_binding_name">some other text</p>
		</div>
	</body>
</html>
'

    mock_response = mock_request.get( 'some/path' )

    mock_response.body.should == '<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
	<body>
		<div class="Perspective::HTML::ViewModel::Mock">some text</div>
	</body>
</html>
'
        
  end
  
end

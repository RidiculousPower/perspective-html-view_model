
require_relative '../../lib/magnets-html-view_model.rb'

require_relative '../../../magnets-html-elements/lib/magnets-html-elements.rb'

describe ::Magnets::HTML::ViewModel do
  
  ##################
  #  attr_pathmap  #
  ##################
  
  it 'can model a dynamic view based on view bindings and conditional pathmap bindings' do

    class ::Magnets::HTML::ViewModel::Mock

      include ::Magnets::HTML::ViewModel

      attr_pathmap :binding_name, 'some/path' do
        self.binding_name = 'some text'
      end

      has_binding?( :binding_name ).should == true
      binding_name.__view_class__.should == nil
      binding_name.__pathmap__.is_a?( ::Magnets::PathMap ).should == true
      
      attr_pathmap :other_binding_name, ::Magnets::HTML::Elements::Text::Paragraph, 'some/other/path' do |view_instance|
        self.other_binding_name = :value
        other_binding_name_view.content = 'some other text'
      end

      has_binding?( :other_binding_name ).should == true
      other_binding_name.__view_class__.should == ::Magnets::HTML::Elements::Text::Paragraph

      attr_order :binding_name, :other_binding_name


    end

    ::Magnets.root = ::Magnets::HTML::ViewModel::Mock
    mock_request = ::Rack::MockRequest.new( ::Magnets )
    mock_response = mock_request.get( 'some/other/path' )

    mock_response.body.should == '<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
	<body>
		<div class="Magnets::HTML::ViewModel::Mock">
			<p class="Magnets::HTML::Elements::Text::Paragraph" id="other_binding_name">some other text</p>
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
		<div class="Magnets::HTML::ViewModel::Mock">some text</div>
	</body>
</html>
'
        
  end
  
end

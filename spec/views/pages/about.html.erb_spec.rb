require 'spec_helper'

RSpec.describe 'pages/about' do
    it 'renders the page successfully' do
        render template: 'pages/about'
        #expect(view).to render_template("pages/about")
        expect(rendered).to match()
    end

end
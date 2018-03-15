require 'spec_helper'

feature 'sign in' do
  let(:user) do
    Fabricate(:user, email: 'user@timeoverflow.org', password: 'papapa22')
  end

  context 'with a valid password' do
    it 'signs the user in' do
      expect(Capybara.current_session.driver.browser.manage.cookie_named('_timeoverflow_session')).to be_falsy

      sign_in_with(user.email, 'papapa22')

      expect(Capybara.current_session.driver.browser.manage.cookie_named('_timeoverflow_session')).to be_truthy
    end
  end

  context 'with an invalid password' do
    it 'shows an error' do
      sign_in_with(user.email, 'wrong_password')
      expect(page).to have_content(I18n.t('devise.failure.invalid'))
    end
  end
end

module AuthHelper
  def http_login
    name = 'scott'
    password = 'niswonger'

    if page.driver.respond_to?(:basic_auth)
      page.driver.basic_auth(name, password)
    elsif page.driver.respond_to?(:basic_authorize)
      page.driver.basic_authorize(name, password)
    elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
      page.driver.browser.basic_authorize(name, password)
    else
      raise "I don't know how to log in!"
    end
  end  

  def log_into_administration
    user ||= FactoryGirl.create :admin_user
    visit admin_root_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Login'
  end
end

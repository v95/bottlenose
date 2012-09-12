require 'test_helper'

class AddUserTest < ActionDispatch::IntegrationTest
  setup do
    @prof = users(:fred)
    
  end

  test "add a student" do
    # Log in as a professor
    visit "http://test.host/main/auth?email=#{@prof.email}&key=#{@prof.auth_key}"

    within("div.flash-notice") do
      assert has_content?("Notice: Logged in");
    end

    click_link 'Your Courses'
    click_link 'Organization of Programming Languages'
    click_link 'Manage Registrations'

    # Add a new student.
    fill_in 'Name',  :with => 'Steve McTest'
    fill_in 'Email', :with => 'steve@example.com'
    click_button 'Register'

    # Verify that student was added.
    @steve = User.find_by_email('steve@example.com')
    assert_equal 'Steve McTest', @steve.name
    assert_equal 1, @steve.registrations.size
  end
end
require './test/test_helper'

class LinkTest < CapybaraTestCase
  def test_user_can_see_the_homepage
    visit '/'
    click_on "About"

    assert_equal 200, page.status_code
    assert_equal '/index', current_path
    assert page.has_content?("About Me!")
  end

  def test_user_can_see_other_pages
    visit '/'
    click_on "Contact"

    assert_equal 200, page.status_code
    assert_equal '/contact', current_path
    assert page.has_content?("Phone Number")
  end
end

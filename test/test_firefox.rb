require 'helper'

class TestFirefox < Test::Unit::TestCase

  context "Single profile in profiles.ini" do
    should "return profile path" do
      assert_equal(File.expand_path('~/.mozilla/firefox/2dpu5gr6.default'), Firefox::Profile.path(nil, 'test/fixtures/single-profile.ini'))
    end
  end

  context "Many profile in profiles.ini" do
    should "return profile path" do
      assert_equal(File.expand_path('~/.mozilla/firefox/2dpu5gr6.default'), Firefox::Profile.path(nil, 'test/fixtures/many-profile.ini'))
      assert_equal(File.expand_path('~/.mozilla/firefox/dnsdm9go.develop'), Firefox::Profile.path('develop', 'test/fixtures/many-profile.ini'))
    end
  end
end


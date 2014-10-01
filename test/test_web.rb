require 'minitest_helper'
require 'sinima/web'
require 'rack/test'

class Sinima::WebTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinima::Web
  end

  def test_index
    get '/'
    assert last_response.ok?
    assert_equal '[]', last_response.body
  end

  def test_detail
    get '/video.webm'
    assert last_response.ok?
    assert_match /video.webm/, last_response.body
  end
end

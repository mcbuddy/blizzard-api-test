# spec_helper.rb
require 'faraday'
require 'rake'
require 'rspec'
require 'json'
require 'yaml'
require 'pry'

# laod the enviroment variable into memory and assign it to constant ENV
config_path = File.expand_path("../config/environment.yml", __FILE__)
ENV = YAML::load_file(config_path)

# module wrapper for the Api Client for cleaner code and DRY
module ApiTestClient
  include Faraday

  # the function to get access token every each test executed
  # sample call: curl -u $client_id:$client_secret -d grant_type=client_credentials https://us.battle.net/oauth/token
  def get_access_token
    conn = Faraday::Connection.new ENV["LOGIN_URI"]
    conn.headers['Authorization']
    conn.params["grant_type"] = "client_credentials"
    conn.set_basic_auth(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])
    resp = conn.post "/oauth/token"

    json_resp = JSON.parse(resp.body)
    return json_resp["access_token"]
  end

  # get request wrapper
  # curl https://us.api.blizzard.com/d3/data/act/1?locale=en_US&access_token=USbc9COeeWlzMPinXOQB2T5gyGNOq8v9QF
  def get_request(uri, token)
    conn = Faraday::Connection.new ENV["BASE_URI"]
    conn.params["locale"] = "en_US"
    conn.params["access_token"] = token
    resp = conn.get uri

    json_resp = JSON.parse(resp.body)
    return json_resp
  end

  # post request wrapper
  def post_request(uri, token)
    conn = Faraday::Connection.new ENV["BASE_URI"]
    conn.params["locale"] = "en_US"
    conn.params["access_token"] = token
    resp = conn.post uri

    json_resp = JSON.parse(resp.body)
    return json_resp
  end

end

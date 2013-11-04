require 'demo_api_adapters/demo_api'

class Admin::BaseController < ApplicationController
  
  protected

  def api
    DemoApiAdapters::TeamApi.new(ENV['API_URL'] || 'http://localhost:3001/v1')
  end

end
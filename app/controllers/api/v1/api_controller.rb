class Api::V1::ApiController < ApplicationController
  before_action -> { doorkeeper_authorize! :api }
end

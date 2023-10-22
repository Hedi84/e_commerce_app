# frozen_string_literal: true

# Add a nice comment here once your app has taken shape!
class ApplicationController < ActionController::Base
    before_action :authenticate_user!
end

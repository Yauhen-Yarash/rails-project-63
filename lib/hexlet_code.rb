# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'

module HexletCode
  module_function

  def form_for(object, url: '#', method: 'post')
    "<form action='#{url}' method='#{method}'></form>"
  end

  class Error < StandardError; end
end

# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'
require 'hexlet_code/form_builder'

# Comment for this module
module HexletCode
  module_function

  def form_for(form_object, url: '#', method: 'post')
    return "<form action='#{url}' method='#{method}'></form>" unless block_given?

    builder = FormBuilder.new(form_object)
    yield(builder)
    "<form action='#{url}' method='#{method}'>#{builder.result.join}</form>"
  end

  class Error < StandardError; end
end

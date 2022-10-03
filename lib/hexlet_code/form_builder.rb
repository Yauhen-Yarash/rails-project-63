# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :result

    Tag::TAGS.each do |tag|
      define_method(tag) do |field_name, **params|
        params[:value] = @form_object.public_send(field_name)
        @result << Tag.build(tag, field_name, **params)
      end
    end

    def initialize(form_object)
      @form_object = form_object
      @result = []
    end
  end
end

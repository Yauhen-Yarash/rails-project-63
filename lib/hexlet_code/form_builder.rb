# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :result

    Tag::TAGS.each do |tag|
      define_method(tag) do |field_name = nil, **params|
        params[:value] = @form_object.public_send(field_name) if field_name && @form_object.respond_to?(field_name)

        @result << Tag.build(tag, field_name, **params)
      end
    end

    def initialize(form_object)
      @form_object = form_object
      @result = []
    end

    def submit(value = '')
      @result << Tag.submit(value)
    end
  end
end

# frozen_string_literal: true

module HexletCode
  module Tag
    module_function

    TAGS = %w[br img div label input textarea submit].freeze

    def build(tag_name, field_name = nil, **params)
      raise('Not supported tag') unless TAGS.include?(tag_name)

      if field_name
        public_send(tag_name, field_name, **params)
      else
        public_send(tag_name, **params)
      end
    end

    def br
      '<br>'
    end

    def img(src:)
      "<img src='#{src}'>"
    end

    def div(value: '')
      "<div>#{block_given? ? yield : value}</div>"
    end

    def label(for_field: nil, value: nil)
      "<label for='#{for_field}'>#{value || for_field.to_s.capitalize}</label>"
    end

    def input(name = nil, type: 'text', value: nil, as: 'input', **params)
      case as.to_s
      when 'input'
        label(for_field: name, value: value) +
          "<input name='#{name}' type='#{type}' value='#{value}'>"
      when 'text'
        textarea(name, value: value, **params)
      end
    end

    def textarea(name = nil, cols: 20, rows: 40, value: nil)
      label(for_field: name, value: value) +
        "<textarea name='#{name}' cols='#{cols}' rows='#{rows}'>#{block_given? ? yield : value}</textarea>"
    end

    def submit(value = 'Save')
      "<input name='commit' type='submit' value='#{value}'>"
    end
  end
end

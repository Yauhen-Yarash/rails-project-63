# frozen_string_literal: true

module HexletCode
  module Tag
    module_function

    TAGS = %w[br img div input textarea].freeze

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

    def input(name = nil, type: 'text', value: '', as: 'input', **params)
      if as.to_s == 'input'
        "<input name='#{name}' type='#{type}' value='#{value}'>"
      elsif as.to_s == 'text'
        textarea(name, value: value, **params)
      end
    end

    def textarea(name = nil, cols: 20, rows: 40, value: '')
      "<textarea name='#{name}' cols='#{cols}' rows='#{rows}'>#{block_given? ? yield : value}</textarea>"
    end
  end
end

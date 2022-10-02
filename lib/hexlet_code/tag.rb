# frozen_string_literal: true

module HexletCode
  # High level comment
  module Tag
    module_function

    TAGS = %w[br img input].freeze

    def build(tag_name, **args)
      raise('Not supported tag') unless TAGS.include?(tag_name)

      if args.empty?
        public_send(tag_name)
      else
        public_send(tag_name, **args)
      end
    end

    def br
      '<br>'
    end

    def img(src:)
      "<img src='#{src}'>"
    end

    def input(type:, value:)
      "<input type='#{type}' value='#{value}'>"
    end
  end
end

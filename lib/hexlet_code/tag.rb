module HexletCode::Tag
  extend self

  TAGS = %w[br img input].freeze

  def build(tag_name, **args)
    if TAGS.include?(tag_name)
      args.empty? ?
        public_send(tag_name) :
        public_send(tag_name, **args)
    else
      raise('Not supported tag')
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

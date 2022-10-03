# frozen_string_literal: true

require 'hexlet_code'

describe 'HexletCode' do
  # rubocop:disable Lint/ConstantDefinitionInBlock
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  # rubocop:enable Lint/ConstantDefinitionInBlock

  describe '#form_for' do
    it 'valid args' do
      user = User.new name: 'rob', job: 'hexlet', gender: 'm'

      expect(HexletCode.form_for(user)).to eql "<form action='#' method='post'></form>"
      expect(HexletCode.form_for(user, url: '/qwerty')).to eql(
        "<form action='/qwerty' method='post'></form>"
      )
      expect(HexletCode.form_for(user, url: '/qwerty', method: 'patch')).to eql(
        "<form action='/qwerty' method='patch'></form>"
      )

      result_1 = HexletCode.form_for user do |f|
        f.input :name
        f.input :job, as: :text
        f.input :job, as: :text, rows: 50, cols: 50
      end
      expect(result_1).to eql(
        "<form action='#' method='post'>"\
           "<input name='name' type='text' value='rob'>"\
           "<textarea name='job' cols='20' rows='40'>hexlet</textarea>"\
           "<textarea name='job' cols='50' rows='50'>hexlet</textarea>"\
         "</form>"
      )



    end
  end
end

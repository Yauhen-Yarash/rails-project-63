# frozen_string_literal: true

require 'hexlet_code'

describe 'HexletCode' do
  # rubocop:disable Lint/ConstantDefinitionInBlock
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  # rubocop:enable Lint/ConstantDefinitionInBlock

  describe '#form_for' do
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    describe 'empty form_for block' do
      it 'success' do
        expect(HexletCode.form_for(user)).to eql "<form action='#' method='post'></form>"
        expect(HexletCode.form_for(user, url: '/qwerty')).to eql(
          "<form action='/qwerty' method='post'></form>"
        )
        expect(HexletCode.form_for(user, url: '/qwerty', method: 'patch')).to eql(
          "<form action='/qwerty' method='patch'></form>"
        )
      end
    end

    describe 'with form_for block' do
      it 'success' do
        result = HexletCode.form_for user do |f|
          f.input :name
          f.input :job, as: :text
          f.input :job, as: :text, rows: 50, cols: 50
          f.submit
          f.submit 'Wow'
        end

        expect(result).to eql(
          "<form action='#' method='post'>"\
            "<label for='name'>rob</label>"\
            "<input name='name' type='text' value='rob'>"\
            "<label for='job'>hexlet</label>"\
            "<textarea name='job' cols='20' rows='40'>hexlet</textarea>"\
            "<label for='job'>hexlet</label>"\
            "<textarea name='job' cols='50' rows='50'>hexlet</textarea>"\
            "<input name='commit' type='submit' value=''>"\
            "<input name='commit' type='submit' value='Wow'>"\
          '</form>'
        )
      end
    end
  end
end

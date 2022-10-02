require 'hexlet_code'

describe 'HexletCode' do
  User = Struct.new(:name, :job, keyword_init: true)

  describe '#form_for' do
    it 'valid args' do
      user = User.new name: 'rob'

      expect(HexletCode.form_for user).to eql "<form action='#' method='post'></form>"
      expect(HexletCode.form_for user, url: '/qwerty').to eql(
        "<form action='/qwerty' method='post'></form>"
      )
      expect(HexletCode.form_for user, url: '/qwerty', method: 'patch').to eql(
        "<form action='/qwerty' method='patch'></form>"
      )
    end
  end
end
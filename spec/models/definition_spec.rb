require 'rails_helper'

RSpec.describe Definition, type: :model do
  describe '#rules_pass' do
    it 'should run pass rules depending on the context' do
      json = JSON.parse(file_fixture('definition.json').read)
      d = Definition.create(value: json)
      expect(d.rules_pass?(foo: { bar: '1', barf: '0' })).to be_truthy
    end
    it 'should fail rules depending on the context ' do
      json = JSON.parse(file_fixture('definition.json').read)
      d = Definition.create(value: json)
      expect(d.rules_pass?(foo: { bar: '0', barf: '1' })).to be_falsey
    end
  end
end
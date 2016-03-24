require 'spec_helper'
describe 'create_resources' do

  context 'with defaults for all parameters' do
    it { should contain_class('create_resources') }
  end
end

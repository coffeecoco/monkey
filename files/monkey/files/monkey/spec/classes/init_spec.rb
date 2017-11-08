require 'spec_helper'
describe 'monkey' do
  context 'with default values for all parameters' do
    it { should contain_class('monkey') }
  end
end

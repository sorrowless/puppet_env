require 'spec_helper'
describe 'envinstall' do

  context 'with defaults for all parameters' do
    it { should contain_class('envinstall') }
  end
end

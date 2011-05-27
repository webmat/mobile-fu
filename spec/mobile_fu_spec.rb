require 'spec_helper'

describe ActionController::MobileFu do
  before(:each) do
    @view = mock(:ActionView)
    @request = mock(:ActionRequest)
    @view.extend(MobilizedStyles)
    @view.stub!(:request).and_return(@request)
    @request.stub!(:user_agent)
  end

  def ua(str)
    @request.stub!(:user_agent).and_return(str)
  end

  it "will not explode" do
    ''.should == ''
  end
end

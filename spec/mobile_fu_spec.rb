require 'spec_helper'

describe ActionController::MobileFu do
  before(:each) do
    @view = mock(:ActionView)
    @request = mock(:ActionRequest)
    @view.extend(ActionController::MobileFu::InstanceMethods)
    @view.stub!(:request).and_return(@request)
    @request.stub!(:user_agent)
  end

  def ua(str)
    @request.stub!(:user_agent).and_return(str)
  end

  it "should let us detect user agents by providing a string" do
    ua 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341 Safari/528.16'
    @view.is_device?('iphone').should be_true
    @view.is_device?('iPhone').should be_true
    @view.is_device?('iPad').should   be_false
  end
end

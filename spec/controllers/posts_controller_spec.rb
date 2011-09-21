require 'spec_helper'

describe PostsController do
  it "the creation should be succes" do
    post 'create'
    response.should be_success
  end

  it "should re-render new template on failed save" do
    #MenuItem.any_instance.stubs(:valid?).returns(false)
    post 'create'
    assigns[:post].should be_new_record
    format.html {:notice}
    flash[:notice].should be_nil
    response.should render_template('new')
  end
  
  it "should pass params to post" do
    post 'create', :post => { :tittle => 'title',:body=>'body' }
  end

end
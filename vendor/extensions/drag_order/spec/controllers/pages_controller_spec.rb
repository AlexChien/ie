require File.dirname(__FILE__) + "/../spec_helper"

describe Admin::PagesController do

  dataset :users, :sort_pages
  
  before :each do
    login_as  :admin
  end
  
  describe '#sort' do
    before :each do
      @params = {
        :parent_id => pages(:one).id,
        :children  => "#{pages(:four).id},#{pages(:three).id},#{pages(:two).id}"
      }
    end
    
    context 'parent not sent' do
      it 'should return an error' do
        put :sort, :children => @params[:children], :format => 'js'

        response.should_not be_success
        response.body.should === 'Could not sort Pages.'
      end
    end
    
    context 'children not sent' do
      it 'should return an error' do
        put :sort, :parent_id => @params[:parent_id], :format => 'js'

        response.should_not be_success
        response.body.should === 'Could not sort Pages.'
      end
    end
    
    context 'parent and children sent' do
      it 'should return success' do
        put :sort, :parent_id => @params[:parent_id], :children => @params[:children], :format => 'js'

        response.should be_success
        response.body.should === 'Pages successfully sorted.'
      end
      
      it 'should reorder pages' do
        put :sort, :parent_id => @params[:parent_id], :children => @params[:children], :format => 'js'

        pages(:one).position.should === 1 # Don't change parent
        pages(:four).position.should === 0 # Start at zero
        pages(:three).position.should === 1
        pages(:two).position.should === 2 # End at 2
      end
    end
    
  end
  
end
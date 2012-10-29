require 'spec_helper'

describe MoviesController do
  describe "find_movies_with_same_director" do

   before :each do
     @fake_results = [mock('movie1'), mock('movie2')]
      @params = {}
    end

   it 'should call the method find_all_by_director in the movie model' do
     Movie.should_receive(:find_all_by_director).with('Riddley Scott').
       and_return(@fake_results)
     get :find_movies_with_same_director, @params.merge(:director => 'Riddley Scott')
   end

   describe 'after model action' do
     before :each do
       Movie.stub(:find_all_by_director).and_return(@fake_results)
       get :find_movies_with_same_director, @params.merge(:director => 'Riddley Scott')
     end

     it 'should render proper view' do
       response.should render_template('find_movies_with_same_director')
     end

     it 'should store movie list in variable available to the view' do
       assigns(:movies).should == @fake_results  # .should eq(expected_value)
     end
   end
 end
end

require 'spec_helper'

describe "routing to find_movies_with_same_director" do
  it "routes /movies/find_movies_with_same_director to movie#find_movies_with_same_director" do
    { :get => "find_movies_with_same_director" }.should route_to(
      :controller => "movies",
      :action => "find_movies_with_same_director",
     )
  end

  it "The route does not work." do
    { :get => "find_movies_with_same_director" }.should_not be_routable
  end
end


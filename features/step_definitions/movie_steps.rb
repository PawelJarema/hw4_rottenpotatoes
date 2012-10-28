Given /^the following movies exist:$/ do |table|
    # table is a Cucumber::Ast::Table
    table.hashes.each do |movie|
      Movie.create!(movie)
    end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  movie = Movie.find(:first, :conditions => { :title => arg1 })
  flunk('The movie and the director don\'t match each other') unless movie.director == arg2
end

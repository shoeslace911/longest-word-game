require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('a'...'z').to_a.sample(10)
  end

  def score
    @answer = params[:answer]
    @grid = params[:grid].split(" ")
    dictionary =  URI.open("https://wagon-dictionary.herokuapp.com/#{@answer}").read
    parsed_dictionary = JSON.parse(dict ionary)
    if parsed_dictionary["found"] && (@answer.chars - @grid).empty?
      @result = "winner"
    elsif parsed_dictionary["found"]
      @result = "word exist but not in grid"
    else
      @result = "#{@answer} It's not a valid word"
  end
end
end

# @answer = params[:answer].chars
#

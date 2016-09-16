class HackerNewsController < ApplicationController
  helper HackerNewsHelper
  def index
    data = [
      {
        one: 'two',
        three: 'four'
      },
      {
        one: 'two',
        three: 'four'
      }
    ]
    render xml: data
  end
end

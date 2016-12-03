require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @dictionary = Word.all()
  erb(:index)
end

post('/word') do
  @word = params.fetch("word")
  @definition = params.fetch('definition')
  @speach_part = params.fetch('speach_part')
  @new_word = Word.new(:word=> @word)
  @new_word.save()
  @new_definition = Definition.new({:definition=> @definition, :speach_part=> @speach_part})
  @new_definition.save()
  @dictionary = Word.all()
  erb(:success)
end

get('/word/:id') do
  @displayed_word = Word.find(params.fetch('id').to_i())
  erb(:word_view)
end

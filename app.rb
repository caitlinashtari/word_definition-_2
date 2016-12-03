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
  @word = params.fetch('word')
  @definition = params.fetch('definition')
  @speach_part = params.fetch('speach_part')
  @new_word = Word.new(:word=> @word)
  @new_word.save()
  @new_definition = Definition.new({:definition=> @definition, :speach_part=> @speach_part})
  @new_definition.save()
  @dictionary = Word.all()
  @new_word.add_definition(@new_definition)
  erb(:success)
end

get('/word/:id') do
  @displayed_word_id = params.fetch('id').to_i()
  @displayed_word = Word.find(@displayed_word_id)
  @displayed_speach = Definition.find(params.fetch('id').to_i())
  erb(:word_view)
end

get('/word/:id/definition_new') do
  @new_definition_word_id = params.fetch('id').to_i
  erb(:definition_new)
end

post('/definition_new') do
  @word_id = params.fetch("new_definition_word_id").to_i
  @second_definition_word = params.fetch('second_definition')
  @second_speach_word = params.fetch('second_speach')
  @second_definition = Definition.new({:definition=> @second_definition_word, :speach_part=> @second_speach_word})
  @word = Word.find(@word_id)
  @word.add_definition(@second_definition)
  erb(:success)
end

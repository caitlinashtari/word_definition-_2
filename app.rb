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

post('/dictionary') do
  @word = params.fetch("word")
  @definition = params.fetch('definition')
  @speach_part = params.fetch('speach_part')
  new_word = Word.new(@word).save() #{:word=>"incipient"}
  new_definition = Definition.new({:definition=> @definition, :speach_part=> @speach_part}).save() #{:definition=>"in an initial stage", :speach_part=>"adjective"}.save
  new_entry = new_word.add_definitions(new_definition)
  erb(:success)
end

class Word
  @@words = []

  attr_reader :word, :definition, :id

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
    @id = @@words.length + 1
  end

  define_singleton_method(:all) do
    @@words
  end

end

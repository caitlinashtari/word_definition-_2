class Definition
  @@definitions = []
  attr_reader :definition, :speach_part, :id

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @speach_part = attributes.fetch(:speach_part)
    @id = @@definitions.length + 1
  end
end

class Definition
  @@definitions = []
  attr_reader :definition, :speach_part, :id

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @speach_part = attributes.fetch(:speach_part)
    @id = @@definitions.length + 1
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |ident|
    found_definition = nil
    @@definitions.each do |definition|
      if definition.id.eql?(ident.to_i)
        found_definition = definition
      end
    end
    found_definition
  end
end

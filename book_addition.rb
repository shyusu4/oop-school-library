class Book
    def to_json(*args)
        {
          
          "json_class"  => self.class.name,
          'book'             => [ title, author ]
        }.to_json(*args)
      end

      def self.json_create(object)
        new(*object['book'])
      end
end
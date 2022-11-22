class Book
    def to_json(*args)
        {
          JSON.create_id  => self.class.name,
          'book'             => [ title, author ]
        }.to_json(*args)
      end

      def self.json_create(object)
        new(*object['book'])
      end
end
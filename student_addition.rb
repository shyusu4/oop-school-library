class Student
    def to_json(*args)
        {
          "json_class"  => self.class.name,
          'stud'             => [classroom, age, name ]
        }.to_json(*args)
      end

      def self.json_create(object)
        new(*object['stud'])
      end
end
class Teacher
    def to_json(*args)
        {
          "json_class"  => self.class.name, 
          'teacher'  => [specialization, age, name]
        }.to_json(*args)
      end

      def self.json_create(object)
        new(*object['teacher'])
      end
end
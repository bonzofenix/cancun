class Cancun
  class Dsl
  end

  class Process
    class Query
      def execute(&cmd)
        @cmd = cmd
      end

      def and_type(*args)
        @type = hash
        self
      end

      def sort(field)
        @sort = field
        self
      end
    end

    class User
      def self.where(hash)
        Query.new(self).where(hash)
      end

      def self.sort(field)
        Query.new(self).sort(field)
      end
    end
  end

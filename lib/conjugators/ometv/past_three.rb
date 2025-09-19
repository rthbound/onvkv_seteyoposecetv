module Conjugators
  module Ometv
    class PastThree
      def initialize(tense)
        @tense = tense
      end

      def self.person_conjugations
        {
          '1ps' => %w{owimvts},
          '2ps' => %w{owetskemvts oweckemvts oweccemvts owetcemvts },
          '3ps' => %w{owemvts},
          '1pp' => %w{owēyemvts},
          '2pp' => %w{owatskemvts owackemvts},
          '3pp' => %w{owakemvts}
        }
      end

      def conjugate!
        {
          '1ps' => conjugate('1ps'),
          '2ps' => conjugate('2ps'),
          '3ps' => conjugate('3ps'),
          '1pp' => conjugate('1pp'),
          '2pp' => conjugate('2pp'),
          '3pp' => conjugate('3pp')
        }
      end

      private
      def conjugate(person)
        self.class.person_conjugations.fetch(person)
      end
    end
  end
end

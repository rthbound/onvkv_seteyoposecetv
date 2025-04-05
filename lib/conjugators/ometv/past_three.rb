module Conjugators
  module Ometv
    class PastThree
      def initialize(tense)
        @tense = tense
      end

      def self.person_conjugations
        {
          '1ps' => %w{towimvts},
          '2ps' => %w{towetskemvts toweckemvts toweccemvts towetcemvts },
          '3ps' => %w{towemvts},
          '1pp' => %w{towēyemvts},
          '2pp' => %w{towatskemvts towackemvts},
          '3pp' => %w{towakemvts}
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

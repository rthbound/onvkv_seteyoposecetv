module Conjugators
  module Ometv
    class PastTwo
      def initialize(tense)
        @tense = tense
      end

      def self.person_conjugations
        {
          '1ps' => %w{owivnks},
          '2ps' => %w{owetskvnks oweckvnks oweccvnks owetcvnks },
          '3ps' => %w{owvnks},
          '1pp' => %w{owēyvnks},
          '2pp' => %w{owatskvnks owackvnks},
          '3pp' => %w{owakvnks}
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

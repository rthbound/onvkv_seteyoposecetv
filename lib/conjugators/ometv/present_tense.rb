module Conjugators
  module Ometv
    class PresentTense
      def initialize(tense)
        @tense = tense
      end

      def self.person_conjugations
        @person_conjugations ||= {
          '1ps' => %w{owis},
          '2ps' => %w{owetskes oweckes owecces ontces onckes ontses },
          '3ps' => %w{os},
          '1pp' => %w{owēs},
          '2pp' => %w{owatskes owackes owatses }, # towat
          '3pp' => %w{owakes}
        }
      end

      def conjugate!
        @@conjugations ||= {
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

module Conjugators
  module StativeVerbs
    class PastOne < PresentTense
      private

      def conjugate(type:, tense:)
        case type
        when :basic_present
          send(tense) + "tis"
        when :tos_auxiliary
          [send(tense), "towis"].join(" ")
        end
      end
    end
  end
end

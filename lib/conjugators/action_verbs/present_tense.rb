module Conjugators
  module ActionVerbs
    class PresentTense
      NA                  ="N/A".freeze
      OMETV_REGEX         = /^o[mw]etv/.freeze
      ETV_REGEX           = /etv$/.freeze
      S                   = ?s.freeze
      ETV                 = "etv".freeze
      L                   = ?l.freeze
      M                   = ?m.freeze
      N                   = ?n.freeze
      UE_REGEX            = /ue\Z/

      UE                  ="ue".freeze
      EMPTY_STRING        = "".freeze
      VOWEL_REGEX         = /[aeēiovu]/.freeze
      LGRADES = {
        'v'.freeze        => 'a'.freeze,
        'e'.freeze        => 'ē'.freeze,
      }.freeze
      NULL_E_ENDING_REGEX = /e\z/.freeze
      I_ENDING_REGEX      = /i$/.freeze
      Ē                   = 'ē'.freeze
      IYĒ                 = 'iyē'.freeze
      E_SPACE             = 'e '.freeze
      SPACE_TOS           = ' tos'.freeze

      extend Conjugators::ActionVerbs::Shared
      # Note, MVSKOKE language here
      def initialize(verb)
        @verb = verb

        raise "Invalid verb. Verb must end with 'etv'." unless @verb.end_with?(ETV)
        raise "Invalid verb. Verb must be at least 5 letters long" unless @verb.size > 4
        raise "Invalid verb. Verb must contain at least one vowel (excluding those in the '-etv' suffix)" unless @verb[0..-4].match?(VOWEL_REGEX)

        @irregular = !!irregulars[@verb]
      end

      def word_filter
        @@word_filter ||= {
          "yvfketv" => {
            :conjugate_1ps => { basic_present: [NA], basic_durative: [NA], tos_auxiliary: [NA], ometv_conjugated_auxiliary: [NA] },
            :conjugate_2ps => { basic_present: [NA], basic_durative: [NA], tos_auxiliary: [NA], ometv_conjugated_auxiliary: [NA] },
            :conjugate_1pp => { basic_present: [NA], basic_durative: [NA], tos_auxiliary: [NA], ometv_conjugated_auxiliary: [NA] },
            :conjugate_2pp => { basic_present: [NA], basic_durative: [NA], tos_auxiliary: [NA], ometv_conjugated_auxiliary: [NA] },
            #:conjugate_3ps => { basic_present: [NA], basic_durative: [NA], ometv_conjugated_auxiliary: [NA] },
            :conjugate_3pp => { basic_present: [NA], basic_durative: [NA], ometv_conjugated_auxiliary: [NA] },
          }
        }
      end

      def conjugate!
        {
          verb: @verb,
          first_person_singular: {
            basic_present:              conjugate(tense: :conjugate_1ps, type: :basic_present),
            basic_durative:             conjugate(tense: :conjugate_1ps, type: :basic_durative),
            tos_auxiliary:              conjugate(tense: :conjugate_1ps, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_1ps, type: :ometv_conjugated_auxiliary)
          },
          second_person_singular: {
            basic_present:              conjugate(tense: :conjugate_2ps, type: :basic_present),
            basic_durative:             conjugate(tense: :conjugate_2ps, type: :basic_durative),
            tos_auxiliary:              conjugate(tense: :conjugate_2ps, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_2ps, type: :ometv_conjugated_auxiliary)
          },
          third_person_singular: {
            basic_present:              conjugate(tense: :conjugate_3ps, type: :basic_present),
            basic_durative:             conjugate(tense: :conjugate_3ps, type: :basic_durative),
            tos_auxiliary:              conjugate(tense: :conjugate_3ps, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_3ps, type: :ometv_conjugated_auxiliary)
          },
          first_person_plural: {
            basic_present:              conjugate(tense: :conjugate_1pp, type: :basic_present),
            basic_durative:             conjugate(tense: :conjugate_1pp, type: :basic_durative),
            tos_auxiliary:              conjugate(tense: :conjugate_1pp, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_1pp, type: :ometv_conjugated_auxiliary)
          },
          second_person_plural: {
            basic_present:              conjugate(tense: :conjugate_2pp, type: :basic_present),
            basic_durative:             conjugate(tense: :conjugate_2pp, type: :basic_durative),
            tos_auxiliary:              conjugate(tense: :conjugate_2pp, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_2pp, type: :ometv_conjugated_auxiliary)
          },
          third_person_plural: {
            basic_present:              conjugate(tense: :conjugate_3pp, type: :basic_present),
            basic_durative:             conjugate(tense: :conjugate_3pp, type: :basic_durative),
            tos_auxiliary:              conjugate(tense: :conjugate_3pp, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_3pp, type: :ometv_conjugated_auxiliary)
          }
        }
      end

      private
      def conj_send(tense)
        send(tense)
      end

      def conjugate(type:, tense:)
        return [word_filter.dig(@verb, tense, type)] if word_filter.dig(@verb, tense, type)
        @type = type
        case type
        when :basic_present, :basic_durative
          return NA if @verb.match?(OMETV_REGEX)
          result = conj_send(tense)
          if result[0].is_a?(String)
            [result.map {|r| r + S }]
          else
            if @irregular
              case result.size
              when 1
                rr_2plus = result[0].map {|r| "#{r}s (of 2+)"}
                [rr_2plus]
              when 2
                rr2 = result[0].map      {|r| "#{r}s (of 2)" }
                rr3_plus = result[1].map {|r| "#{r}s (of 3+)"}
                [rr2, rr3_plus]
              end
            else
              result.map do |verb_form|
                verb_form.map do |dialectic_option|
                  "#{dialectic_option}s"
                end
              end
            end
          end
        when :tos_auxiliary
          return NA if @verb.match?(OMETV_REGEX)
          result = send(tense)
          if result[0].is_a?(String)
            [result.map {|r| r + SPACE_TOS }]
          else
            if @irregular
              case result.size
              when 1
                rr_2plus = result[0].map {|r| "#{r} tos (of 2+)" }
                [rr_2plus]
              when 2
                rr2 = result[0].map      {|r| "#{r} tos (of 2)" }
                rr3_plus = result[1].map {|r| "#{r} tos (of 3+)"}
                [rr2, rr3_plus]
              end
            else
              result.map do |verb_form|
                verb_form.map do |dialectic_option|
                  "#{dialectic_option} tos"
                end
              end
            end
          end
        when :ometv_conjugated_auxiliary
          return NA if @verb.match?(OMETV_REGEX)
          result = ometv(tense.to_s.split(?_).last)

          # Do we need towakes? Right now believing so (even if the verb is plural already???)
          #result.map! {|r| r.gsub("towakes", "tos") } if @irregular

          verbs_to_conjugate = if self.class.irregulars[@verb] && tense =~ /p\z/
            self.class.irregulars[@verb].values_at(2,3).compact
          else
            @verb
          end
          results = if verbs_to_conjugate.is_a?(String)
            [result.map {|r| verbs_to_conjugate.gsub(ETV_REGEX, E_SPACE) + r  }]
          else
            verbs_to_conjugate.map do |verb_to_conjugate|
              result.map {|r| verb_to_conjugate.gsub(ETV_REGEX, E_SPACE) + r }
            end
          end
          if verbs_to_conjugate == @verb
            return results
          end
          if tense =~ /s\z/
            results
          else
            case results.size
            when 1
              rr_2plus = results[0].map {|r| "#{r} (of 2+)"}
              [rr_2plus]
            when 2
              rr2 = results[0].map      {|r| "#{r} (of 2)" }
              rr3_plus = results[1].map {|r| "#{r} (of 3+)"}
              [rr2, rr3_plus]
            end
          end
        end
      end

      def conjugating_each_dialectic_option(dialectic_person_marker_options)
        dialectic_person_marker_options.map do |person_marker|
          yield(person_marker)
        end
      end

      def conjugate_1ps
        conjugating_each_dialectic_option(self.class.person_markers['1ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
          lgrade_final_vowel!
          add_person_marker!(person_marker)
        end
      end

      def conjugate_2ps
        conjugating_each_dialectic_option(self.class.person_markers['2ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
          lgrade_final_vowel!
          add_person_marker!(person_marker)
        end
      end

      def conjugate_3ps
        conjugating_each_dialectic_option(self.class.person_markers['3ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
          lgrade_final_vowel!
          add_person_marker!(person_marker)
        end
      end

      def conjugate_1pp
        results = []
        if plural_forms = self.class.irregulars[@verb]&.values_at(2,3)&.compact
          plural_forms.each do |verb|
            results << conjugating_each_dialectic_option(self.class.person_markers['1pp']) do |person_marker|
              @verb_to_conjugate = verb.dup
              drop_the_etv!
              lgrade_final_vowel!

              if @type == :tos_auxiliary
                @verb_to_conjugate + 'eyē'
              else
                add_person_marker!(person_marker)
              end

            end
          end
        else
          results << conjugating_each_dialectic_option(self.class.person_markers['1pp']) do |person_marker|
            @verb_to_conjugate = @verb.dup
            drop_the_etv!
            lgrade_final_vowel!
            if @type == :tos_auxiliary
              @verb_to_conjugate + 'eyē'
            else
              add_person_marker!(person_marker)
            end
          end
        end

        results
      end

      def conjugate_2pp
        results = []
        if plural_forms = self.class.irregulars[@verb]&.values_at(2,3)&.compact
          plural_forms.each do |verb|
            results << conjugating_each_dialectic_option(self.class.person_markers['2pp']) do |person_marker|
              @verb_to_conjugate = verb.dup
              drop_the_etv!
              lgrade_final_vowel!
              add_person_marker!(person_marker)
            end
          end
        else
          results << conjugating_each_dialectic_option(self.class.person_markers['2pp']) do |person_marker|
            @verb_to_conjugate = @verb.dup
            drop_the_etv!
            lgrade_final_vowel!
            add_person_marker!(person_marker)
          end
        end

        results
      end

      def conjugate_3pp
        results = []
        if plural_forms = self.class.irregulars[@verb]&.values_at(2,3)&.compact
          plural_forms.each do |verb|
            results << conjugating_each_dialectic_option(self.class.person_markers['3pp']) do |person_marker|
              @verb_to_conjugate = verb.dup
              drop_the_etv!
              lgrade_final_vowel!

              if @type == :tos_auxiliary
                @verb_to_conjugate + 'ē'
              else
                @verb_to_conjugate + 'e'
              end

              # don't need 'ak' in 'akes' because it's already plural
              #add_person_marker!(person_marker)
            end
          end
        else
          results << conjugating_each_dialectic_option(self.class.person_markers['3pp']) do |person_marker|
            @verb_to_conjugate = @verb.dup
            drop_the_etv!
            lgrade_final_vowel!
            add_person_marker!(person_marker)
          end
        end

        results
      end

      def drop_the_etv!
        @verb_to_conjugate.gsub!(ETV_REGEX, EMPTY_STRING)
      end

      def consonants
        @@consonants ||= %w{ c f h k l m n p r s t w }.freeze
      end

      def irregulars
        self.class.irregulars
      end

      def lgrade_final_vowel!
        # vowels: a e ē i o u v
        # for example:
        #  - the final vowel in 'homp' is 'o'
        #  - the final vowel in 'vwelvpec' is 'e'
        final_vowel_index = @verb_to_conjugate.rindex(VOWEL_REGEX)
        return unless final_vowel_index

        ue_rule_substring = @verb_to_conjugate[(final_vowel_index-1)..final_vowel_index]
        # dipthong rule
        return if ue_rule_substring == UE
        # LMN rule: VlC, VmC, or VnC pattern (where V=vowel, C=consonant)
        next_char = @verb_to_conjugate[final_vowel_index + 1]
        next_next_char = @verb_to_conjugate[final_vowel_index + 2]
        return if (next_char == L || next_char == M || next_char == N) &&
                 next_next_char &&
                 consonants.include?(next_next_char)

        # replace the final vowel with the l-graded vowel
        @verb_to_conjugate[final_vowel_index] = LGRADES.fetch(@verb_to_conjugate[final_vowel_index], @verb_to_conjugate[final_vowel_index])
      end

      def add_person_marker!(person_marker)
        if @type == :tos_auxiliary || @type == :basic_durative
          (@verb_to_conjugate + person_marker).gsub(NULL_E_ENDING_REGEX, Ē).gsub(I_ENDING_REGEX, IYĒ)
        else
          @verb_to_conjugate + person_marker
        end
      end

      def ometv(tense)
        Conjugators::Ometv::PresentTense.new(tense).conjugate![tense]
      end
    end
  end
end

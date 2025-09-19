module Conjugators
  module ActionVerbs
    class PastOne
      extend Conjugators::ActionVerbs::Shared

      # Constants for diphthong patterns
      UE_CK_PATTERN = /ue[ck]\z/.freeze  # ue followed by c or k
      UE_OTHER_PATTERN = /ue[^ck]\z/.freeze  # ue followed by other consonants
      VO_PATTERN = /vok\z/.freeze  # vo followed by k

      # SHORTEN, STRESS, ASPIRATE final vowel
      def initialize(verb, irregular_pattern: nil)
        @verb = verb

        @irregular_pattern = irregular_pattern

        raise "Invalid verb. Verb must end with 'etv'." unless @verb.end_with?("etv")

        # verb stem is everything but the ending 'etv'
        @verb_stem = @verb.gsub(/etv\z/, "")
        @irregular = !!irregulars[@verb]
      end

      def conjugate!
        {
          verb: @verb,
          first_person_singular: {
            basic_past_one:              conjugate(tense: :conjugate_1ps, type: :basic_past_one),
          },
          second_person_singular: {
            basic_past_one:              conjugate(tense: :conjugate_2ps, type: :basic_past_one),
          },
          third_person_singular: {
            basic_past_one:              conjugate(tense: :conjugate_3ps, type: :basic_past_one),
          },
          first_person_plural: {
            basic_past_one:              conjugate(tense: :conjugate_1pp, type: :basic_past_one),
          },
          second_person_plural: {
            basic_past_one:              conjugate(tense: :conjugate_2pp, type: :basic_past_one),
          },
          third_person_plural: {
            basic_past_one:              conjugate(tense: :conjugate_3pp, type: :basic_past_one),
          }
        }
      end

      private
      def conjugate(type:, tense:)
        case type
        when :basic_past_one
          result = send(tense)
          if result[0].is_a?(String)
            [result.map {|r| r + ?s }]
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
          hgrade_final_vowel!
          add_person_marker!(person_marker)
        end
      end

      def conjugate_2ps
        conjugating_each_dialectic_option(self.class.person_markers['2ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
          hgrade_final_vowel!
          add_person_marker!(person_marker)
        end
      end

      def conjugate_3ps
        conjugating_each_dialectic_option(self.class.person_markers['3ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
          hgrade_final_vowel!
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
              hgrade_final_vowel!
              add_person_marker!(person_marker)
            end
          end
        else
          results << conjugating_each_dialectic_option(self.class.person_markers['1pp']) do |person_marker|
            @verb_to_conjugate = @verb.dup
            drop_the_etv!
            hgrade_final_vowel!
            add_person_marker!(person_marker)
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
              hgrade_final_vowel!
              add_person_marker!(person_marker)
            end
          end
        else
          results << conjugating_each_dialectic_option(self.class.person_markers['2pp']) do |person_marker|
            @verb_to_conjugate = @verb.dup
            drop_the_etv!
            hgrade_final_vowel!
            add_person_marker!(person_marker)
          end
        end

        results
      end

      # this is the -ake one. have learned that when adding ake
      def conjugate_3pp
        results = []
        if plural_forms = self.class.irregulars[@verb]&.values_at(2,3)&.compact
          plural_forms.each do |verb|
            results << conjugating_each_dialectic_option(self.class.person_markers['3pp']) do |person_marker|
              @verb_to_conjugate = verb.dup
              drop_the_etv!

              if person_marker == 'ake' && identify_hgrade_form(@verb_to_conjugate) == :basic
                @verb_to_conjugate += "ak"
                hgrade_final_vowel!
                @verb_to_conjugate += "e"
              else
                hgrade_final_vowel!
                add_person_marker!(person_marker)
              end
            end
          end
        else
          results << conjugating_each_dialectic_option(self.class.person_markers['3pp']) do |person_marker|
            @verb_to_conjugate = @verb.dup
            drop_the_etv!

            if person_marker == 'ake' && identify_hgrade_form(@verb_to_conjugate) == :basic
              @verb_to_conjugate += "ak"
              hgrade_final_vowel!
              @verb_to_conjugate += "e"
            else
              hgrade_final_vowel!
              add_person_marker!(person_marker)
            end
          end
        end

        results
      end

      def drop_the_etv!
        @verb_to_conjugate.gsub!(/etv\z/, "")
      end

      def irregulars
        self.class.irregulars
      end

      def hgrade_final_vowel!
        hgrade_form = identify_hgrade_form(@verb_to_conjugate)

        case hgrade_form
        when :ue_ck_diphthong
          # -uec- or -uek- h-grades as -uehc- or -uehk-
          if @verb_to_conjugate.end_with?('uec')
            @verb_to_conjugate.sub!(/uec\z/, 'uehc')
          else
            @verb_to_conjugate.sub!(/uek\z/, 'uehk')
          end
        when :ue_other_diphthong
          # -ue[^ck]- h-grades by changing 'ue' to 'uyi'
          last_consonant = @verb_to_conjugate[-1]
          @verb_to_conjugate.sub!(/ue[^ck]\z/, "uyi#{last_consonant}")
        when :vo_diphthong
          # -vok- h-grades as -vwik-
          @verb_to_conjugate.sub!(/vok\z/, 'vwik')
        when :basic
          final_vowel_index = @verb_to_conjugate.rindex(/[aeēiov]/)
          final_vowel = @verb_to_conjugate[final_vowel_index]
          h_graded_final_vowel = self.class.basic_hgrades[final_vowel]
          @verb_to_conjugate[final_vowel_index] = h_graded_final_vowel
        when :double_consonant
          @verb_to_conjugate[-1] = 'iy' #e.g. kerr -> keriy
        when :kk_or_consonant_cluster
          @verb_to_conjugate[-1] = "i#{@verb_to_conjugate[-1]}" #e.g. homp -> homip
        end

        @verb_to_conjugate
      end

      def identify_hgrade_form(verb)
        # First check for diphthong patterns
        return :ue_ck_diphthong if verb.match?(UE_CK_PATTERN)
        return :ue_other_diphthong if verb.match?(UE_OTHER_PATTERN)
        return :vo_diphthong if verb.match?(VO_PATTERN)

        final_vowel_index = verb.rindex(/[aeēiouv]/)

        # what is to the right of that final vowel
        to_the_right = verb[final_vowel_index + 1..-1]

        alphabet   = %w{ a c e ē f h i k l m n o p r s t u v w y }
        vowels     = %w{ a e ē i o u v }
        consonants = alphabet - vowels

        # we have a few cases of concern for `to_the_right`
        # 1. Consonant Cluster: 'kk' or two consonants that aren't the same (e.g. 'tk', 'mp', etc.)
        # 2. Double Consonant, not KK: repeated consonants, except 'kk' (e.g. 'pp', 'tt', 'ff', etc.)
        # 3. Basic: everything else
        double_consonant  = to_the_right.match?(/\A(?!kk)(\w)\1\z/)
        kk                = to_the_right.match?(/\Akk\z/)
        consonant_cluster = to_the_right.match?(/\A(#{consonants.join('|')}){2,}\z/)
        basic             = !double_consonant && !kk && !consonant_cluster

        return form = :double_consonant        if double_consonant
        return form = :kk_or_consonant_cluster if kk || consonant_cluster
        return form = :basic                   if basic

        raise "Unrecognized verb form"
      end

      def self.basic_hgrades
        {
          'a' => 'vh',
          'e' => 'eh',
          'ē' => 'eh',
          'i' => 'ih',
          'o' => 'oh',
          'u' => 'uh',
          'v' => 'vh',
        }
      end

      def add_person_marker!(person_marker)
        @verb_to_conjugate += person_marker
      end
    end
  end
end

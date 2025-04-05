module Conjugators
  module ActionVerbs
    class PastThree
      extend Conjugators::ActionVerbs::Shared
      # Note, MVSKOKE language here
      def initialize(verb)
        @verb = verb

        raise "Invalid verb. Verb must end with 'etv'." unless @verb.end_with?("etv")

        @irregular = !!irregulars[@verb]
      end

      def conjugate!
        {
          verb: @verb,
          first_person_singular: {
            basic:                      conjugate(tense: :conjugate_1ps, type: :basic),
            tos_auxiliary:              conjugate(tense: :conjugate_1ps, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_1ps, type: :ometv_conjugated_auxiliary)
          },
          second_person_singular: {
            basic:                      conjugate(tense: :conjugate_2ps, type: :basic),
            tos_auxiliary:              conjugate(tense: :conjugate_2ps, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_2ps, type: :ometv_conjugated_auxiliary)
          },
          third_person_singular: {
            basic:                      conjugate(tense: :conjugate_3ps, type: :basic),
            tos_auxiliary:              conjugate(tense: :conjugate_3ps, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_3ps, type: :ometv_conjugated_auxiliary)
          },
          first_person_plural: {
            basic:                      conjugate(tense: :conjugate_1pp, type: :basic),
            tos_auxiliary:              conjugate(tense: :conjugate_1pp, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_1pp, type: :ometv_conjugated_auxiliary)
          },
          second_person_plural: {
            basic:                      conjugate(tense: :conjugate_2pp, type: :basic),
            tos_auxiliary:              conjugate(tense: :conjugate_2pp, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_2pp, type: :ometv_conjugated_auxiliary)
          },
          third_person_plural: {
            basic:                      conjugate(tense: :conjugate_3pp, type: :basic),
            tos_auxiliary:              conjugate(tense: :conjugate_3pp, type: :tos_auxiliary),
            ometv_conjugated_auxiliary: conjugate(tense: :conjugate_3pp, type: :ometv_conjugated_auxiliary)
          }
        }
      end

      private
      def conjugate(type:, tense:)
        @type = type
        case type
        when :basic
          result = send(tense)
          if result[0].is_a?(String)
            [result.map {|r| r + ?s     }]
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
          return "N/A" if @verb == "ometv" || @verb == "owetv"
          result = send(tense)
          if result[0].is_a?(String)
            [result.map {|r| r + " towemvts" }]
          else
            if @irregular
              case result.size
              when 1
                rr_2plus = result[0].map {|r| "#{r} towemvts (of 2+)" }
                [rr_2plus]
              when 2
                rr2 = result[0].map      {|r| "#{r} towemvts (of 2)" }
                rr3_plus = result[1].map {|r| "#{r} towemvts (of 3+)"}
                [rr2, rr3_plus]
              end
            else
              result.map do |verb_form|
                verb_form.map do |dialectic_option|
                  "#{dialectic_option} towemvts"
                end
              end
            end
          end
        when :ometv_conjugated_auxiliary
          return "N/A" if @verb == "ometv" || @verb == "owetv"
          result = ometv(tense.to_s.split(?_).last)

          # Do we need towakes? Right now believing so (even if the verb is plural already???)
          #result.map! {|r| r.gsub("towakes", "tos") } if @irregular

          verbs_to_conjugate = if self.class.irregulars[@verb] && tense =~ /p\z/
            self.class.irregulars[@verb].values_at(2,3).compact
          else
            @verb
          end
          results = if verbs_to_conjugate.is_a?(String)
            [result.map {|r| verbs_to_conjugate.gsub(/etv\z/, 'e ') + r  }]
          else
            verbs_to_conjugate.map do |verb_to_conjugate|
              result.map {|r| verb_to_conjugate.gsub(/etv\z/, 'e ') + r }
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
        conjugating_each_dialectic_option(person_markers['1ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
          add_person_marker!(person_marker)
        end
      end

      def conjugate_2ps
        conjugating_each_dialectic_option(person_markers['2ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
          add_person_marker!(person_marker)
        end
      end

      def conjugate_3ps
        conjugating_each_dialectic_option(person_markers['3ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
          add_person_marker!(person_marker)
        end
      end

      def conjugate_1pp
        results = []
        if plural_forms = self.class.irregulars[@verb]&.values_at(2,3)&.compact
          plural_forms.each do |verb|
            results << conjugating_each_dialectic_option(person_markers['1pp']) do |person_marker|
              @verb_to_conjugate = verb.dup
              drop_the_etv!

              if @type == :tos_auxiliary
                @verb_to_conjugate + 'eyē'
              else
                add_person_marker!(person_marker)
              end

            end
          end
        else
          results << conjugating_each_dialectic_option(person_markers['1pp']) do |person_marker|
            @verb_to_conjugate = @verb.dup
            drop_the_etv!
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
            results << conjugating_each_dialectic_option(person_markers['2pp']) do |person_marker|
              @verb_to_conjugate = verb.dup
              drop_the_etv!
              add_person_marker!(person_marker)
            end
          end
        else
          results << conjugating_each_dialectic_option(person_markers['2pp']) do |person_marker|
            @verb_to_conjugate = @verb.dup
            drop_the_etv!
            add_person_marker!(person_marker)
          end
        end

        results
      end

      def conjugate_3pp
        results = []
        if plural_forms = self.class.irregulars[@verb]&.values_at(2,3)&.compact
          plural_forms.each do |verb|
            results << conjugating_each_dialectic_option(person_markers['3pp']) do |person_marker|
              @verb_to_conjugate = verb.dup
              drop_the_etv!

              if @type == :tos_auxiliary
                @verb_to_conjugate + 'ē'
              else
                @verb_to_conjugate + 'vnk'
              end

              # don't need 'ak' in 'akes' because it's already plural
            end
          end
        else
          results << conjugating_each_dialectic_option(person_markers['3pp']) do |person_marker|
            @verb_to_conjugate = @verb.dup
            drop_the_etv!
            add_person_marker!(person_marker)
          end
        end

        results
      end

      def drop_the_etv!
        @verb_to_conjugate.gsub!(/etv\z/, "")
      end

      def consonants
        %w{ c f h k l m n p r s t w }
      end

      def irregulars
        self.class.irregulars
      end

      def add_person_marker!(person_marker)
        if @type == :tos_auxiliary
          (@verb_to_conjugate + person_marker).gsub(/e$/, 'ē').gsub(/i$/, "iyē")
        else
          @verb_to_conjugate + person_marker
        end
      end

      def ometv(tense)
        Conjugators::Ometv::PastThree.new(tense).conjugate![tense]
      end

      def self.past_two_person_markers
        {
          '1ps' => %w{   imvt   },
          '2ps' => %w{ etskemvt eckemvt eccemvt etcemvt },
          '3ps' => %w{   emvt   },  # (e)
          '1pp' => %w{  ēyemvt  },
          '2pp' => %w{ atskemvt ackemvt },
          '3pp' => %w{  akemvt  },  # ak(e) *
        }
      end

      def person_markers
        if @type == :basic
          self.class.past_two_person_markers
        else
          self.class.person_markers
        end
      end

    end
  end
end

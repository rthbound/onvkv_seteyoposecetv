module Conjugators
  module ActionVerbs
    class FutureTense
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
            basic:              conjugate(tense: :conjugate_1ps, type: :basic_present),
          },
          second_person_singular: {
            basic:              conjugate(tense: :conjugate_2ps, type: :basic_present),
          },
          third_person_singular: {
            basic:              conjugate(tense: :conjugate_3ps, type: :basic_present),
          },
          first_person_plural: {
            basic:              conjugate(tense: :conjugate_1pp, type: :basic_present),
          },
          second_person_plural: {
            basic:              conjugate(tense: :conjugate_2pp, type: :basic_present),
          },
          third_person_plural: {
            basic:              conjugate(tense: :conjugate_3pp, type: :basic_present),
          }
        }
      end

      private
      def conjugate(type:, tense:)
        @type = type
        case type
        when :basic_present
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
          add_person_marker!(person_marker)
        end
      end

      def conjugate_2ps
        conjugating_each_dialectic_option(self.class.person_markers['2ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
          add_person_marker!(person_marker)
        end
      end

      def conjugate_3ps
        conjugating_each_dialectic_option(self.class.person_markers['3ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
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

              add_person_marker!(person_marker)
            end
          end
        else
          results << conjugating_each_dialectic_option(self.class.person_markers['1pp']) do |person_marker|
            @verb_to_conjugate = @verb.dup
            drop_the_etv!
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
              add_person_marker!(person_marker)
            end
          end
        else
          results << conjugating_each_dialectic_option(self.class.person_markers['2pp']) do |person_marker|
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
            results << conjugating_each_dialectic_option(self.class.person_markers['3pp']) do |person_marker|
              @verb_to_conjugate = verb.dup
              drop_the_etv!

              # (probably) don't need 'ak' in 'akes' because it's already plural
              #add_person_marker!(person_marker)

              # instead
              @verb_to_conjugate + "vrē"
            end
          end
        else
          results << conjugating_each_dialectic_option(self.class.person_markers['3pp']) do |person_marker|
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

      def irregulars
        self.class.irregulars
      end

      def add_person_marker!(person_marker)
        @verb_to_conjugate + person_marker
      end

      def self.person_markers
        {
          '1ps' => %w{     arē     },
          '2ps' => %w{   etskvrē   },
          '3ps' => %w{     vrē     },
          '1pp' => %w{    ēyvrē    },
          '2pp' => %w{   atskvrē   },
          '3pp' => %w{    vkvrē    },
        }
      end
    end
  end
end

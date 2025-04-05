module Conjugators
  module ActionVerbs
    class ImperativeMood
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
          second_person_singular: {
            basic:              conjugate(tense: :conjugate_2ps, type: :basic),
            polite:             conjugate(tense: :conjugate_2ps, type: :polite),
            do_not:             conjugate(tense: :conjugate_2ps, type: :do_not),
          },
          second_person_plural: {
            basic:              conjugate(tense: :conjugate_2pp, type: :basic),
            polite:             conjugate(tense: :conjugate_2pp, type: :polite),
            do_not:             conjugate(tense: :conjugate_2pp, type: :do_not),
            lets:               conjugate(tense: :conjugate_2pp, type: :lets),
          },
        }
      end

      private
      def conjugate(type:, tense:)
        @type = type
        case type
        when :do_not
          result = send(tense, type)
          if result[0].is_a?(String)
            [result]
          else
            if @irregular
              case result.size
              when 1
                rr_2plus = result[0].map {|r| "#{r} (of 2+)"}
                [rr_2plus]
              when 2
                rr2 = result[0].map      {|r| "#{r} (of 2)" }
                rr3_plus = result[1].map {|r| "#{r} (of 3+)"}
                [rr2, rr3_plus]
              end
            else
              result.map do |verb_form|
                verb_form.map do |dialectic_option|
                  "#{dialectic_option}"
                end
              end
            end
          end
        when :basic, :polite, :lets
          result = send(tense, type)
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

      def conjugate_2ps(type)
        conjugating_each_dialectic_option(self.class.person_markers[type]['2ps']) do |person_marker|
          @verb_to_conjugate = @verb.dup
          drop_the_etv!
          add_person_marker!(person_marker)
        end
      end

      def conjugate_2pp(type)
        results = []
        if plural_forms = self.class.irregulars[@verb]&.values_at(2,3)&.compact
          raise unless @irregular
          plural_forms.each do |verb|
            results << conjugating_each_dialectic_option(self.class.person_markers[type]['2pp']) do |person_marker|
              @verb_to_conjugate = verb.dup
              drop_the_etv!
              add_person_marker!(person_marker)
            end
          end
        else
          results << conjugating_each_dialectic_option(self.class.person_markers[type]['2pp']) do |person_marker|
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
          basic: {
            '2ps' => %w{ v  },
            '2pp' => %w{ vk },
          },
          polite: {
            '2ps' => %w{ epv },
            '2pp' => %w{ epv },
          },
          do_not: {
            '2ps' => %w{ ekot },
            '2pp' => %w{ ekot },
          },
          lets: {
            '2pp' => %w{ vkēt },
          },
        }
      end
    end
  end
end

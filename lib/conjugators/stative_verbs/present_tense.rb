module Conjugators
  module StativeVerbs
    class PresentTense
      # Note, MVSKOKE language here
      def initialize(verb)
        @verb = verb
        raise "Invalid verb" unless @verb.end_with?("ē") || @verb.end_with?("e")
        @verb = @verb.gsub(/e$/, "ē")
      end

      def self.irregulars
        {
          "cutkē"     => "lopockē",
          "cvfeknē"   => "cvfencvkē",
          "cvmpē"     => "cvmcvpē",
          "cvpakkē"   => "cvpakhokē",
          "cvpkē"     => "cvpcvkē",
          "elē"       => "pvsvtkē",
          "enokkē"    => "enokhokē",
          "fvckē"     => "fvcfvkē",
          "fvmpē"     => "fvmfvpē",
          "fvskē"     => "fvsfvkē",
          "hesakē"    => "hesahokē",
          "hiyē"      => "hihoyē",
          "hvsvtkē"   => "hvsvthvkē",
          "kocoknē"   => "koconcokē",
          "kvlkē"     => "kvlkvkē",
          "kvlaksē"   => "kvlvskvkē",
          "kvrpē"     => "kvrkvpē",
          "kvsvppē"   => "kvsvphoyē",
          "leskē"     => "leslekē",
          "lekvcwē"   => "lekvclewē",
          "lowakē"    => "lowalokē",
          "lowvckē"   => "lowvclokē",
          "lvpotkē"   => "lvpotlvkē",
          "lvokē"     => "lvolvkē",
          "lvstē"     => "lvslvtē",
          "mahē"      => "mahmvyē",
          "mocvsē"    => "mocvsvkē",
          "ohcakhē"   => "ohcakcvhē",
          "ohrvnkē"   => "ohrvnrvkē",
          "pakkē"     => "pakpvkē",
          "polokē"    => "polopokē",
          "pvfnē"     => "pvfpvnē",
          "rakkē"     => "rakrvkē",
          "sofkē"     => "sofsokē",
          "sopakhvtkē" => "sopakhvthvkē",
          "tefnē"     => "teftenē",
          "tvkvcwē"   => "tvkvctvwē",
          "vholwvkē"  => "vholwahokē",
          "akhotkē"   => "akhothokē",
          "vcakhē"    => "vcakcvhē",
          "ak-vcakhē" => "ak-vcakcvhē",
          "cakhē"     => "cakcvhē",
          "cekfē"     => "cekcefē",
          "cekhē"     => "cekaknē", # also cekhvkē
          "cetakkē"   => "cetakcekē",
          "cufoknē"   => "cufoncokē",
          "cvlaknē"   => "cvlvncvkē",
          "cvneksē"   => "cvnescvkē",
          "etepvllvkē" => "etepvllapvkē",
          "tekenkē"    => "tekentekē",
          "tvnkē"      => "tvntvkē",
          "tvpeksē"    => "tvpestvkē",
          "tvphē"      => "tvptvhē",
          "vcakē"      => "vcacvkē",
          "vcvnkē"     => "vcvncvkē",
          "vfvleknē"   => "vfvlenfvkē",
          "vhorkē"     => "vhorhokē",
          "vpvtvptvkē" => "vpvtvtapvkē",
          "wvnhē"      => "wvnwvhē",
          "wvpaksē"    => "wvpvswvkē",
          "yakpē"      => "yakyvpē",

        }
      end

      def conjugate!
        {
          verb: @verb,
          first_person_singular: {
            basic_present: conjugate(tense: :conjugate_1ps, type: :basic_present),
            tos_auxiliary: conjugate(tense: :conjugate_1ps, type: :tos_auxiliary)
          },
          second_person_singular: {
            basic_present: conjugate(tense: :conjugate_2ps, type: :basic_present),
            tos_auxiliary: conjugate(tense: :conjugate_2ps, type: :tos_auxiliary)
          },
          third_person_singular: {
            basic_present: conjugate(tense: :conjugate_3ps, type: :basic_present),
            tos_auxiliary: conjugate(tense: :conjugate_3ps, type: :tos_auxiliary)
          },
          first_person_plural: {
            basic_present: conjugate(tense: :conjugate_1pp, type: :basic_present),
            tos_auxiliary: conjugate(tense: :conjugate_1pp, type: :tos_auxiliary)
          },
          second_person_plural: {
            basic_present: conjugate(tense: :conjugate_2pp, type: :basic_present),
            tos_auxiliary: conjugate(tense: :conjugate_2pp, type: :tos_auxiliary)
          },
          third_person_plural: {
            basic_present: conjugate(tense: :conjugate_3pp, type: :basic_present),
            tos_auxiliary: conjugate(tense: :conjugate_3pp, type: :tos_auxiliary)
          }
        }
      end

      private
      def conjugate(type:, tense:)
        case type
        when :basic_present
          send(tense) + ?s
        when :tos_auxiliary
          [send(tense), "tos"].join(" ")
        end
      end

      def conjugate_1ps
        case @verb[0]
        when "a", "ē"
          "vca" + @verb[1..-1]
        when "v"
          "vcv" + @verb[1..-1]
        when "o"
          "vc"  + @verb
        when "e"
          "cv" + @verb[1..-1]
        else
          "cv" + @verb
        end
      end

      def conjugate_2ps
        case @verb[0]
        when "a"
          "ecē" + @verb[1..-1]
        when"ē"
          "ecē" + @verb[1..-1]
        when "v"
          "ece" + @verb
        when "o"
          "ec"  + @verb
        when "e"
          "ce" + @verb[1..-1]
        else
          "ce" + @verb
        end
      end

      def conjugate_3ps
        @verb
      end

      def conjugate_1pp
        verb = @verb
        verb = irregulars.fetch(@verb, @verb)

        case verb[0]
        when "a"
          "epo" + verb[1..-1]
        when"ē"
          "epo" + verb[1..-1]
        when "v"
          "epo" + verb[1..-1]
        when "o"
          "ep"  + verb
        when "e"
          "pu" +  verb[1..-1]
        else
          "pu" +  verb
        end
      end

      def conjugate_2pp
        verb = irregulars.fetch(@verb, @verb)

        simple_case = case verb[0]
        when "a"
          "ecē" + verb[1..-1]
        when"ē"
          "ecē" + verb[1..-1]
        when "v"
          "ece" + verb
        when "o"
          "ec"  + verb
        when "e"
          "ce" + verb[1..-1]
        else
          "ce" + verb
        end

        if verb == @verb
          simple_case.gsub(/ē$/, "vkē")
        else
          simple_case
        end
      end

      def conjugate_3pp
        if irregulars[@verb]
          irregulars[@verb]
        else
          @verb.gsub(/ē$/, "vkē")
        end
      end

      def irregulars
        self.class.irregulars
      end
    end
  end
end

# test/unit/conjugators/action_verbs/present_test.rb
    class PresentTest < ::Minitest::Test
      def dig(result, tense:, type:)
        result.dig(tense, type)
      end

      def test_opvnetv
        @subject = 'pvnetv'

        result = conjugate_subject

        assert_equal ["panis"         ], dig(result, tense: :first_person_singular,  type: :basic_present)[0]
        assert_equal ["panetskes", "paneckes", "panecces", "panetces", "panetses"], dig(result, tense: :second_person_singular, type: :basic_present)[0]
        assert_equal ["panes"         ], dig(result, tense: :third_person_singular,  type: :basic_present)[0]
        assert_equal ["panēs"         ], dig(result, tense: :first_person_plural,    type: :basic_present)[0]
        assert_equal ["panatskes", "panackes", "panatses"], dig(result, tense: :second_person_plural,   type: :basic_present)[0]
        assert_equal ["panakes"       ], dig(result, tense: :third_person_plural,    type: :basic_present)[0]

        assert_equal ["paniyēt os"    ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["panetskēt os", "paneckēt os", "paneccēt os", "panetcēt os", "panetsēt os"], dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["panēt os"      ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["paneyēt os"    ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["panatskēt os", "panackēt os", "panatsēt os"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["panakēt os"    ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["pvnet owis"    ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvnet owetskes", "pvnet oweckes", "pvnet owecces", "pvnet ontces", "pvnet onckes", "pvnet ontses"],
          dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvnet os"      ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvnet owēs"    ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvnet owatskes", "pvnet owackes", "pvnet owatses"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvnet owakes"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
      end

      def test_hayetv
        @subject = 'hayetv'

        result = conjugate_subject

        assert_equal ["hayis"         ], dig(result, tense: :first_person_singular,  type: :basic_present)[0]
        assert_equal ["hayetskes", "hayeckes", "hayecces", "hayetces", "hayetses"], dig(result, tense: :second_person_singular, type: :basic_present)[0]
        assert_equal ["hayes"         ], dig(result, tense: :third_person_singular,  type: :basic_present)[0]
        assert_equal ["hayēs"         ], dig(result, tense: :first_person_plural,    type: :basic_present)[0]
        assert_equal ["hayatskes", "hayackes", "hayatses"], dig(result, tense: :second_person_plural,   type: :basic_present)[0]
        assert_equal ["hayakes"       ], dig(result, tense: :third_person_plural,    type: :basic_present)[0]

        assert_equal ["hayiyēt os"    ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hayetskēt os", "hayeckēt os", "hayeccēt os", "hayetcēt os", "hayetsēt os"], dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["hayēt os"      ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hayeyēt os"    ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["hayatskēt os", "hayackēt os", "hayatsēt os"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["hayakēt os"    ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["hayet owis"    ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hayet owetskes", "hayet oweckes", "hayet owecces", "hayet ontces", "hayet onckes", "hayet ontses"],
          dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hayet os"      ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hayet owēs"    ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hayet owatskes", "hayet owackes", "hayet owatses"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hayet owakes"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
      end

      def test_hueretv
        @subject = 'hueretv'

        result = conjugate_subject

        assert_equal ["hueris"              ], dig(result, tense: :first_person_singular,  type: :basic_present)[0]
        assert_equal ["hueretskes", "huereckes", "huerecces", "hueretces", "hueretses"], dig(result, tense: :second_person_singular, type: :basic_present)[0]
        assert_equal ["hueres"              ], dig(result, tense: :third_person_singular,  type: :basic_present)[0]
        assert_equal ["sehokēs (of 2)"      ], dig(result, tense: :first_person_plural,    type: :basic_present)[0]
        assert_equal ["sehokatskes (of 2)", "sehokackes (of 2)", "sehokatses (of 2)"], dig(result, tense: :second_person_plural,   type: :basic_present)[0]
        assert_equal ["sehokes (of 2)"      ], dig(result, tense: :third_person_plural,    type: :basic_present)[0]
        assert_equal ["svpaklēs (of 3+)"    ], dig(result, tense: :first_person_plural,   type: :basic_present)[1]
        assert_equal ["svpaklatskes (of 3+)", "svpaklackes (of 3+)", "svpaklatses (of 3+)"], dig(result, tense: :second_person_plural,  type: :basic_present)[1]
        assert_equal ["svpakles (of 3+)"    ], dig(result, tense: :third_person_plural,   type: :basic_present)[1]

        # Adjectival because I be doing this
        #   that 'ē' is not an l-grade but an adjectival 'ē' in these examples
        assert_equal ["hueriyēt os"            ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hueretskēt os", "huereckēt os", "huereccēt os", "hueretcēt os", "hueretsēt os"],
          dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["huerēt os"              ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["sehokeyēt os (of 2)"    ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["sehokatskēt os (of 2)", "sehokackēt os (of 2)", "sehokatsēt os (of 2)"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["sehokēt os (of 2)"      ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["svpakleyēt os (of 3+)"  ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[1]
        assert_equal ["svpaklatskēt os (of 3+)", "svpaklackēt os (of 3+)", "svpaklatsēt os (of 3+)"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[1]
        assert_equal ["svpaklēt os (of 3+)"    ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[1]

        assert_equal ["hueret owis"              ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hueret owetskes", "hueret oweckes", "hueret owecces", "hueret ontces", "hueret onckes", "hueret ontses"],
          dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hueret os"                ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoket owēs (of 2)"      ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoket owatskes (of 2)", "sehoket owackes (of 2)", "sehoket owatses (of 2)"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoket owakes (of 2)"    ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["svpaklet owēs (of 3+)"    ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[1]
        assert_equal ["svpaklet owatskes (of 3+)", "svpaklet owackes (of 3+)", "svpaklet owatses (of 3+)"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[1]
        assert_equal ["svpaklet owakes (of 3+)"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[1]
      end

      def test_feketv
        @subject = 'feketv'

        result = conjugate_subject

        assert_equal ["fēkis"],     dig(result, tense: :first_person_singular,  type: :basic_present)[0]
        assert_equal ["fēketskes", "fēkeckes", "fēkecces", "fēketces", "fēketses"], dig(result, tense: :second_person_singular, type: :basic_present)[0]
        assert_equal ["fēkes"],     dig(result, tense: :third_person_singular,  type: :basic_present)[0]
        assert_equal ["fēkēs"],     dig(result, tense: :first_person_plural,    type: :basic_present)[0]
        assert_equal ["fēkatskes", "fēkackes", "fēkatses"], dig(result, tense: :second_person_plural,   type: :basic_present)[0]
        assert_equal ["fēkakes"],   dig(result, tense: :third_person_plural,    type: :basic_present)[0]

        assert_equal ["fēkiyēt os"],   dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["fēketskēt os", "fēkeckēt os", "fēkeccēt os", "fēketcēt os", "fēketsēt os"],
          dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["fēkēt os"],     dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["fēkeyēt os"],   dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["fēkatskēt os", "fēkackēt os", "fēkatsēt os"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["fēkakēt os"],   dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["feket owis"],     dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feket owetskes", "feket oweckes", "feket owecces", "feket ontces", "feket onckes", "feket ontses"],
          dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feket os"],       dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feket owēs"],     dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feket owatskes", "feket owackes", "feket owatses"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feket owakes"],   dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
      end

      def test_esketv
        @subject = 'esketv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic_present)

        assert_equal "ēskakes", third_person_plural[0][0]

        third_person_singular = result.dig(:third_person_singular, :basic_present)

        assert_equal "ēskes", third_person_singular[0][0]
      end

      def test_letketv
        @subject = 'letketv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_present)

        assert_equal "lētkis", first_person_singular[0][0]
      end

      def test_hompetv
        @subject = 'hompetv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic_present)

        assert_equal "hompakes", third_person_plural[0][0]
      end

      def test_fekhonnetv
        @subject = 'fekhonnetv'

        result = conjugate_subject

        second_person_singular = result.dig(:second_person_singular, :basic_present)

        assert_equal ["fekhonnetskes", "fekhonneckes", "fekhonnecces", "fekhonnetces", "fekhonnetses"], second_person_singular[0]
      end

      def test_kerretv
        @subject = 'kerretv'

        result = conjugate_subject

        third_person_singular = result.dig(:third_person_singular, :basic_present)

        assert_equal "kērres", third_person_singular[0][0]
      end

      def test_akhottetv
        @subject = 'akhottetv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_present)

        assert_equal "akhottis", first_person_singular[0][0]
      end

      def test_noricetv
        @subject = 'noricetv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_present)

        assert_equal "noricis", first_person_singular[0][0]
      end

      def test_vyetv
        @subject = 'vyetv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_present)
        third_person_singular = result.dig(:third_person_singular, :basic_present)

        assert_equal "ayes", third_person_singular[0][0]
        assert_equal "ayis", first_person_singular[0][0]
      end

      def test_aliketv
        @subject = 'aliketv'

        result = conjugate_subject

        second_person_singular = result.dig(:second_person_singular, :basic_present)

        assert_equal ["aliketskes", "alikeckes", "alikecces", "aliketces", "aliketses"], second_person_singular[0]
      end

      # 1st plural
      def test_nesetv
        @subject = 'nesetv'

        result = conjugate_subject

        first_person_plural = result.dig(:first_person_plural, :basic_present)

        assert_equal "nēsēs", first_person_plural[0][0]

        third_person_singular = result.dig(:third_person_singular, :basic_present)

        assert_equal "nēses", third_person_singular[0][0]
      end


      # 1st plural
      def test_yvkvpetv
        @subject = 'yvkvpetv'

        result = conjugate_subject

        first_person_plural = result.dig(:first_person_plural, :basic_present)

        assert_equal "yvkvphokēs (of 2)", first_person_plural[0][0]

        assert_equal "yvkvpakēs (of 3+)", first_person_plural[1][0]
      end

      # 3rd plural
      def test_oh_onvyetv
        @subject = 'ohhonvyetv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic_present)

        assert_equal "ohhonayakes", third_person_plural[0][0]
      end

      # 'fayetv' 2nd person singular
      def test_fayetv
        @subject = 'fayetv'

        result = conjugate_subject

        second_person_singular = result.dig(:second_person_singular, :basic_present)

        assert_equal ["fayetskes", "fayeckes", "fayecces", "fayetces", "fayetses"], second_person_singular[0]
      end

      # 'wakketv' 1st person singular
      def test_wakketv
        @subject = 'wakketv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_present)

        assert_equal "wakkis", first_person_singular[0][0]
      end

      def test_wanayetv
        @subject = 'wanayetv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic_present)

        assert_equal 'wanayakes', third_person_plural[0][0]
      end

      def test_tvmketv
        @subject = 'tvmketv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_present)
        second_person_singular = result.dig(:second_person_singular, :basic_present)
        third_person_singular = result.dig(:third_person_singular, :basic_present)
        #first_person_plural = result.dig(:first_person_plural, :basic_present)
        #second_person_plural = result.dig(:second_person_plural, :basic_present)
        #third_person_plural = result.dig(:third_person_plural, :basic_present)

        assert_equal "tvmkis", first_person_singular[0][0]
        assert_equal "tvmketskes", second_person_singular[0][0]
        assert_equal "tvmkes", third_person_singular[0][0]
      end

      def conjugate_subject
        Conjugators::ActionVerbs::PresentTense.new(@subject).conjugate!
      end
    end

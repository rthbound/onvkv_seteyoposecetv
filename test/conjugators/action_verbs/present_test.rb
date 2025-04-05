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

        assert_equal ["paniyē tos"    ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["panetskē tos", "paneckē tos", "paneccē tos", "panetcē tos", "panetsē tos"], dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["panē tos"      ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["paneyē tos"    ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["panatskē tos", "panackē tos", "panatsē tos"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["panakē tos"    ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["pvne towis"    ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvne towetskes", "pvne toweckes", "pvne towecces", "pvne tontces", "pvne tonckes", "pvne tontses"],
          dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvne tos"      ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvne towēs"    ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvne towatskes", "pvne towackes", "pvne towatses"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvne towakes"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
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

        assert_equal ["hayiyē tos"    ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hayetskē tos", "hayeckē tos", "hayeccē tos", "hayetcē tos", "hayetsē tos"], dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["hayē tos"      ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hayeyē tos"    ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["hayatskē tos", "hayackē tos", "hayatsē tos"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["hayakē tos"    ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["haye towis"    ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["haye towetskes", "haye toweckes", "haye towecces", "haye tontces", "haye tonckes", "haye tontses"],
          dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["haye tos"      ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["haye towēs"    ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["haye towatskes", "haye towackes", "haye towatses"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["haye towakes"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
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
        assert_equal ["hueriyē tos"            ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hueretskē tos", "huereckē tos", "huereccē tos", "hueretcē tos", "hueretsē tos"],
          dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["huerē tos"              ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["sehokeyē tos (of 2)"    ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["sehokatskē tos (of 2)", "sehokackē tos (of 2)", "sehokatsē tos (of 2)"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["sehokē tos (of 2)"      ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["svpakleyē tos (of 3+)"  ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[1]
        assert_equal ["svpaklatskē tos (of 3+)", "svpaklackē tos (of 3+)", "svpaklatsē tos (of 3+)"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[1]
        assert_equal ["svpaklē tos (of 3+)"    ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[1]

        assert_equal ["huere towis"              ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["huere towetskes", "huere toweckes", "huere towecces", "huere tontces", "huere tonckes", "huere tontses"],
          dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["huere tos"                ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoke towēs (of 2)"      ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoke towatskes (of 2)", "sehoke towackes (of 2)", "sehoke towatses (of 2)"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoke towakes (of 2)"    ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["svpakle towēs (of 3+)"    ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[1]
        assert_equal ["svpakle towatskes (of 3+)", "svpakle towackes (of 3+)", "svpakle towatses (of 3+)"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[1]
        assert_equal ["svpakle towakes (of 3+)"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[1]
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

        assert_equal ["fēkiyē tos"],   dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["fēketskē tos", "fēkeckē tos", "fēkeccē tos", "fēketcē tos", "fēketsē tos"],
          dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["fēkē tos"],     dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["fēkeyē tos"],   dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["fēkatskē tos", "fēkackē tos", "fēkatsē tos"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["fēkakē tos"],   dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["feke towis"],     dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feke towetskes", "feke toweckes", "feke towecces", "feke tontces", "feke tonckes", "feke tontses"],
          dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feke tos"],       dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feke towēs"],     dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feke towatskes", "feke towackes", "feke towatses"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feke towakes"],   dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
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

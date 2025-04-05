require 'pry'

    class PastTwoTest < ::Minitest::Test
      def dig(result, tense:, type:)
        result.dig(tense, type)
      end

      def test_opvnetv
        @subject = 'pvnetv'

        result = conjugate_subject

        assert_equal ["pvnivnks"        ], dig(result, tense: :first_person_singular,  type: :basic)[0]
        assert_equal ["pvnetskvnks", "pvneckvnks", "pvneccvnks", "pvnetcvnks"], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["pvnvnks"         ], dig(result, tense: :third_person_singular,  type: :basic)[0]
        assert_equal ["pvnēyvnks"       ], dig(result, tense: :first_person_plural,    type: :basic)[0]
        assert_equal ["pvnatskvnks", "pvnackvnks"], dig(result, tense: :second_person_plural,   type: :basic)[0]
        assert_equal ["pvnakvnks"       ], dig(result, tense: :third_person_plural,    type: :basic)[0]

        assert_equal ["pvniyē towvnks"  ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["pvnetskē towvnks", "pvneckē towvnks", "pvneccē towvnks", "pvnetcē towvnks", "pvnetsē towvnks"],
          dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["pvnē towvnks"    ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["pvneyē towvnks"  ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["pvnatskē towvnks", "pvnackē towvnks", "pvnatsē towvnks"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["pvnakē towvnks"  ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["pvne towivnks"   ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvne towetskvnks", "pvne toweckvnks", "pvne toweccvnks", "pvne towetcvnks"], dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvne towvnks"    ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvne towēyvnks"  ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvne towatskvnks", "pvne towackvnks"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvne towakvnks"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
      end

      def test_hayetv
        @subject = 'hayetv'

        result = conjugate_subject

        assert_equal ["hayivnks"         ], dig(result, tense: :first_person_singular,  type: :basic)[0]
        assert_equal ["hayetskvnks", "hayeckvnks", "hayeccvnks", "hayetcvnks"], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["hayvnks"         ], dig(result, tense: :third_person_singular,  type: :basic)[0]
        assert_equal ["hayēyvnks"         ], dig(result, tense: :first_person_plural,    type: :basic)[0]
        assert_equal ["hayatskvnks", "hayackvnks"], dig(result, tense: :second_person_plural,   type: :basic)[0]
        assert_equal ["hayakvnks"       ], dig(result, tense: :third_person_plural,    type: :basic)[0]

        assert_equal ["hayiyē towvnks"    ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hayetskē towvnks", "hayeckē towvnks", "hayeccē towvnks", "hayetcē towvnks", "hayetsē towvnks"], dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["hayē towvnks"      ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hayeyē towvnks"    ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["hayatskē towvnks", "hayackē towvnks", "hayatsē towvnks"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["hayakē towvnks"    ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["haye towivnks"    ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["haye towetskvnks", "haye toweckvnks", "haye toweccvnks", "haye towetcvnks"], dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["haye towvnks"      ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["haye towēyvnks"    ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["haye towatskvnks", "haye towackvnks"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["haye towakvnks"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
      end

      def test_hueretv
        @subject = 'hueretv'

        result = conjugate_subject

        assert_equal ["huerivnks"              ], dig(result, tense: :first_person_singular,  type: :basic)[0]
        assert_equal ["hueretskvnks", "huereckvnks", "huereccvnks", "hueretcvnks"], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["huervnks"              ], dig(result, tense: :third_person_singular,  type: :basic)[0]
        assert_equal ["sehokēyvnks (of 2)"      ], dig(result, tense: :first_person_plural,    type: :basic)[0]
        assert_equal ["sehokatskvnks (of 2)", "sehokackvnks (of 2)"], dig(result, tense: :second_person_plural,   type: :basic)[0]
        assert_equal ["sehokvnks (of 2)"      ], dig(result, tense: :third_person_plural,    type: :basic)[0]
        assert_equal ["svpaklēyvnks (of 3+)"    ], dig(result, tense: :first_person_plural,   type: :basic)[1]
        #assert_equal ["svpaklatskvnks (of 3+)"], dig(result, tense: :second_person_plural,  type: :basic)[1]
        assert_equal ["svpaklatskvnks (of 3+)", "svpaklackvnks (of 3+)"], dig(result, tense: :second_person_plural,   type: :basic)[1]
        assert_equal ["svpaklvnks (of 3+)"    ], dig(result, tense: :third_person_plural,   type: :basic)[1]

        # Adjectival because I be doing this
        #   that 'ē' is not an l-grade but an adjectival 'ē' in these examples
        assert_equal ["hueriyē towvnks"            ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hueretskē towvnks", "huereckē towvnks", "huereccē towvnks", "hueretcē towvnks", "hueretsē towvnks"],
          dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["huerē towvnks"              ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["sehokeyē towvnks (of 2)"    ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["sehokatskē towvnks (of 2)", "sehokackē towvnks (of 2)", "sehokatsē towvnks (of 2)"],
          dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["sehokē towvnks (of 2)"      ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["svpakleyē towvnks (of 3+)"  ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[1]
        assert_equal ["svpaklatskē towvnks (of 3+)", "svpaklackē towvnks (of 3+)", "svpaklatsē towvnks (of 3+)"],
          dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[1]
        assert_equal ["svpaklē towvnks (of 3+)"    ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[1]

        assert_equal ["huere towivnks"              ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["huere towetskvnks", "huere toweckvnks", "huere toweccvnks", "huere towetcvnks"],
          dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["huere towvnks"                ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoke towēyvnks (of 2)"      ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoke towatskvnks (of 2)", "sehoke towackvnks (of 2)"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoke towakvnks (of 2)"    ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["svpakle towēyvnks (of 3+)"    ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[1]
        assert_equal ["svpakle towatskvnks (of 3+)", "svpakle towackvnks (of 3+)"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[1]
        assert_equal ["svpakle towakvnks (of 3+)"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[1]
      end

      def test_feketv
        @subject = 'feketv'

        result = conjugate_subject

        assert_equal ["fekivnks"],     dig(result, tense: :first_person_singular,  type: :basic)[0]
        assert_equal ["feketskvnks", "fekeckvnks", "fekeccvnks", "feketcvnks"], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["fekvnks"],     dig(result, tense: :third_person_singular,  type: :basic)[0]
        assert_equal ["fekēyvnks"],     dig(result, tense: :first_person_plural,    type: :basic)[0]
        assert_equal ["fekatskvnks", "fekackvnks"], dig(result, tense: :second_person_plural,   type: :basic)[0]
        assert_equal ["fekakvnks"],   dig(result, tense: :third_person_plural,    type: :basic)[0]

        assert_equal ["fekiyē towvnks"],   dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["feketskē towvnks", "fekeckē towvnks", "fekeccē towvnks", "feketcē towvnks", "feketsē towvnks"], dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["fekē towvnks"],     dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["fekeyē towvnks"],   dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["fekatskē towvnks", "fekackē towvnks", "fekatsē towvnks"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["fekakē towvnks"],   dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["feke towivnks"],     dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feke towetskvnks", "feke toweckvnks", "feke toweccvnks", "feke towetcvnks"], dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feke towvnks"],       dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feke towēyvnks"],     dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feke towatskvnks", "feke towackvnks"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feke towakvnks"],   dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
      end

      def test_esketv
        @subject = 'esketv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic)

        assert_equal "eskakvnks", third_person_plural[0][0]

        third_person_singular = result.dig(:third_person_singular, :basic)

        assert_equal "eskvnks", third_person_singular[0][0]
      end

      def test_letketv
        @subject = 'letketv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic)

        assert_equal "letkivnks", first_person_singular[0][0]
      end

      def test_hompetv
        @subject = 'hompetv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic)

        assert_equal "hompakvnks", third_person_plural[0][0]
      end

      def test_fekhonnetv
        @subject = 'fekhonnetv'

        result = conjugate_subject

        second_person_singular = result.dig(:second_person_singular, :basic)

        assert_equal ["fekhonnetskvnks", "fekhonneckvnks", "fekhonneccvnks", "fekhonnetcvnks"], second_person_singular[0]
      end

      def test_kerretv
        @subject = 'kerretv'

        result = conjugate_subject

        third_person_singular = result.dig(:third_person_singular, :basic)

        assert_equal "kerrvnks", third_person_singular[0][0]
      end

      def test_akhottetv
        @subject = 'akhottetv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic)

        assert_equal "akhottivnks", first_person_singular[0][0]
      end

      def test_noricetv
        @subject = 'noricetv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic)

        assert_equal "noricivnks", first_person_singular[0][0]
      end

      def test_vyetv
        @subject = 'vyetv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic)
        third_person_singular = result.dig(:third_person_singular, :basic)

        assert_equal "vyvnks", third_person_singular[0][0]
        assert_equal "vyivnks", first_person_singular[0][0]
      end

      def test_aliketv
        @subject = 'aliketv'

        result = conjugate_subject

        second_person_singular = result.dig(:second_person_singular, :basic)

        assert_equal ["aliketskvnks", "alikeckvnks", "alikeccvnks", "aliketcvnks"], second_person_singular[0]
      end

      # 1st plural
      def test_nesetv
        @subject = 'nesetv'

        result = conjugate_subject

        first_person_plural = result.dig(:first_person_plural, :basic)

        assert_equal "nesēyvnks", first_person_plural[0][0]

        third_person_singular = result.dig(:third_person_singular, :basic)

        assert_equal "nesvnks", third_person_singular[0][0]
      end


      # 1st plural
      def test_yvkvpetv
        @subject = 'yvkvpetv'

        result = conjugate_subject

        first_person_plural = result.dig(:first_person_plural, :basic)

        assert_equal "yvkvphokēyvnks (of 2)", first_person_plural[0][0]

        assert_equal "yvkvpvkēyvnks (of 3+)", first_person_plural[1][0]
      end

      # 3rd plural
      def test_oh_onvyetv
        @subject = 'ohhonvyetv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic)

        assert_equal "ohhonvyakvnks", third_person_plural[0][0]
      end

      # 'fayetv' 2nd person singular
      def test_fayetv
        @subject = 'fayetv'

        result = conjugate_subject

        second_person_singular = result.dig(:second_person_singular, :basic)

        assert_equal ["fayetskvnks", "fayeckvnks", "fayeccvnks", "fayetcvnks"], second_person_singular[0]
      end

      # 'wakketv' 1st person singular
      def test_wakketv
        @subject = 'wakketv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic)

        assert_equal "wakkivnks", first_person_singular[0][0]
      end

      def test_wanayetv
        @subject = 'wanayetv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic)

        assert_equal 'wanayakvnks', third_person_plural[0][0]
      end

      def test_tvmketv
        @subject = 'tvmketv'

        result = conjugate_subject

        first_person_singular  = result.dig(:first_person_singular, :basic)
        second_person_singular = result.dig(:second_person_singular, :basic)
        third_person_singular  = result.dig(:third_person_singular, :basic)
        #first_person_plural    = result.dig(:first_person_plural, :basic)
        #second_person_plural   = result.dig(:second_person_plural, :basic)
        #third_person_plural    = result.dig(:third_person_plural, :basic)

        assert_equal "tvmkivnks", first_person_singular[0][0]
        assert_equal "tvmketskvnks", second_person_singular[0][0]
        assert_equal "tvmkvnks", third_person_singular[0][0]
      end

      def conjugate_subject
        Conjugators::ActionVerbs::PastTwo.new(@subject).conjugate!
      end
    end

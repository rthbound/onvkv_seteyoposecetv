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

        assert_equal ["pvniyēt owvnks"  ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["pvnetskēt owvnks", "pvneckēt owvnks", "pvneccēt owvnks", "pvnetcēt owvnks", "pvnetsēt owvnks"],
          dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["pvnēt owvnks"    ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["pvneyēt owvnks"  ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["pvnatskēt owvnks", "pvnackēt owvnks", "pvnatsēt owvnks"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["pvnakēt owvnks"  ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["pvnet owivnks"   ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvnet owetskvnks", "pvnet oweckvnks", "pvnet oweccvnks", "pvnet owetcvnks"], dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvnet owvnks"    ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvnet owēyvnks"  ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvnet owatskvnks", "pvnet owackvnks"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["pvnet owakvnks"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
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

        assert_equal ["hayiyēt owvnks"    ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hayetskēt owvnks", "hayeckēt owvnks", "hayeccēt owvnks", "hayetcēt owvnks", "hayetsēt owvnks"], dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["hayēt owvnks"      ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hayeyēt owvnks"    ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["hayatskēt owvnks", "hayackēt owvnks", "hayatsēt owvnks"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["hayakēt owvnks"    ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["hayet owivnks"    ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hayet owetskvnks", "hayet oweckvnks", "hayet oweccvnks", "hayet owetcvnks"], dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hayet owvnks"      ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hayet owēyvnks"    ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hayet owatskvnks", "hayet owackvnks"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hayet owakvnks"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
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
        assert_equal ["hueriyēt owvnks"            ], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["hueretskēt owvnks", "huereckēt owvnks", "huereccēt owvnks", "hueretcēt owvnks", "hueretsēt owvnks"],
          dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["huerēt owvnks"              ], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["sehokeyēt owvnks (of 2)"    ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["sehokatskēt owvnks (of 2)", "sehokackēt owvnks (of 2)", "sehokatsēt owvnks (of 2)"],
          dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["sehokēt owvnks (of 2)"      ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["svpakleyēt owvnks (of 3+)"  ], dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[1]
        assert_equal ["svpaklatskēt owvnks (of 3+)", "svpaklackēt owvnks (of 3+)", "svpaklatsēt owvnks (of 3+)"],
          dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[1]
        assert_equal ["svpaklēt owvnks (of 3+)"    ], dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[1]

        assert_equal ["hueret owivnks"              ], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hueret owetskvnks", "hueret oweckvnks", "hueret oweccvnks", "hueret owetcvnks"],
          dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["hueret owvnks"                ], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoket owēyvnks (of 2)"      ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoket owatskvnks (of 2)", "sehoket owackvnks (of 2)"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["sehoket owakvnks (of 2)"    ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["svpaklet owēyvnks (of 3+)"    ], dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[1]
        assert_equal ["svpaklet owatskvnks (of 3+)", "svpaklet owackvnks (of 3+)"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[1]
        assert_equal ["svpaklet owakvnks (of 3+)"  ], dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[1]
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

        assert_equal ["fekiyēt owvnks"],   dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["feketskēt owvnks", "fekeckēt owvnks", "fekeccēt owvnks", "feketcēt owvnks", "feketsēt owvnks"], dig(result, tense: :second_person_singular, type: :tos_auxiliary)[0]
        assert_equal ["fekēt owvnks"],     dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
        assert_equal ["fekeyēt owvnks"],   dig(result, tense: :first_person_plural,    type: :tos_auxiliary)[0]
        assert_equal ["fekatskēt owvnks", "fekackēt owvnks", "fekatsēt owvnks"], dig(result, tense: :second_person_plural,   type: :tos_auxiliary)[0]
        assert_equal ["fekakēt owvnks"],   dig(result, tense: :third_person_plural,    type: :tos_auxiliary)[0]

        assert_equal ["feket owivnks"],     dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feket owetskvnks", "feket oweckvnks", "feket oweccvnks", "feket owetcvnks"], dig(result, tense: :second_person_singular, type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feket owvnks"],       dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feket owēyvnks"],     dig(result, tense: :first_person_plural,    type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feket owatskvnks", "feket owackvnks"], dig(result, tense: :second_person_plural,   type: :ometv_conjugated_auxiliary)[0]
        assert_equal ["feket owakvnks"],   dig(result, tense: :third_person_plural,    type: :ometv_conjugated_auxiliary)[0]
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

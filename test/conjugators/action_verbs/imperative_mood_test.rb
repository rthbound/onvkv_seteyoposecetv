# test/unit/conjugators/action_verbs/present_test.rb
    class ImperativeMoodTest < ::Minitest::Test
      def dig(result, tense:, type:)
        result.dig(tense, type)
      end

      def test_opvnetv
        @subject = 'pvnetv'

        result = conjugate_subject

        assert_equal ["pvnvs"         ], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["pvnepvs"       ], dig(result, tense: :second_person_singular, type: :polite)[0]
        assert_equal ["pvnekot"       ], dig(result, tense: :second_person_singular, type: :do_not)[0]

        assert_equal ["pvnvks"        ], dig(result, tense: :second_person_plural, type: :basic)[0]
        assert_equal ["pvnepvs"       ], dig(result, tense: :second_person_plural, type: :polite)[0]
        assert_equal ["pvnekot"       ], dig(result, tense: :second_person_plural, type: :do_not)[0]
        assert_equal ["pvnvkēs", "pvnvkēts"      ], dig(result, tense: :second_person_plural, type: :lets)[0]
      end

      def test_hayetv
        @subject = 'hayetv'

        result = conjugate_subject

        assert_equal ["hayvs"   ], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["hayepvs" ], dig(result, tense: :second_person_singular, type: :polite)[0]
        assert_equal ["hayekot" ], dig(result, tense: :second_person_singular, type: :do_not)[0]

        assert_equal ["hayvks"  ], dig(result, tense: :second_person_plural, type: :basic)[0]
        assert_equal ["hayepvs" ], dig(result, tense: :second_person_plural, type: :polite)[0]
        assert_equal ["hayekot" ], dig(result, tense: :second_person_plural, type: :do_not)[0]
        assert_equal ["hayvkēs", "hayvkēts"], dig(result, tense: :second_person_plural, type: :lets)[0]
      end

      def test_hueretv
        @subject = 'hueretv'

        result = conjugate_subject

        assert_equal ["huervs"             ], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["huerepvs"           ], dig(result, tense: :second_person_singular, type: :polite)[0]
        assert_equal ["huerekot"           ], dig(result, tense: :second_person_singular, type: :do_not)[0]

        assert_equal ["sehokvks (of 2)"    ], dig(result, tense: :second_person_plural, type: :basic)[0]
        assert_equal ["sehokepvs (of 2)"   ], dig(result, tense: :second_person_plural, type: :polite)[0]
        assert_equal ["sehokekot (of 2)"   ], dig(result, tense: :second_person_plural, type: :do_not)[0]
        assert_equal ["sehokvkēs (of 2)", "sehokvkēts (of 2)"], dig(result, tense: :second_person_plural, type: :lets)[0]
        assert_equal ["svpaklvks (of 3+)"  ], dig(result, tense: :second_person_plural, type: :basic)[1]
        assert_equal ["svpaklepvs (of 3+)" ], dig(result, tense: :second_person_plural, type: :polite)[1]
        assert_equal ["svpaklekot (of 3+)" ], dig(result, tense: :second_person_plural, type: :do_not)[1]
        assert_equal ["svpaklvkēs (of 3+)","svpaklvkēts (of 3+)"], dig(result, tense: :second_person_plural, type: :lets)[1]
      end

      def test_liketv
        @subject = 'liketv'

        result = conjugate_subject

        assert_equal ["likvs"             ], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["likepvs"           ], dig(result, tense: :second_person_singular, type: :polite)[0]
        assert_equal ["likekot"           ], dig(result, tense: :second_person_singular, type: :do_not)[0]
        assert_equal ["likekvs"           ], dig(result, tense: :second_person_singular, type: :let_it)[0]
        assert_equal ["likvccvs", "liket owvccvs"], dig(result, tense: :second_person_singular, type: :you_must)[0]

        assert_equal ["kakvks (of 2)"    ], dig(result, tense: :second_person_plural, type: :basic)[0]
        assert_equal ["kakepvs (of 2)"   ], dig(result, tense: :second_person_plural, type: :polite)[0]
        assert_equal ["kakekot (of 2)"   ], dig(result, tense: :second_person_plural, type: :do_not)[0]
        assert_equal ["kakvkēs (of 2)","kakvkēts (of 2)"], dig(result, tense: :second_person_plural, type: :lets)[0]
        assert_equal ["kakvkvccvs (of 2)","kaket owvkvccvs (of 2)"], dig(result, tense: :second_person_plural, type: :you_must)[0]

        assert_equal ["vpokvks (of 3+)"  ], dig(result, tense: :second_person_plural, type: :basic)[1]
        assert_equal ["vpokepvs (of 3+)" ], dig(result, tense: :second_person_plural, type: :polite)[1]
        assert_equal ["vpokekot (of 3+)" ], dig(result, tense: :second_person_plural, type: :do_not)[1]
        assert_equal ["vpokvkvccvs (of 3+)","vpoket owvkvccvs (of 3+)"], dig(result, tense: :second_person_plural, type: :you_must)[1]
      end

      def test_feketv
        @subject = 'feketv'

        result = conjugate_subject

        assert_equal ["fekvs"   ], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["fekepvs" ], dig(result, tense: :second_person_singular, type: :polite)[0]
        assert_equal ["fekekot" ], dig(result, tense: :second_person_singular, type: :do_not)[0]

        assert_equal ["fekvks"  ], dig(result, tense: :second_person_plural, type: :basic)[0]
        assert_equal ["fekepvs" ], dig(result, tense: :second_person_plural, type: :polite)[0]
        assert_equal ["fekekot" ], dig(result, tense: :second_person_plural, type: :do_not)[0]
        assert_equal ["fekvkēs", "fekvkēts"], dig(result, tense: :second_person_plural, type: :lets)[0]
      end

      def conjugate_subject
        Conjugators::ActionVerbs::ImperativeMood.new(@subject).conjugate!
      end
    end

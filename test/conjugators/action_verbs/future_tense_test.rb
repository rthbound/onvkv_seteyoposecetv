    class FutureTenseTest < ::Minitest::Test
      def dig(result, tense:, type:)
        result.dig(tense, type)
      end

      def test_hayetv
        @subject = 'hayetv'

        result = conjugate_subject

        assert_equal ["hayarēs"     ], dig(result, tense: :first_person_singular,  type: :basic)[0]
        assert_equal ["hayetskvrēs" ], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["hayvrēs"     ], dig(result, tense: :third_person_singular,  type: :basic)[0]
        assert_equal ["hayēyvrēs"   ], dig(result, tense: :first_person_plural,    type: :basic)[0]
        assert_equal ["hayatskvrēs" ], dig(result, tense: :second_person_plural,   type: :basic)[0]
        assert_equal ["hayvkvrēs"   ], dig(result, tense: :third_person_plural,    type: :basic)[0]
      end

      def test_hueretv
        @subject = 'hueretv'

        result = conjugate_subject

        assert_equal ["huerarēs"              ], dig(result, tense: :first_person_singular,  type: :basic)[0]
        assert_equal ["hueretskvrēs"          ], dig(result, tense: :second_person_singular, type: :basic)[0]
        assert_equal ["huervrēs"              ], dig(result, tense: :third_person_singular,  type: :basic)[0]
        assert_equal ["sehokēyvrēs (of 2)"    ], dig(result, tense: :first_person_plural,    type: :basic)[0]
        assert_equal ["sehokatskvrēs (of 2)"  ], dig(result, tense: :second_person_plural,   type: :basic)[0]
        assert_equal ["sehokvrēs (of 2)"      ], dig(result, tense: :third_person_plural,    type: :basic)[0]
        assert_equal ["svpaklēyvrēs (of 3+)"  ], dig(result, tense: :first_person_plural,   type: :basic)[1]
        assert_equal ["svpaklatskvrēs (of 3+)"], dig(result, tense: :second_person_plural,  type: :basic)[1]
        assert_equal ["svpaklvrēs (of 3+)"    ], dig(result, tense: :third_person_plural,   type: :basic)[1]
      end

      def conjugate_subject
        Conjugators::ActionVerbs::FutureTense.new(@subject).conjugate!
      end
    end

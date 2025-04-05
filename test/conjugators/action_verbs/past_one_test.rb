# test/unit/conjugators/action_verbs/past_one_test.rb
    class PastOneTest < ::Minitest::Test
      def test_vyetv
        @subject = 'vyetv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_past_one)
        third_person_singular = result.dig(:third_person_singular, :basic_past_one)

        assert_equal "vhyis", first_person_singular[0][0]

        assert_equal "vhyes", third_person_singular[0][0]
      end

      def test_hayetv
        @subject = 'hayetv'

        result = conjugate_subject

        second_person_singular = result.dig(:second_person_singular, :basic_past_one)

        assert_equal ["hvhyetskes", "hvhyeckes", "hvhyecces", "hvhyetces", "hvhyetses"], second_person_singular[0]
      end

      def test_feketv
        @subject = 'feketv'

        result = conjugate_subject

        first_person_plural = result.dig(:first_person_plural, :basic_past_one)

        assert_equal "fehkēs", first_person_plural[0][0]
      end

      def test_esketv
        @subject = 'esketv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic_past_one)

        assert_equal "esikakes", third_person_plural[0][0]

        third_person_singular = result.dig(:third_person_singular, :basic_past_one)

        assert_equal "esikes", third_person_singular[0][0]
      end

      def test_letketv
        @subject = 'letketv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_past_one)

        assert_equal "letikis", first_person_singular[0][0]
      end

      def test_hompetv
        @subject = 'hompetv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic_past_one)

        assert_equal "homipakes", third_person_plural[0][0]
      end

      def test_fekhonnetv
        @subject = 'fekhonnetv'

        result = conjugate_subject

        second_person_singular = result.dig(:second_person_singular, :basic_past_one)

        assert_equal ["fekhoniyetskes", "fekhoniyeckes", "fekhoniyecces", "fekhoniyetces", "fekhoniyetses"], second_person_singular[0]
      end

      def test_kerretv
        @subject = 'kerretv'

        result = conjugate_subject

        third_person_singular = result.dig(:third_person_singular, :basic_past_one)

        assert_equal "keriyes", third_person_singular[0][0]
      end

      def test_akhottetv
        @subject = 'akhottetv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_past_one)

        assert_equal "akhotiyis", first_person_singular[0][0]
      end

      def test_noricetv
        @subject = 'noricetv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_past_one)

        assert_equal "norihcis", first_person_singular[0][0]
      end

      def test_aliketv
        @subject = 'aliketv'

        result = conjugate_subject

        second_person_singular = result.dig(:second_person_singular, :basic_past_one)

        assert_equal ["alihketskes", "alihkeckes", "alihkecces", "alihketces", "alihketses"], second_person_singular[0]
      end

      # 1st plural
      def test_nesetv
        @subject = 'nesetv'

        result = conjugate_subject

        first_person_plural = result.dig(:first_person_plural, :basic_past_one)

        assert_equal "nehsēs", first_person_plural[0][0]

        third_person_singular = result.dig(:third_person_singular, :basic_past_one)

        assert_equal "nehses", third_person_singular[0][0]
      end


      # 1st plural
      def test_yvkvpetv
        @subject = 'yvkvpetv'

        result = conjugate_subject

        first_person_plural = result.dig(:first_person_plural, :basic_past_one)

        assert_equal "yvkvphohkēs (of 2)", first_person_plural[0][0]

        assert_equal "yvkvpvhkēs (of 3+)", first_person_plural[1][0]
      end

      # 3rd plural
      def test_oh_onvyetv
        @subject = 'ohhonvyetv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic_past_one)

        assert_equal "ohhonvyvhkes", third_person_plural[0][0]
      end

      # 'fayetv' 2nd person singular
      def test_fayetv
        @subject = 'fayetv'

        result = conjugate_subject

        second_person_singular = result.dig(:second_person_singular, :basic_past_one)

        assert_equal ["fvhyetskes", "fvhyeckes", "fvhyecces", "fvhyetces", "fvhyetses"], second_person_singular[0]
      end

      # 'wakketv' 1st person singular
      def test_wakketv
        @subject = 'wakketv'

        result = conjugate_subject

        first_person_singular = result.dig(:first_person_singular, :basic_past_one)

        assert_equal "wakikis", first_person_singular[0][0]
      end

      def test_wanayetv
        @subject = 'wanayetv'

        result = conjugate_subject

        third_person_plural = result.dig(:third_person_plural, :basic_past_one)

        assert_equal 'wanayvhkes', third_person_plural[0][0]
      end

      def conjugate_subject
        Conjugators::ActionVerbs::PastOne.new(@subject).conjugate!
      end
    end

require 'pry'

class VhanTest < ::Minitest::Test
  def dig(result, tense:, type:)
    result.dig(tense, type)
  end

  def test_mēcetv
    @subject = 'mēcetv'
    result = conjugate_subject

    # BASIC
    assert_equal ["mēcvhanis"], dig(result, tense: :first_person_singular,  type: :basic)[0]
    assert_equal ["mēcvhanetskes", "mēcvhaneckes", "mēcvhanecces", "mēcvhanetces", "mēcvhanetses"], dig(result, tense: :second_person_singular,  type: :basic)[0]
    assert_equal ["mēcvhanes"], dig(result, tense: :third_person_singular,  type: :basic)[0]
    assert_equal ["mēcvhanēs"], dig(result, tense: :first_person_plural,  type: :basic)[0]
    assert_equal ["mēcvhanatskes", "mēcvhanackes", "mēcvhanatses"], dig(result, tense: :second_person_plural,  type: :basic)[0]
    assert_equal ["mēcvkvhanes"], dig(result, tense: :third_person_plural,  type: :basic)[0]

    # TOS AUXILIARY
    assert_equal ["mēcvhanit os"], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
    assert_equal ["mēcvhanetsket os", "mēcvhanecket os", "mēcvhaneccet os", "mēcvhanetcet os", "mēcvhanetset os"], dig(result, tense: :second_person_singular,  type: :tos_auxiliary)[0]
    assert_equal ["mēcvhanet os"], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
    assert_equal ["mēcvhanēt os"], dig(result, tense: :first_person_plural,  type: :tos_auxiliary)[0]
    assert_equal ["mēcvhanatsket os", "mēcvhanacket os", "mēcvhanatset os"], dig(result, tense: :second_person_plural,  type: :tos_auxiliary)[0]
    assert_equal ["mēcvkvhanet os"], dig(result, tense: :third_person_plural,  type: :tos_auxiliary)[0]

    # OMETV CONJUGATED AUX.
    assert_equal ["mēcvhanet owis"], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
    assert_equal ["mēcvhanet owetskes", "mēcvhanet oweckes", "mēcvhanet owecces", "mēcvhanet ontces", "mēcvhanet onckes", "mēcvhanet ontses"], dig(result, tense: :second_person_singular,  type: :ometv_conjugated_auxiliary)[0]
    assert_equal ["mēcvhanet os"], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
    assert_equal ["mēcvhanet owēs"], dig(result, tense: :first_person_plural,  type: :ometv_conjugated_auxiliary)[0]
    assert_equal ["mēcvhanet owatskes", "mēcvhanet owackes", "mēcvhanet owatses"], dig(result, tense: :second_person_plural,  type: :ometv_conjugated_auxiliary)[0]
    assert_equal ["mēcvkvhanet os"], dig(result, tense: :third_person_plural,  type: :ometv_conjugated_auxiliary)[0]
  end

  def test_wvnvyetv
    @subject = 'wvnvyetv'
    result = conjugate_subject

    # BASIC
    assert_equal ["wvnvyvhanis"], dig(result, tense: :first_person_singular,  type: :basic)[0]
    assert_equal ["wvnvyvhanetskes", "wvnvyvhaneckes", "wvnvyvhanecces", "wvnvyvhanetces", "wvnvyvhanetses"], dig(result, tense: :second_person_singular,  type: :basic)[0]
    assert_equal ["wvnvyvhanes"], dig(result, tense: :third_person_singular,  type: :basic)[0]
    assert_equal ["wvnvyvhanēs"], dig(result, tense: :first_person_plural,  type: :basic)[0]
    assert_equal ["wvnvyvhanatskes", "wvnvyvhanackes", "wvnvyvhanatses"], dig(result, tense: :second_person_plural,  type: :basic)[0]
    assert_equal ["wvnvyvkvhanes"], dig(result, tense: :third_person_plural,  type: :basic)[0]

    # TOS AUXILIARY
    assert_equal ["wvnvyvhanit os"], dig(result, tense: :first_person_singular,  type: :tos_auxiliary)[0]
    assert_equal ["wvnvyvhanetsket os", "wvnvyvhanecket os", "wvnvyvhaneccet os", "wvnvyvhanetcet os", "wvnvyvhanetset os"], dig(result, tense: :second_person_singular,  type: :tos_auxiliary)[0]
    assert_equal ["wvnvyvhanet os"], dig(result, tense: :third_person_singular,  type: :tos_auxiliary)[0]
    assert_equal ["wvnvyvhanēt os"], dig(result, tense: :first_person_plural,  type: :tos_auxiliary)[0]
    assert_equal ["wvnvyvhanatsket os", "wvnvyvhanacket os", "wvnvyvhanatset os"], dig(result, tense: :second_person_plural,  type: :tos_auxiliary)[0]

    # OMETV CONJUGATED AUX.
    assert_equal ["wvnvyvhanet owis"], dig(result, tense: :first_person_singular,  type: :ometv_conjugated_auxiliary)[0]
    assert_equal ["wvnvyvhanet owetskes", "wvnvyvhanet oweckes", "wvnvyvhanet owecces", "wvnvyvhanet ontces", "wvnvyvhanet onckes", "wvnvyvhanet ontses"], dig(result, tense: :second_person_singular,  type: :ometv_conjugated_auxiliary)[0]
    assert_equal ["wvnvyvhanet os"], dig(result, tense: :third_person_singular,  type: :ometv_conjugated_auxiliary)[0]
    assert_equal ["wvnvyvhanet owēs"], dig(result, tense: :first_person_plural,  type: :ometv_conjugated_auxiliary)[0]
    assert_equal ["wvnvyvhanet owatskes", "wvnvyvhanet owackes", "wvnvyvhanet owatses"], dig(result, tense: :second_person_plural,  type: :ometv_conjugated_auxiliary)[0]
    assert_equal ["wvnvyvkvhanet os"], dig(result, tense: :third_person_plural,  type: :ometv_conjugated_auxiliary)[0]
  end

  def conjugate_subject
    Conjugators::ActionVerbs::Vhan.new(@subject).conjugate!
  end
end

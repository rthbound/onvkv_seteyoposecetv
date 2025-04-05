module Conjugators
  module ActionVerbs
    module Shared
      def irregulars_two_way
        irregulars.select {|k,v| v.size == 2}
      end

      def irregulars_three_way
        irregulars.select {|k,v| v.size == 3}
      end

      def irregulars
        @@irregulars ||= {
          "cēyetv"    => { 1 => "cēyetv",    2 => "cēhoyetv",    3 => "escēyetv"   },
          "fiketv"    => { 1 => "fiketv",    2 => "fihoketv",    3 => "fvyecetv"   },
          "folotketv" => { 1 => "folotketv", 2 => "folothoketv", 3 => "folotecetv" },
          "vfolotketv" => { 1 => "vfolotketv", 2 => "vfolothoketv", 3 => "vfolotecetv" },
          "hoyvnetv"  => { 1 => "hoyvnetv",  2 => "hoyvnhoyetv", 3 => "hoyvnecetv" },
          "hueretv"   => { 1 => "hueretv",   2 => "sehoketv",    3 => "svpakletv"  },
          "hvlketv"   => { 1 => "hvlketv",   2 => "hvlhoketv",   3 => "hvlecetv"   },
          "hvkihketv" => { 1 => "hvkihketv", 2 => "hvkihhoketv", 3 => "hvkahecetv" },
          "hvtvpketv" => { 1 => "hvtvpketv", 2 => "hvtvphoketv", 3 => "hvtvpecetv" },
          "letketv"   => { 1 => "letketv",   2 => "tokorketv",   3 => "pefatketv"  },
          "liketv"    => { 1 => "liketv",    2 => "kaketv",      3 => "vpoketv"    },
          "lvtketv"   => { 1 => "lvtketv",   2 => "yurketv",     3 => "pvlvtketv"  },
          "nocetv"    => { 1 => "nocetv",    2 => "nochoyetv",   3 => "nocicetv"   },
          "’rem oretv"=> { 1 => "’rem oretv",2 => "’rem orhoyetv",3 => "’rem oricetv"},
          "oretv"     => { 1 => "oretv",     2 => "orhoyetv",    3 => "oricetv"    },
          "ossetv"    => { 1 => "ossetv",    2 => "wolketv",     3 => "sossetv"    },
          "pihketv"   => { 1 => "pihketv",   2 => "pihhoketv",   3 => "pahecetv"   },
          "solotketv" => { 1 => "solotketv", 2 => "solothoketv", 3 => "solotecetv" },
          "somketv"   => { 1 => "somketv",   2 => "somhoketv",   3 => "somecetv"   },
          "tasketv"   => { 1 => "tasketv",   2 => "tashoketv",   3 => "tasecetv"   },
          "tiketv"    => { 1 => "tiketv",    2 => "tihoketv",    3 => "tvyecetv"   },
          "tvmketv"   => { 1 => "tvmketv",   2 => "tvmhoketv",   3 => "tvmecetv"   },
          "vcemketv"  => { 1 => "vcemketv",  2 => "vcemhoketv",  3 => "vcemecetv"  },
          "vlvketv"   => { 1 => "vlvketv",   2 => "alvhoketv",   3 => "yicetv"     },
          "vretv"     => { 1 => "vretv",     2 => "welvketv",    3 => "fulletv"    },
          "vhvretv"     => { 1 => "vhvretv",     2 => "vwelvketv",    3 => "vfulletv"    },
          "ohvretv"     => { 1 => "ohvretv",     2 => "ohwelvketv",    3 => "ohfulletv"    },
          "vtetv"     => { 1 => "vtetv",     2 => "vthoyetv",    3 => "vwetv"      },
          "vwelvpketv"=> { 1 => "vwelvpketv",2 => "vwelvphoketv",3 => "vwelvpecetv"},
          "vyetv"     => { 1 => "vyetv",     2 => "vhoyetv",     3 => "vpeyetv"    },
          "wakketv"   => { 1 => "wakketv",   2 => "wakhoketv",   3 => "lomhetv"    },
          "wohketv"   => { 1 => "wohketv",   2 => "wohhoketv",   3 => "wohecetv"   },
          "yefolketv" => { 1 => "yefolketv", 2 => "yefolhoketv", 3 => "yefolecetv" },
          "yvkvpetv"  => { 1 => "yvkvpetv",  2 => "yvkvphoketv", 3 => "yvkvpvketv" },
          "vhvpalofketv"  => { 1 => "vhvpalofketv",  2 => "vhvpalofhoketv", 3 => "vhvpalofecetv" },
          # Two way
          "eletv"            => { 1 => "eletv",            2 => "pvsvtketv"          },
          "akpiketv"         => { 1 => "akpiketv",         2 => "aktehetv"           },
          "tekkeketv"        => { 1 => "tekkeketv",        2 => "tekkēteketv"        },
          "cehvlletv"        => { 1 => "cehvlletv",        2 => "cehvlhoyetv"        },
          "cvpketv"          => { 1 => "cvpketv",          2 => "cvpcvketv"          },
          "cvyayvketv"       => { 1 => "cvyayvketv",       2 => "cvyayvhoyetv"       },
          "vpiketv"          => { 1 => "vpiketv",          2 => "vtehketv"           },
          "etefvlahletv"     => { 1 => "etefvlahletv",     2 => "etefvlvpketv"       },
          "opunvyetv"        => { 1 => "opunvyetv",        2 => "opunahoyetv"        },
          "haketv"           => { 1 => "haketv",           2 => "hahvketv"           },
          "hesaketv"         => { 1 => "hesaketv",         2 => "hesahoketv"         },
          "hvkvnceropotketv" => { 1 => "hvkvnceropotketv", 2 => "hvkvnceropothoketv" },
          "kvcketv"          => { 1 => "kvcketv",          2 => "kvcēketv"           },
          "ocetv"            => { 1 => "ocetv",            2 => "svsetv"             },
          "taktekaksetv"     => { 1 => "taktekaksetv",     2 => "taktekvstvketv"     },
          "tiyetv"           => { 1 => "tiyetv",           2 => "tihoyetv"           },
          "tonetv"           => { 1 => "tonetv",           2 => "tontuecetv"         },
          "tulketv"          => { 1 => "tulketv",          2 => "tultoketv"          },
          "vcekelletv"       => { 1 => "vcekelletv",       2 => "vcekelhoyetv"       },
          "vccetv"           => { 1 => "vccetv",           2 => "vchoyetv"           },
          "vhocefketv"       => { 1 => "vhocefketv",       2 => "vhocefhoketv"       },
          "vhopvnketv"       => { 1 => "vhopvnketv",       2 => "vhopvnhoketv"       },
          "vkvrpetv"         => { 1 => "vkvrpetv",         2 => "vkvrkvpetv"         },
          "vlokpetv"         => { 1 => "vlokpetv",         2 => "vloklopetv"         },
          "vnvtaksetv"       => { 1 => "vnvtaksetv",       2 => "vnvtvsnvketv"       },
          "vpeletv"          => { 1 => "vpeletv",          2 => "vpelhoyetv"         },
          "vsokketv"         => { 1 => "vsokketv",         2 => "vsokhoketv"         },
          "vtvrketv"         => { 1 => "vtvrketv",         2 => "vtvrtvketv"         },
          "wiketv"           => { 1 => "wiketv",           2 => "wihoketv"           },
          "wvswaketv"        => { 1 => "wvswaketv",        2 => "wvswahoketv"        },
          "yvfketv"          => { 1 => "yvfketv",          2 => "yvfyvketv"          },
        }
      end

      def person_markers
        @@person_markers ||= {
          '1ps' => %w{          i                },
          '2ps' => %w{ etske ecke ecce etce etse },
          '3ps' => %w{          e                },
          '1pp' => %w{          ē                },
          '2pp' => %w{        atske acke atse    },
          '3pp' => %w{         ake               },
        }
      end

    end
  end
end

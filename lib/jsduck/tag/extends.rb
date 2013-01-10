require "jsduck/tag/tag"
require "jsduck/ast_utils"

module JsDuck::Tag
  class Extends < Tag
    def initialize
      @pattern = ["extend", "extends"]
      @key = :extends
      @ext_define_pattern = "extend"
      @ext_define_default = {:extends => "Ext.Base"}
    end

    # @extends classname
    def parse(p)
      {
        :tagname => :extends,
        :extends => p.hw && p.ident_chain,
      }
    end

    def process_doc(tags)
      tags[0][:extends]
    end

    def parse_ext_define(cls, ast)
      cls[:extends] = JsDuck::AstUtils.make_string(ast)
    end
  end
end

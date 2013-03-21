require 'redcarpet'
require 'pygments.rb'

module Soffes
  class MarkdownRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      if language
        Pygments.highlight(code, lexer: language.to_sym)
      else
        code
      end
    end
  end
end

require 'redcarpet'
require 'pygmentize'

module Soffes
  class MarkdownRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygmentize.process(code, language)
    end
  end
end

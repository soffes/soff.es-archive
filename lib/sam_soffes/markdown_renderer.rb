class SamSoffes::MarkdownRenderer < Redcarpet::Render::HTML
	def block_code(code, language)
		Pygmentize.process(code, language)
		# Pygments.highlight(code, options: {encoding: 'utf-8'}, lexer: language)
	end
end

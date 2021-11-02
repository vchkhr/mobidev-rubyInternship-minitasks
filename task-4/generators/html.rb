# frozen_string_literal: true

require_relative './base'

class GeneratorHtml < GeneratorBase
  def apply_mapping(line)
    case line
    when Header
      "<h1>#{line.text}</h1>"
    when Text
      "<p>#{line.text}</p>"
    when Section
      "<h1>#{line.title}<h1>\n<p>#{line.text}</p>"
    when Link
      "<a href=\"#{line.href}\">#{line.text}</a>"
    when Image
      "<img src=\"#{line.src}\" alt=\"#{line.alt}\">"
    else
      'UNKNOWN'
    end
  end
end

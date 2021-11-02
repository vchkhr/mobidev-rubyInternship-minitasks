# frozen_string_literal: true

require_relative './base'

class GeneratorMd < GeneratorBase
  def apply_mapping(line)
    case line
    when Header
      "# #{line.text}"
    when Text
      line.text.to_s
    when Section
      "# #{line.title}\n#{line.text}"
    when Link
      "[#{line.text}](#{line.href})"
    when Image
      "![#{line.alt}](#{line.src})"
    else
      'UNKNOWN'
    end
  end
end

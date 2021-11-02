# frozen_string_literal: true

class GeneratorDsl
  attr_accessor :lines

  def initialize
    @lines = []
  end

  def header(str)
    @lines << Header.new(str)
  end

  def text(str)
    @lines << Text.new(str)
  end

  def section(header, text)
    @lines << Section.new(header, text)
  end

  def link(text, href)
    @lines << Link.new(text, href)
  end

  def image(alt, src)
    @lines << Image.new(alt, src)
  end
end

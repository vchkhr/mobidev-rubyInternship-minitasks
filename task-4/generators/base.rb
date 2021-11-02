# frozen_string_literal: true

class GeneratorBase
  def initialize(lines)
    @lines = lines
  end

  def to_s
    @lines.map do |line|
      apply_mapping(line)
    end.join("\n")
  end

  def apply_mapping(_line)
    throw StandardError.new 'Not implented yet'
  end
end

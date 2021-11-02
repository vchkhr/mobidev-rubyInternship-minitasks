# frozen_string_literal: true

require_relative './generator_dsl'
require_relative './generators/md'
require_relative './generators/html'

class Generator
  def initialize(&block)
    @dsl = GeneratorDsl.new
    @dsl.instance_eval(&block)
  end

  def generate(path, format)
    class_name = "Generator#{format.capitalize}"
    cl = Object.const_get(class_name)
    generator = cl.new(@dsl.lines)

    current = File.dirname(__FILE__)
    destination = "#{current}/#{path}.#{format}"

    dirname = File.dirname(destination)
    FileUtils.mkdir_p(dirname) unless File.directory?(dirname)

    File.open(destination.to_s, 'w+') << generator.to_s
  end
end

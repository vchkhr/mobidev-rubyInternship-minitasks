# frozen_string_literal: true

require_relative './env'
require_relative './generator'
require_relative './data_structures'

gen = Generator.new do
  header 'Hello title'
  text 'Some text'
  section 'Section Title', 'Section Text'
  link 'Link text', 'http://url.com'
  image 'alt text', 'https://raw.githubusercontent.com/adam-p/markdown-here/master/src/common/images/icon48.png'
end

prompt = TTY::Prompt.new

path = prompt.ask("Enter file name", default: "build/README") do |q|
  q.validate(/^[a-zA-Z][a-zA-Z0-9]*[\/]*[a-zA-Z0-9]*$/, "Invalid file name")
end

ext = prompt.select("Select extension", %w(html md))

gen.generate(path, ext)

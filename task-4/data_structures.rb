# frozen_string_literal: true

Header = Struct.new(:text)
Text = Struct.new(:text)
Section = Struct.new(:title, :text)
Link = Struct.new(:text, :href)
Image = Struct.new(:alt, :src)

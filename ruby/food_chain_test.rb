#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/pride'
require 'minitest/autorun'

require_relative 'food_chain'

class NoCheating < IOError
  def message
    "The use of File.open and IO.read is restricted.\n"                \
    'This exercise intends to help you improve your ability to work ' \
    'with data generated from your code. Your program must not read ' \
    'the song.txt file.'
  end
end

class FoodChainTest < Minitest::Test
  # This test is an acceptance test.
  #
  # If you find it difficult to work the problem with so much
  # output, go ahead and add a `skip`, and write whatever
  # unit tests will help you. Then unskip it again
  # to make sure you got it right.
  # There's no need to submit the tests you write, unless you
  # specifically want feedback on them.

  def test_the_first_verse
    expected = "I know an old lady who swallowed a fly.\n" \
    "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    assert_equal expected, FoodChain.verse(1)
  end

  def test_the_second_verse
    expected = "I know an old lady who swallowed a spider.\n" \
    "It wriggled and jiggled and tickled inside her.\n" \
    "She swallowed the spider to catch the fly.\n" \
    "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    assert_equal expected, FoodChain.verse(2)
  end

  def test_the_third_verse
    expected = "I know an old lady who swallowed a bird.\n" \
    "How absurd to swallow a bird!\n" \
    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" \
    "She swallowed the spider to catch the fly.\n" \
    "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    assert_equal expected, FoodChain.verse(3)
  end

  def test_the_fourth_verse
    expected = "I know an old lady who swallowed a cat.\n" \
    "Imagine that, to swallow a cat!\n" \
    "She swallowed the cat to catch the bird.\n" \
    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" \
    "She swallowed the spider to catch the fly.\n" \
    "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    assert_equal expected, FoodChain.verse(4)
  end

  def test_the_fifth_verse
    expected = "I know an old lady who swallowed a dog.\n" \
    "What a hog, to swallow a dog!\n" \
    "She swallowed the dog to catch the cat.\n" \
    "She swallowed the cat to catch the bird.\n" \
    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" \
    "She swallowed the spider to catch the fly.\n" \
    "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    assert_equal expected, FoodChain.verse(5)
  end

  def test_the_sixth_verse
    expected = "I know an old lady who swallowed a goat.\n" \
    "Just opened her throat and swallowed a goat!\n" \
    "She swallowed the goat to catch the dog.\n" \
    "She swallowed the dog to catch the cat.\n" \
    "She swallowed the cat to catch the bird.\n" \
    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" \
    "She swallowed the spider to catch the fly.\n" \
    "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    assert_equal expected, FoodChain.verse(6)
  end

  def test_the_seventh_verse
    expected = "I know an old lady who swallowed a cow.\n" \
    "I don't know how she swallowed a cow!\n" \
    "She swallowed the cow to catch the goat.\n" \
    "She swallowed the goat to catch the dog.\n" \
    "She swallowed the dog to catch the cat.\n" \
    "She swallowed the cat to catch the bird.\n" \
    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" \
    "She swallowed the spider to catch the fly.\n" \
    "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    assert_equal expected, FoodChain.verse(7)
  end

  def test_the_eighth_verse
    expected = "I know an old lady who swallowed a horse.\n" \
    "She's dead, of course!\n"
    assert_equal expected, FoodChain.verse(8)
  end

  def test_the_whole_songs
    song_file = File.expand_path('../song.txt', __FILE__)
    expected  = IO.read(song_file)
    assert_equal expected, FoodChain.song
  end

  # Tests that an error is effectively raised when IO.read or
  # File.open are used within FoodChain.
  def test_read_guard
    song_file = File.expand_path('../song.txt', __FILE__)
    ["IO.read '#{song_file}'", "File.open '#{song_file}'"].each do |trigger|
      assert_raises(NoCheating) { FoodChain.send :class_eval, trigger }
    end
  end

  # Problems in exercism evolve over time,
  # as we find better ways to ask questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of BookKeeping.
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  # def test_version
  #   skip
  #   assert_equal 2, BookKeeping::VERSION
  # end
end

module RestrictedClasses
  class File
    def self.open(*)
      fail NoCheating
    end

    def self.read(*)
      fail NoCheating
    end

    def open(*)
      fail NoCheating
    end

    def read(*)
      fail NoCheating
    end
  end

  class IO
    def self.read(*)
      fail NoCheating
    end

    def read(*)
      fail NoCheating
    end
  end
end

FoodChain.prepend RestrictedClasses

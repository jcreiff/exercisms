#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'twelve_days'

class TwelveDaysTest < Minitest::Test
  # This test is an acceptance test.
  #
  # If you find it difficult to work the problem with so much
  # output, go ahead and add a `skip`, and write whatever
  # unit tests will help you. Then unskip it again
  # to make sure you got it right.
  # There's no need to submit the tests you write, unless you
  # specifically want feedback on them.
  def test_the_first_verse
    expected = "On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree."
    assert_equal expected, TwelveDays.verse(1)
  end

  def test_the_second_verse
    expected = "On the second day of Christmas my true love gave to me, two Turtle Doves, and a Partridge in a Pear Tree."
    assert_equal expected, TwelveDays.verse(2)
  end

  def test_the_whole_song
    song_file = File.expand_path('../twelve_days_song.txt', __FILE__)
    expected = IO.read(song_file)
    assert_equal expected, TwelveDays.song
  end

  # Problems in exercism evolve over time,
  # as we find better ways to ask questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of TwelveDays.
  # If you're curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  # def test_version
  #   assert_equal 2, BookKeeping::VERSION
  # end
end

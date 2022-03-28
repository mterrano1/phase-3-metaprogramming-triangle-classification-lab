class Triangle
  # write code here
  attr_accessor :sideOne, :sideTwo, :sideThree

  def initialize sideOne, sideTwo, sideThree
    @sideOne = sideOne
    @sideTwo = sideTwo
    @sideThree = sideThree
  end

  def kind
    validate_triangle
    if sideOne == sideTwo && sideTwo == sideThree
      :equilateral
    elsif sideOne == sideTwo || sideTwo == sideThree || sideOne == sideThree
      :isosceles
    else
      :scalene
    end
  end

    private

  def greater_than_zero
    [sideOne, sideTwo, sideThree].all?(&:positive?)
  end

  def triangle_inequality
    sideOne + sideTwo > sideThree && sideOne + sideThree > sideTwo && sideTwo + sideThree > sideOne
  end

  def validate_triangle
    raise TriangleError unless greater_than_zero && triangle_inequality
  end

  class TriangleError < StandardError
  end
end

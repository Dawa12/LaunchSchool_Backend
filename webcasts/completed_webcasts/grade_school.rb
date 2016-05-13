require 'pry'

class School
  attr_accessor :school

  def initialize
    @school = {}
  end

  def to_h
    if school.empty?
      school
    else
      school.values.each do |student|
        student.sort!
      end

      school.sort_by {|grade, student| grade}.to_h
    end
  end

  def add(student, grade)
    school[grade] ? school[grade] << student : school[grade] = [student]
  end

  def grade(level)
    school[level] ? school[level].sort : []
  end
end









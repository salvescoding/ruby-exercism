module BookKeeping
  VERSION = 3
end

class School

  def initialize
    @school = {}
  end

  def students(grade)
    return [] if !@school.has_key?(grade)
    @school.fetch(grade).sort
  end

  def add(student, grade)
    @school.has_key?(grade) ? @school[grade].push(student) : @school[grade] = [student]
  end

  def students_by_grade
    @school.map do |key, value|
      { grade: key, students: value.sort }
    end.sort_by { |hash| hash[:grade] }
  end
end

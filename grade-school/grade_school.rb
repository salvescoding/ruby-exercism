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
    everyone = @school.map do |key, value|
      { grade: key, students: value.sort }
    end
    everyone
    # grade = @school.key(@school.values.flatten)
    # #return [] if grade.nil?
    # students = @school.values.flatten
  end
end

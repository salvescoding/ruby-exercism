class School

  def students(grade)

  end

  def add(name, grade)
    school = {}
    if school.has_key?(grade)
      school[grade].push(name)
    else
      school[grade] = [name]
    end
    school_total(school, grade)
  end

  def school_total(total, grade)
    total
  end
end

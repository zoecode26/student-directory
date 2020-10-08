require 'csv'

class StudentList
  def initialize
    @students = []
  end

  def add(student)
    @students.push(student.get_student)
  end

  def print_students_list
    @students.uniq.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end

  def print_header
    puts ()
    puts "The students of Villains Academy"
    puts "-------------"
    puts ()
  end
end

class Student
  def initialize(name)
    @name = name
    @cohort = :november
  end

  def get_student
    return {name: @name, cohort: @cohort}
  end
end

student = Student.new("Matt")
students = StudentList.new
students.add(student)
students.print_students_list

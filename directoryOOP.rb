require 'csv'

class StudentList
  def initialize
    @students = []
  end

  def add(student)
    @students.push(student.get_student)
    @students = @students.uniq
  end

  def print_header
    puts ()
    puts "The students of Villains Academy"
    puts "-------------"
    puts ()
  end

  def print_students_list
    @students.uniq.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end

  def print_footer
    puts()
    puts "Overall, we have #{@students.count} great students"
    puts()
  end

  def show_students
    print_header
    print_students_list
    print_footer
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

class StartMenu
  def initialize
    @studentlist = StudentList.new
    while true do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  def print_menu
    puts()
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to file"
    puts "4. Load the list from file"
    puts "9. Exit"
    puts()
  end

  def input_students
    while true do
      puts()
      puts "Please enter the names of the students"
      puts "To finish, type stop"
      name = STDIN.gets.chomp
      if name == "stop"
        break
      else
        student = Student.new(name)
        @studentlist.add(student)
      end
    end
    puts()
    puts("STUDENT/s ADDED")
    puts()
  end

  def process(selection)
    case selection
      when "1"
        students = input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
        puts()
    end
  end
end




run = StartMenu.new
run
# student = Student.new("Matt")
# students = StudentList.new
# students.add(student)
# students.show_students

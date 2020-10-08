require 'csv'

class StudentList
  def initialize
    @students = []
  end

  def add(student)
    @students.push(student.get_student)
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
    puts "Overall, we have #{@students.uniq.count} great students"
    puts()
  end

  def show_students
    print_header
    print_students_list
    print_footer
  end

  def return_list
    return @students
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
    try_load_students
    while true do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  def try_load_students
    puts()
    filename = ARGV.first # first argument from the command line
    if filename.nil? # get out of the method if it isn't given
      filename = "students.csv"
    end
    if File.exists?(filename) # if it exists
       universal_loading(filename)
       puts "Loaded #{@studentlist.return_list.count} from #{filename}"
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit # quit the program
    end
    puts()
  end

  def universal_loading(filename)
    CSV.foreach(filename) do |row|
        name = row[0].chomp
        student = Student.new(name)
        @studentlist.add(student)
    end
  end

  def load_students
    puts("Enter name of file to read from")
    filename = get_filename
    universal_loading(filename)
    puts()
    puts("STUDENTS LOADED")
    puts()
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
      elsif !name.empty?
        student = Student.new(name)
        @studentlist.add(student)
      end
    end
    puts()
    puts("STUDENT/s ADDED")
    puts()
  end

  def save_students
    puts("Enter name of file to write to")
    filename = get_filename

    CSV.open(filename, "w") do |csv|
      @studentlist.return_list.each do |student|
        csv << [student[:name], student[:cohort]]
      end
    end
    puts()
    puts("STUDENTS SAVED")
    puts()
  end

  def get_filename
    filename = gets.chomp
    if filename == ""
      filename = "students.csv"
    end
    return filename
  end

  def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        @studentlist.show_students
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

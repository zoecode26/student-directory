require 'csv'

$students = []

def print_header
  puts ()
  puts "The students of Villains Academy"
  puts "-------------"
  puts ()
end
def print_students_list
  $students.uniq.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer
  puts()
  puts "Overall, we have #{$students.count} great students"
  puts()
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = STDIN.gets.delete("\n")
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_to_hash(name, :november)
    if $students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{$students.count} students"
    end
    # get another name from the user
    name = STDIN.gets.delete("\n")
  end
  puts()
  puts("STUDENT/s ADDED")
  puts()
end

def universal_loading(filename)
  CSV.foreach(filename) do |row|
      # Each row is an array containing the contents of one line of the file
      # Each item in this array is separated by a \n (hence the use of chomp below)
      name = row[0].chomp
      cohort = row[1]
      add_to_hash(name, cohort)
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

def add_to_hash(name, cohort)
    $students << {name: name, cohort: cohort.to_sym}
    $students = $students.uniq
end

def save_students
  puts("Enter name of file to write to")
  filename = get_filename

  CSV.open(filename, "wb") do |csv|
    $students.each do |student|
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

def try_load_students
  puts()
  filename = ARGV.first # first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    filename = "students.csv"
  end
  if File.exists?(filename) # if it exists
     universal_loading(filename)
     puts "Loaded #{$students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
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

def show_students
  print_header
  print_students_list
  print_footer
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

def interactive_menu
  students = []
  while true do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu

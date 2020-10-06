# let's put all students into an array
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :july},
#   {name: "Nurse Ratched", cohort: :march},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :july},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :july},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :march}
# ]

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

def load_students(filename = "students.csv")
  puts()
  # open the file for reading
  file = File.open(filename, "r")

  # call the readlines function to iterate over each line of the file
  file.readlines.each do |line|
    # parallel assignment
    name, cohort = line.chomp.split(',')
    # put data into hash
    add_to_hash(name, cohort)
  end
  file.close
  puts()
  puts("STUDENTS LOADED")
  puts()
end

def add_to_hash(name, cohort)
    $students << {name: name, cohort: cohort.to_sym}
end

def save_students
  puts("Enter name of file to write to")
  filename = gets.chomp
  if filename == ""
    filename = "students.csv"
  end
  # open the file for writing
  file = File.open(filename, "w")

  #iterate over the array of students
  $students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts()
  puts("STUDENTS SAVED")
  puts()
end

def try_load_students
  puts()
  filename = ARGV.first # first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    filename = "students.csv"
  end
  if File.exists?(filename) # if it exists
    load_students(filename)
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




# EXTRA EXERCISES
# def print_numbered(students)
#   students.each.with_index(1) do |student, index|
#     puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end
#
# def print_certain_letter(students, letter)
#   students.each do |student|
#     if (student[:name])[0].upcase == letter.upcase
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end
#
# def print_less_than_twelve(students)
#   students.each do |student|
#     if student[:name].length < 12
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end
#
# def print_with_until(students)
#   count = 0
#   until count == students.count
#     student = students[count]
#     puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     count += 1
#   end
# end
#
# def input_more_info
#   puts "Please enter the details of the students"
#   # create an empty array
#   students = []
#   # get the first name
#   while true do
#     puts "Enter first name:"
#     firstname = STDIN.gets.chomp
#     if !firstname.empty?
#       break
#     end
#   end
#   # get the surname
#   while true do
#     puts "Enter  surname:"
#     surname = STDIN.gets.chomp
#     if !surname.empty?
#       break
#     end
#   end
#   # get the age
#   while true do
#     puts "Enter age:"
#     age = STDIN.gets.chomp
#     if !age.empty?
#       break
#     end
#   end
#   # get the cohort
#   puts "Enter cohort:"
#   cohort = STDIN.gets.chomp
#   if cohort.empty?
#     cohort = :november
#   else
#     cohort = cohort.to_sym
#   end
#
#   puts "Stop?"
#   stop = STDIN.gets.chomp
#   # while the name is not empty, repeat this code
#   while stop == "no" do
#     # add the student hash to the array
#     students << {firstname: firstname, surname: surname, age: age, cohort: cohort}
#     if students.count == 1
#       puts "Now we have 1 student"
#     else
#       puts "Now we have #{students.count} students"
#     end
#     # STDIN.gets another first name
#     while true do
#       puts "Enter first name:"
#       firstname = STDIN.gets.chomp
#       if !firstname.empty?
#         break
#       end
#     end
#     # STDIN.gets another surname
#     while true do
#       puts "Enter  surname:"
#       surname = STDIN.gets.chomp
#       if !surname.empty?
#         break
#       end
#     end
#     # STDIN.gets another age
#     while true do
#       puts "Enter age:"
#       age = STDIN.gets.chomp
#       if !age.empty?
#         break
#       end
#     end
#     # STDIN.gets another cohort
#     puts "Enter cohort:"
#     cohort = STDIN.gets.chomp
#     if cohort.empty?
#       cohort = :november
#     else
#       cohort = cohort.to_sym
#     end
#
#     puts "Stop?"
#     stop = STDIN.gets.chomp
#     if stop == "yes"
#       students << {firstname: firstname, surname: surname, age: age, cohort: cohort}
#       if students.count == 1
#         puts "Now we have 1 student"
#       else
#         puts "Now we have #{students.count} students"
#       end
#     end
#
#   end
#   # return the array of students
#   students
# end
#
# def print_more_info(students)
#   students.each do |student|
#     puts "First Name: #{student[:firstname]}"
#     puts "Surname: #{student[:surname]}"
#     puts "Age: #{student[:age]}"
#     puts "Cohort: #{student[:cohort]}"
#     puts ""
#   end
# end
#
# def print_centered(students)
#   students.each do |student|
#     puts "#{student[:name]} (#{student[:cohort]} cohort)".center(75)
#   end
# end
#
# def sort_by_cohort(students)
#   sorted_by_cohort = {}
#
#   students.map { |student|
#     cohortname = student[:cohort]
#     if sorted_by_cohort[cohortname] == nil
#       sorted_by_cohort[cohortname] = [student[:name]]
#     else
#       sorted_by_cohort[cohortname].push(student[:name])
#     end
#   }
#
#   sorted_by_cohort.each do |cohort, name|
#     puts "#{cohort}:"
#     puts name
#   end
# end

# nothing happens until we call the methods
# students = input_students
# students = input_more_info
# if students.count > 0
#   print_header
#   print(students)
#   print_footer(students)
# end
# print_more_info(students)
# sort_by_cohort(students)
# print_numbered(students)
# print_certain_letter(students, "m")
# print_less_than_twelve(students)
# print_with_until(students)
# students = input_more_info
# print_more_info(students)
# print_centered(students)

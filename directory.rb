$students = []
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
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_students_list
  $students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer
  puts "Overall, we have #{$students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.delete("\n")
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    $students << {name: name, cohort: :november}
    if $students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{$students.count} students"
    end
    # get another name from the user
    name = gets.delete("\n")
  end
end

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
#     firstname = gets.chomp
#     if !firstname.empty?
#       break
#     end
#   end
#   # get the surname
#   while true do
#     puts "Enter  surname:"
#     surname = gets.chomp
#     if !surname.empty?
#       break
#     end
#   end
#   # get the age
#   while true do
#     puts "Enter age:"
#     age = gets.chomp
#     if !age.empty?
#       break
#     end
#   end
#   # get the cohort
#   puts "Enter cohort:"
#   cohort = gets.chomp
#   if cohort.empty?
#     cohort = :november
#   else
#     cohort = cohort.to_sym
#   end
#
#   puts "Stop?"
#   stop = gets.chomp
#   # while the name is not empty, repeat this code
#   while stop == "no" do
#     # add the student hash to the array
#     students << {firstname: firstname, surname: surname, age: age, cohort: cohort}
#     if students.count == 1
#       puts "Now we have 1 student"
#     else
#       puts "Now we have #{students.count} students"
#     end
#     # gets another first name
#     while true do
#       puts "Enter first name:"
#       firstname = gets.chomp
#       if !firstname.empty?
#         break
#       end
#     end
#     # gets another surname
#     while true do
#       puts "Enter  surname:"
#       surname = gets.chomp
#       if !surname.empty?
#         break
#       end
#     end
#     # gets another age
#     while true do
#       puts "Enter age:"
#       age = gets.chomp
#       if !age.empty?
#         break
#       end
#     end
#     # gets another cohort
#     puts "Enter cohort:"
#     cohort = gets.chomp
#     if cohort.empty?
#       cohort = :november
#     else
#       cohort = cohort.to_sym
#     end
#
#     puts "Stop?"
#     stop = gets.chomp
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
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")

  #iterate over the array of students
  $students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close

end

def load_students
  # open the file for reading
  file = File.open("students.csv", "r")

  # call teh readlines function to iterate over each line of the file
  file.readlines.each do |line|
    # parallel assignment
    name, cohort = line.chomp.split(',')
      # put data into hash
      $students << {name: name, cohort: cohort.to_sym}
    end
  file.close
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
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
  end
end

def interactive_menu
  students = []
  while true do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu

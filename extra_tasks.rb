EXTRA EXERCISES
def print_numbered(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_certain_letter(students, letter)
  students.each do |student|
    if (student[:name])[0].upcase == letter.upcase
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_less_than_twelve(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_with_until(students)
  count = 0
  until count == students.count
    student = students[count]
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    count += 1
  end
end

def input_more_info
  puts "Please enter the details of the students"
  # create an empty array
  students = []
  # get the first name
  while true do
    puts "Enter first name:"
    firstname = STDIN.gets.chomp
    if !firstname.empty?
      break
    end
  end
  # get the surname
  while true do
    puts "Enter  surname:"
    surname = STDIN.gets.chomp
    if !surname.empty?
      break
    end
  end
  # get the age
  while true do
    puts "Enter age:"
    age = STDIN.gets.chomp
    if !age.empty?
      break
    end
  end
  # get the cohort
  puts "Enter cohort:"
  cohort = STDIN.gets.chomp
  if cohort.empty?
    cohort = :november
  else
    cohort = cohort.to_sym
  end

  puts "Stop?"
  stop = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while stop == "no" do
    # add the student hash to the array
    students << {firstname: firstname, surname: surname, age: age, cohort: cohort}
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    # STDIN.gets another first name
    while true do
      puts "Enter first name:"
      firstname = STDIN.gets.chomp
      if !firstname.empty?
        break
      end
    end
    # STDIN.gets another surname
    while true do
      puts "Enter  surname:"
      surname = STDIN.gets.chomp
      if !surname.empty?
        break
      end
    end
    # STDIN.gets another age
    while true do
      puts "Enter age:"
      age = STDIN.gets.chomp
      if !age.empty?
        break
      end
    end
    # STDIN.gets another cohort
    puts "Enter cohort:"
    cohort = STDIN.gets.chomp
    if cohort.empty?
      cohort = :november
    else
      cohort = cohort.to_sym
    end

    puts "Stop?"
    stop = STDIN.gets.chomp
    if stop == "yes"
      students << {firstname: firstname, surname: surname, age: age, cohort: cohort}
      if students.count == 1
        puts "Now we have 1 student"
      else
        puts "Now we have #{students.count} students"
      end
    end

  end
  # return the array of students
  students
end

def print_more_info(students)
  students.each do |student|
    puts "First Name: #{student[:firstname]}"
    puts "Surname: #{student[:surname]}"
    puts "Age: #{student[:age]}"
    puts "Cohort: #{student[:cohort]}"
    puts ""
  end
end

def print_centered(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(75)
  end
end

def sort_by_cohort(students)
  sorted_by_cohort = {}

  students.map { |student|
    cohortname = student[:cohort]
    if sorted_by_cohort[cohortname] == nil
      sorted_by_cohort[cohortname] = [student[:name]]
    else
      sorted_by_cohort[cohortname].push(student[:name])
    end
  }

  sorted_by_cohort.each do |cohort, name|
    puts "#{cohort}:"
    puts name
  end
end

nothing happens until we call the methods
students = input_students
students = input_more_info
if students.count > 0
  print_header
  print(students)
  print_footer(students)
end
print_more_info(students)
sort_by_cohort(students)
print_numbered(students)
print_certain_letter(students, "m")
print_less_than_twelve(students)
print_with_until(students)
students = input_more_info
print_more_info(students)
print_centered(students)

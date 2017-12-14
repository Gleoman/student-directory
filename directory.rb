def input_students
  puts "Please enter the following details in order, hitting return after each entry
  i) name, ii) cohort, iii) hobbies, iv) place of birth, v) height"
  puts "To finish, and/or if you enter a typo and need to begin again,
        just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student has to the array
    cohort = gets.chomp
    hobbies = gets.chomp
    born = gets.chomp
    height = gets.chomp
    students << {name: name, cohort: cohort, hobbies: hobbies, born: born, height: height}
      if students == 1
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} student"
      end
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def sort_by_cohort(students)
  sorted_by_cohort = {}
  students.map do |student|
    cohort = student[:cohort]
    name = student[:name]

      if sorted_by_cohort[cohort] == nil
      sorted_by_cohort[cohort] = [name]
      else
      sorted_by_cohort[cohort].push(name)
      end
    end

    puts "Please enter a cohort to list"
    puts sorted_by_cohort
    sorted_cohort = gets.chomp
    sorted_by_cohort.each do |cohort, name|
      if cohort == sorted_cohort
        puts "#{name.join(", ")}"
      end
  end
end

def print_header
  puts "The students of Villains Academy".center(5)
  puts "-------------".center(5)
end
def print(students)
  while students.count >= 1
    students.each_with_index do |student, i|
        puts "#{i + 1} #{student[:name]} (#{student[:cohort]} cohort)
        hobby: #{ student[:hobbies]}
        place of birth: #{student[:born]}
        height: #{student[:height]}".center(5)
    end
    break
  end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students".center(5)
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
sort_by_cohort(students)

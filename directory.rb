def input_students
  puts "Please enter the following details in order, hitting return after each entry
  i) name, ii) hobbies, iii) place of birth, iv) height"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student has to the array
    hobbies = gets.chomp
    born = gets.chomp
    height = gets.chomp
    students << {name: name, cohort: :november, hobbies: hobbies, born: born, height: height}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  while students.count >= 1
    students.each_with_index do |student, i|
        puts "#{i + 1} #{student[:name]} (#{student[:cohort]} cohort)
        hobby: #{ student[:hobbies]}
        place of birth: #{student[:born]}
        height: #{student[:height]}"
    end
    break
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

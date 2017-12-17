@students = [] # an empty array accessible to all methods

def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" #9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter the following details in order, hitting return after each entry
  i) name, ii) cohort, iii) hobbies, iv) place of birth, v) height"
  puts "To finish, and/or if you enter a typo and need to begin again,
        just hit return twice"
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student has to the array
    cohort = gets.chomp
    hobbies = gets.chomp
    born = gets.chomp
    height = gets.chomp
    @students << {name: name, cohort: cohort, hobbies: hobbies, born: born, height: height}
      if @students == 1
        puts "Now we have #{@students.count} student"
      else
        puts "Now we have #{@students.count} students"
      end
    #get another name from the user
    name = gets.chomp
  end
end

def sort_by_cohort
  sorted_by_cohort = {}
  @students.map do |student|
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

def print_student_list
  while @students.count >= 1
    @students.each do |student|
      if student[:name] == ""
        return
      end
    end

    @students.each_with_index do |student, i|
        puts "#{i + 1} #{student[:name]} (#{student[:cohort]} cohort)
        hobby: #{ student[:hobbies]}
        place of birth: #{student[:born]}
        height: #{student[:height]}".center(5)
        end
    break
  end
end

def print_footer
    puts "Overall, we have #{@students.count} great students".center(5)
end
#nothing happens until we call the methods
interactive_menu
sort_by_cohort

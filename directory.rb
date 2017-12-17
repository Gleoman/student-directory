@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
    when "3"
      save_students
    when "4"
      load_students
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
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student has to the array
    cohort = STDIN.gets.chomp
    hobbies = STDIN.gets.chomp
    born = STDIN.gets.chomp
    height = STDIN.gets.chomp
    @students << {name: name, cohort: cohort, hobbies: hobbies, born: born, height: height}
      if @students == 1
        puts "Now we have #{@students.count} student"
      else
        puts "Now we have #{@students.count} students"
      end
    #get another name from the user
    name = STDIN.gets.chomp
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
    sorted_cohort = STDIN.gets.chomp
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

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
      @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
      end
    file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split (",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else #if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit #quit the program
    end
end
#nothing happens until we call the methods
try_load_students
interactive_menu
sort_by_cohort

class Scrapper
  File.truncate('output.in', 0) # Just clean the file

  def write
    people = File.open('people.in').read
    people.gsub!(/\r\n?/, "\n")

    good_people = []
    people.each_line do |line|
      person = line.split("|")

      if ['vice president', 'whatever'].any? person[3]
        good_people.push(person[0])
      end
    end

     File.write('output.in', good_people.first(100))
  end

  def initialize
    write # Call top method
  end
end

Scrapper.new

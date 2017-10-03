class Student

  attr_accessor :id, :full_name, :original_house, :favorite_character, :birthdate

  def initialize(options_hash)
    @id = options_hash['id']
    @full_name = options_hash['full_name']
    @original_house = options_hash['original_house']
    @favorite_character = options_hash['favorite_character']
    @birthdate = options_hash['birthdate']
  end

  def self.find(id)
    student = Unirest.get("http://localhost:3000/api/v1/students/#{id}").body
    Student.new(student)
  end

  def self.all
    students = []
    api_students = Unirest.get("http://localhost:3000/api/v1/students", headers: {"Authorization" => "Token token=#{'API_KEY'}", "X-User-Email" => "#{'API_EMAIL'}"}).body
    api_students.each do |api_student|
      students << Student.new(api_student)
    end
    students
  end

  def self.create(first_name, last_name, original_house)
    student = Unirest.post("http://localhost:3000/api/v1/students", headers: {"Accept" => "application/json"}, parameters: {first_name:first_name, last_name: last_name, original_house: original_house}).body
    Student.new(student)
  end

  def destroy #we call it on the model, not the class, hence not self.destroy
    Unirest.delete("http://localhost:3000/api/v1/students/#{id}")

  end


end
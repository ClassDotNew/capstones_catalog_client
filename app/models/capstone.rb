class Capstone
  attr_accessor :id, :student_name, :name, :description, :url, :screenshot

  # Student Capstone Catalog Client
  # Display an index of student and capstone names as well as screenshots
  # Display a show page showing the student’s name, the capstone’s name, a long description of the capstone, and a screenshot of the app.

  # Capstone
  #   Name
  #   Description
  #   URL
  #   Screenshot (Optional)

  $base_url = "https://protected-depths-54434.herokuapp.com/api/v1/students/"

  $header = {
    "Accept" => "application/json"
  }


  def initialize(options)
    # initialize a capstone with the following attribute:
    # name = name of the capstone
    # description = description of the capstone
    # url = url link to capstone
    # screenshot = optional, but a url link or binary file
    @id = options[:id]
    @student_name = options[:student_name]
    @name = options[:name]
    @description = options[:description]
    @url = options[:url]
    @screenshot = options[:screenshot] || ""
  end

  def self.find(input_id)
    response_hash = Unirest.get(
      $base_url + "#{input_id}",
      headers: $header
      ).body
    
    capstone = self.new(
      id: response_hash[:id],
      student_name: "#{response_hash["firstName"]} #{response_hash["lastName"]}",
      name: response_hash["capstones"][0]["name"],
      description: response_hash["capstones"][0]["description"],
      url: response_hash["capstones"][0]["url"],
      screenshot: response_hash["capstones"][0]["screenshot"]
      )
  end

  def self.all
    response_hash = Unirest.get(
      $base_url,
      headers: $header
      ).body
    capstones = []

    response_hash.each do |student|
      capstones << self.new(
        id: student["id"],
        student_name: "#{student["firstName"]} #{student["lastName"]}" || "", 
        name: student["capstones"][0].nil? ? "" : student["capstones"][0]["name"],
        description: student["capstones"][0].nil? ? "" : student["capstones"][0]["description"],
        url: student["capstones"][0].nil? ? "" : student["capstones"][0]["url"],
        screenshot: student["capstones"][0].nil? ? "" : student["capstones"][0]["screenshot"],
        )
    end
    capstones
  end

end
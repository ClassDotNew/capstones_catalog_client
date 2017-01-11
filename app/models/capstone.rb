class Capstone
  attr_accessor :id, :name, :description, :url, :screenshot

  # Student Capstone Catalog Client
  # Display an index of student and capstone names as well as screenshots
  # Display a show page showing the student’s name, the capstone’s name, a long description of the capstone, and a screenshot of the app.

  # Capstone
  #   Name
  #   Description
  #   URL
  #   Screenshot (Optional)

  $base_url = "http://localhost:3000/capstones/"
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
    # unknow yet...
    capstone = self.new(
      id: response_hash["id"],
      name: response_hash[:name],
      description: response_hash[:description],
      url: response_hash[:url],
      screenshot: response_hash[:screenshot]
      )
  end

  def self.all
    response_hash = Unirest.get(
      $base_url,
      headers: $header
      ).body
    capstones = []
    # unknown yet...
    response_hash.each do |capstone|
      capstones << self.new(
        id: capstone[:id],
        name: capstone[:name],
        description: capstone[:description],
        url: capstone[:url],
        screenshot: capstone[:screenshot]
        )
    end
  end

end
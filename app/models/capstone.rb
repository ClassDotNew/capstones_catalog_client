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
    @student_name = options[:student_name]
    @name = options[:name]
    @description = options[:description]
    @url = options[:url]
    @screenshot = options[:screenshot] || ""
  end

  def self.find(input_id)
    # response_hash = Unirest.get(
    #   $base_url + "#{input_id}",
    #   headers: $header
    #   ).body
    # # unknow yet...
    p input_id
    response_hash = {
      :id => 1,
      :student_name => "Matthew Califano",
      :name => "DJ Bookings",
      :description => "A website that allows DJs and Venues workout a bidding war, cutting out the middle man.",
      :url => "http://djbookings.matt",
      :screenshot => "https://media.giphy.com/media/l4Jz3a8jO92crUlWM/giphy.gif"
    }
    capstone = self.new(
      id: response_hash[:id],
      student_name: response_hash[:student_name],
      name: response_hash[:name],
      description: response_hash[:description],
      url: response_hash[:url],
      screenshot: response_hash[:screenshot]
      )
  end

  def self.all
    # response_hash = Unirest.get(
    #   $base_url,
    #   headers: $header
    #   ).body
    response_hash = [
     {
       :id => 1,
       :student_name => "Matthew Califano",
       :name => "DJ Bookings",
       :description => "A website that allows DJs and Venues workout a bidding war, cutting out the middle man.",
       :url => "http://djbookings.matt",
       :screenshot => "https://media.giphy.com/media/l4Jz3a8jO92crUlWM/giphy.gif"
     },
     {
       :id => 2,
       :student_name => "Matt Cali",
       :name => "Wedding Bookings",
       :description => "A website that allows users to look and book different wedding options ",
       :url => "http://weddingbooks.matt",
       :screenshot => "https://media.giphy.com/media/145J2js80Afqwg/giphy.gif"
     },
     {
       :id => 3,
       :student_name => "Ray Cheng",
       :name => "Climb On",
       :description => "Climbing journal ",
       :url => "http://climbon.ray",
       :screenshot => "https://media.giphy.com/media/l4Jz3a8jO92crUlWM/giphy.gif"
     },
     {
       :id => 4,
       :student_name => "Raymond Chen",
       :name => "Shoot On",
       :description => "Shows a map of all the different indoor archery ranges in your area",
       :url => "http://climbon.ray",
       :screenshot => "https://media.giphy.com/media/145J2js80Afqwg/giphy.gif"
     },
     {
       :id => 5,
       :student_name => "Brian Rice",
       :name => "Code On",
       :description => "Coding journal  ",
       :url => "http://codeon.brian",
       :screenshot => "https://media.giphy.com/media/l4Jz3a8jO92crUlWM/giphy.gif"
     }
   ]
    capstones = []
    # unknown yet...
    response_hash.each do |capstone|
      capstones << self.new(
        id: capstone[:id],
        student_name: capstone[:student_name],
        name: capstone[:name],
        description: capstone[:description],
        url: capstone[:url],
        screenshot: capstone[:screenshot]
        )
    end
    capstones
  end

end
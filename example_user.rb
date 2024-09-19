class User
  attr_accessor :first_name, :last_name, :email

  def initialize(attributes = {})
    attributes ||= {}
    @first_name = attributes[:first_name] || 'First'
    @last_name = attributes[:last_name] || 'Last'
    @email = attributes[:email] || 'no_email@example.com'
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def alphabetical_name
    "#{@last_name}, #{@first_name}"
  end

  def formatted_email
    "#{full_name} <#{@email}>"
  end
end

user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@example.com')

puts "Full name: #{user.full_name}"
puts "Alphabetical name: #{user.alphabetical_name}"
puts "Formatted email: #{user.formatted_email}"

puts user.full_name.split == user.alphabetical_name.split(', ').reverse

# Other Exercise practice in Rail console

# Block Exercise
# Exe 1
(0..16).each { |i| puts 2**i }

# Exe 2
def yeller(chars)
  chars.map(&:upcase).join
end

puts yeller(['o', 'l', 'd'])

# Exe 3
def random_subdomain
  (0...8).map { ('a'..'z').to_a.sample }.join
end

puts random_subdomain

# Exe 4
def shuffle_string(str)
  str.chars.shuffle.join
end

puts shuffle_string('example')

# Hash and Symbol Exercise
# Exe 1
translations = {
  'one' => 'uno',
  'two' => 'dos',
  'three' => 'tres'
}

translations.each do |key, value|
  puts "'#{key}' in Spanish is '#{value}'"
end

# Exe 2
person1 = {first: 'John', last: 'Doe'}
person2 = {first: 'Jane', last: 'Smith'}
person3 = {first: 'Baby', last: 'Doe'}

params = {
  father: person1,
  mother: person2,
  child: person3
}

puts params[:father][:first]
puts params[:mother][:last]
puts params[:child][:first]

# Exe 3
user_info = {
  name: 'Your Name',
  email: 'your.email@example.com',
  password_digest: ('a'..'z').to_a.sample(16).join
}

puts user_info

# Exe 3
hash1 = {a: 1, b: 2}
hash2 = {b: 3, c: 4}

merged_hash = hash1.merge(hash2)

puts merged_hash

# Constructors Exercise
range_literal = 1..10

range_new = Range.new(1, 10)

puts range_literal == range_new

# Class Exercise
class Word < String
  def palindrome_with_self?
    self == self.reverse
  end

  def palindrome_without_self?
    self == reverse
  end
end

w = Word.new('racecar')
puts "Exer Class 1: #{w.palindrome_with_self?}"
puts "Exer Class 2: #{w.palindrome_without_self?}"

# Modifying built-in classes Exer
# Exer 1
def palindrome?(string)
  string.downcase == string.downcase.reverse
end

puts palindrome?('racecar')
puts palindrome?('onomatopoeia')
puts palindrome?('Malayalam')

# Exer 2
class String
  def shuffle
    self.chars.shuffle.join
  end
end

puts 'hello'.shuffle

# Exer 3
class String
  def shuffle2
    chars.shuffle.join
  end
end

puts 'hello'.shuffle

# Controller Class Exer


# require 'digest'

# email = "lochuynhhsb@gmail.com".downcase

# gravatar_id = Digest::MD5.hexdigest(email)

# puts gravatar_id


# d19d6c67018098f081357e2ba46e7edf






# Note: You must restart bin/webpack-dev-server for changes to take effect

# default: &default
#   source_path: app/javascript
#   source_entry_path: app/javascript
#   public_root_path: public
#   public_output_path: packs
#   cache_path: tmp/cache/webpacker
#   webpack_compile_output: true

#   # Additional paths webpack should lookup modules
#   # ['app/assets', 'engine/foo/app/assets']
#   additional_paths: [app/javascript/packs]

#   # Reload manifest.json on all requests so we reload latest compiled packs
#   cache_manifest: false

#   # Extract and emit a css file
#   extract_css: false

#   static_assets_extensions:
#     - .jpg
#     - .jpeg
#     - .png
#     - .gif
#     - .tiff
#     - .ico
#     - .svg
#     - .eot
#     - .otf
#     - .ttf
#     - .woff
#     - .woff2

#   extensions:
#     - .mjs
#     - .js
#     - .sass
#     - .scss
#     - .css
#     - .module.sass
#     - .module.scss
#     - .module.css
#     - .png
#     - .svg
#     - .gif
#     - .jpeg
#     - .jpg

# development:
#   <<: *default
#   compile: true

#   extract_css: true
#   # Reference: https://webpack.js.org/configuration/dev-server/
#   dev_server:
#     https: false
#     host: localhost
#     port: 3035
#     public: localhost:3035
#     hmr: false
#     # Inline should be set to true if using HMR
#     inline: true
#     overlay: true
#     compress: true
#     disable_host_check: true
#     use_local_ip: false
#     quiet: false
#     pretty: false
#     headers:
#       'Access-Control-Allow-Origin': '*'
#     watch_options:
#       ignored: '**/node_modules/**'


# test:
#   <<: *default
#   compile: true

#   # Compile test packs to a separate directory
#   public_output_path: packs-test

# production:
#   <<: *default

#   # Production depends on precompilation of packs prior to booting for performance.
#   compile: true


#   # Extract and emit a css file
#   extract_css: true

#   # Cache manifest.json for performance
#   cache_manifest: true

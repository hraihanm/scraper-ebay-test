require 'nokogiri'
require 'open-uri'
require 'json'

content = URI.open('https://en.wikipedia.org/wiki/General_relativity')
puts "content:"
puts content.class
puts content
puts

# initialize nokogiri
nokogiri = Nokogiri::HTML(content)

puts "nokogiri:"
puts nokogiri.class
# puts nokogiri
puts

# get the group of listings
listings = nokogiri.css('figure.mw-default-size')

puts "LISTING RESULT:"
puts
# loop through the listings
listings.each do |listing|
    puts listing
    puts
end
puts
puts "END OF LISTINGS"
puts


# loop through the listings
listings.each do |listing|
    # initialize an empty hash
    product = {}
    puts
    puts "### PRODUCT ###"
    puts
    
    # extract the information into the product hash
    item_link = listing.at_css('a')
    product['source'] = "https://en.wikipedia.org" + item_link['href'] unless item_link.nil?
    puts "# product['source']:"
    puts product['source']
    
    # extract the price
    product['caption'] = listing.at_css('figcaption')&.text
    puts "# product['caption']:"
    puts product['caption']
    
    # specify the collection where this record will be stored
    product['_collection'] = "listings"

    # # save the product to the outputs.
    # outputs << product

    # # enqueue more pages to the scrape job
    # pages << {
    #     source: product['source'],
    #     page_type: 'details',
    #     vars: {  # adding vars to this page
    #         caption: product['caption'],
    #         price: product['price']
    #     }
    #   }
end


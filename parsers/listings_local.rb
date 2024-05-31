### LOCAL TESTER HEADER ###

require 'nokogiri'

# Print scraper info
def printer(text, var)
    puts text + ":"
    puts var
    puts var.class
    puts
end

file_path = '/home/hraihanm/Web/Ebay/iPhones for Sale - New & Used iPhones at Great Prices - eBay.html'
content = File.read(file_path)

### END OF LOCAL TESTER HEADER ###

# initialize nokogiri
nokogiri = Nokogiri.HTML(content)

# get the group of listings
listings = nokogiri.css('div.s-item__wrapper')
i = 1

# loop through the listings
listings.each do |listing|
    # initialize an empty hash
    product = {}

    puts
    puts '### ITEM NUMBER ' + i.to_s + ' ###'
    puts
    i+=1
    
    # extract the information into the product hash
    product['title'] = listing.at_css('h3.s-item__title')&.text
    printer("Title", product['title'])
    
    # extract the price
    product['price'] = listing.at_css('.s-item__price')&.text.gsub("IDR", "").gsub(",","")
    printer("Price", product['price'])
    
    # extract the listing URL
    item_link = listing.at_css('a.s-item__link')
    product['url'] = item_link['href'] unless item_link.nil?
    printer("URL", product['url'])

    # specify the collection where this record will be stored
    product['_collection'] = "listings"

    # save the product to the outputs.
    # outputs << product

    # # enqueue more pages to the scrape job
    # pages << {
    #     url: product['url'],
    #     page_type: 'details',
    #     vars: {  # adding vars to this page
    #         title: product['title'],
    #         price: product['price']
    #     }
    #   }
end

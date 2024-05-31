# Initialize nNokogiri
nokogiri = Nokogiri.HTML(content)

# Get the group of listings
listings = nokogiri.css('div.s-item__wrapper')

# Loop through the listings
listings.each do |listing|
    # Initialize an empty hash
    product = {}
    
    # Extract the information into the product hash
    product['title'] = listing.at_css('h3.s-item__title')&.text
    
    # extract the price
    product['price'] = listing.at_css('.s-item__price')&.text.gsub("IDR", "").gsub(",","")
    
    # extract the listing URL
    item_link = listing.at_css('a.s-item__link')
    product['url'] = item_link['href'] unless item_link.nil?

    # specify the collection where this record will be stored
    product['_collection'] = "listings"

    # save the product to the outputs.
    outputs << product

    # enqueue more pages to the scrape job
    pages << {
        url: product['url'],
        page_type: 'details',
        vars: {  # adding vars to this page
            title: product['title'],
            price: product['price']
        }
      }
end

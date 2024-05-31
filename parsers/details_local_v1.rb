### LOCAL TESTER HEADER ###

require 'nokogiri'

# Print scraper info
def printer(text, var)
    puts text + ":"
    puts var
    puts var.class
    puts
end

file_path = '/home/hraihanm/Web/Ebay/NEW IN BOX Apple iPhone 4 16GB A1349 MC937LL_A (Demo Edition) _ RARE _ eBay.html'
content = File.read(file_path)

### END OF LOCAL TESTER HEADER ###

# initialize nokogiri
nokogiri = Nokogiri.HTML(content)

# get the seller username
seller = nokogiri.at_css('h2.d-stores-info-categories__container__info__section__title > a > span')&.text
printer("Seller", seller)

# get the seller's feedback 
feedback = nokogiri.at_css('div.d-stores-info-categories__container__info__section > div:nth-of-type(2) > span:first-child')&.text
printer("feedback", feedback)

# # save it into outputs
# outputs << {
#     _collection: 'products',
#     title: page['vars']['title'],
#     price: page['vars']['price'],
#     seller: seller,
#     feedback: feedback
# }
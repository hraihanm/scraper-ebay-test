# initialize nokogiri
nokogiri = Nokogiri.HTML(content)

# get the seller username
seller = nokogiri.at_css('h2.d-stores-info-categories__container__info__section__title > a > span')&.text

# get the seller's feedback 
feedback = nokogiri.at_css('div.d-stores-info-categories__container__info__section > div:nth-of-type(2) > span:first-child')&.text

# save it into outputs
outputs << {
    _collection: 'products',
    title: page['vars']['title'],
    price: page['vars']['price'],
    seller: seller,
    feedback: feedback
}
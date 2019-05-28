
class BuscaTextPage < SitePrism::Page
  def busc_html
    # opened_sitemap = open("#{CONFIG['url_default']}/sitemap")
    html_document = Nokogiri::HTML(open("#{CONFIG['url_default']}/sitemap"))
    # puts html_document
    arry = []
    html_document.css('div.mapa-do-site a').each { |dados| arry.push(dados['href']) }
    arry.each do |lang|
      puts lang
      puts lang.css('title').text
      # get = HTTParty.get "#{lang}"
      # puts get.code
      # find('body').to eql?('Perfumes')
    end
    # p arry.lengthcls
    # get = HTTParty.get("#{arry[0]}")
    # puts get.code, get.message
    # puts get.code, get.message, get.headers.inspect#,get.body
  end
end

# browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
# browsers.length #=> 5
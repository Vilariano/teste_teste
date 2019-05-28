class GeradorLinkPage < SitePrism::Page
  def gera_link
    links = [
      "https://www.thebeautybox.com.br/"
    ]

    links.each do |dados|
      get = Nokogiri::HTML(open(dados))
      get_body = get.css('body')
      get_body.each do |aaa|
        aaa.text
      end
    end
  end
end

# doc = Nokogiri::XML(open(uri.to_s))
# doc.encoding = 'UTF-8'
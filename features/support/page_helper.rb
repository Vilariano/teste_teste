Dir[File.join(File.dirname(__FILE__), 
  '../pages/*_page.rb')].each { |file| require file }

# Modulos para chamar as classes instanciadas
module Pages
  def retro_fit
    @retro_fit ||= RetroFitTbbPage.new
  end

  def gerador_link
    @gerador_link ||= GeradorLinkPage.new
  end

  def visit_tbb
    @visit_tbb ||= VisitTbbPage.new
  end
end

xml = Builder::XmlMarkup.new(:indent =>2)
xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.artworkinfo do
  @pics.each do |pic|
    xml.albuminfo do
      xml.artLocation("#{pic.uploaded_data.url}")
      xml.artist()
      xml.albumName("#{@latest_issue.title if @latest_issue}")
      xml.artistLik("#{pic.link}")
      if @latest_issue
        xml.albumLink("/home/teaser/#{@latest_issue.id}")
      else
        xml.albumLink("/home/teaser")
      end
    end
  end
end
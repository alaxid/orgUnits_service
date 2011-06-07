xml.record(:title => "Organ") do
  xml.text(@organs.organ_name, :title => "Name")
  @location = @organs.building
  @kind = "building"
  if @organs.space != nil then
      @location = @location+" "+@organs.space
    @kind = "room"
  end
  if @location != nil then
  xml.entity(@location, :title => "Office Location", :kind => @kind)
  end
  if @organs.president != nil then
    xml.entity(@organs.president, :title => "President", :kind => "person")
  else
    xml.entity(@organs.subdirector, :title => "Subdirector", :kind => "person")
  end
  xml.text(@organs.mail, :title => "Mail")
  xml.email(@organs.email)
  xml.text(@organs.telephone, :title => "Telephone")
  if @organs.extension != nil then
    xml.text(@organs.extension, :title => "Extension")
  end
  xml.text(@organs.fax, :title => "Fax")
  xml.text(:title => "Secretariat") do
    @secretary.each do |ele|
      xml.text(:title => "Secretary") do
        xml.entity(ele.secretary_name, :title => "Name", :kind => "person")
        if ele.email != nil then
          xml.email(ele.email, :title => "Emails")
        end
      end
    end
  end

end
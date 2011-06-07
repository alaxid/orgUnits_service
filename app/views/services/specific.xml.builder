xml.record(:title => "Service") do
  xml.text(@services.service_name, :title => "Name")
  @location = @services.building
  @kind = "building"
  if @services.space != nil then
      @location = @location+" "+@services.space
    @kind = "room"
  end
  if @location != nil then
  xml.entity(@location, :title => "Office Location", :kind => @kind)
  end
  if @services.coordenator != nil then
    xml.text(@services.coordenator, :title => "Coordenator")
  end
  if @services.mail != nil then
    xml.text(@services.mail, :title => "Mail")
  end
  if @services.email != nil then
    xml.email(@services.email)
  end
  if @services.telephone != nil then
    xml.text(@services.telephone, :title => "Telephone")
  end
  if @services.extension != nil then
    xml.text(@services.extension, :title => "Extension")
  end
  if @services.fax != nil then
    xml.text(@services.fax, :title => "Fax")
  end
  @sections.each do |section|
    xml.link(section.section_name, :href => "http://localhost:3003/sections/"+section.id.to_s)
  end
end
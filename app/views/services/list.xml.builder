xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => "Services", :start => @start, :end => @end, :next => @next) do
  @services.each do |service|
    xml.item(service.service_name, :title => "Service", :href => @address+"/services/"+service.id.to_s)
  end
end
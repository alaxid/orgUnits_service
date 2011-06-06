xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => "Department", :start => @start, :end => @end, :next => @next) do
  @departments.each do |department|
    xml.item(department.department_name, :title => "Department", :href => @address+"/departments/"+department.id.to_s)
  end
end
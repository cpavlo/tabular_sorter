TestResource.delete_all
names = %w(fusce lobortis purus volutpat turpis morbi nisi luctus porttitor augue quis fringilla pellentesque amet feugiat lacus proin vulputate nisl iaculis)
kinds = %w(maecenas eget diam cursus tempus nibh quisque hendrerit vitae orci eleifend dolor interdum praesent ante)

20.times do |i|
  TestResource.create(name: names[i % names.length], age: rand(100), kind: kinds[i % kinds.length])
end

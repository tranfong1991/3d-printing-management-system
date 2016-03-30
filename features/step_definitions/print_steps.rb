Given /the following prints eist/ do |table|
  table.hashes.each do |student|
    Students.create!(student)
  end
end

Given /the following prints eist/ do |prints_table|
  prints_table.hashes.each do |prints|
    Prints.create!(prints)
  end
end

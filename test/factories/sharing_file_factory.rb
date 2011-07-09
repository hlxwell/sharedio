Factory.define :sharing_file do |f|
  f.folder "movie"
  f.file File.open(File.join(Rails.root, "test", "fixtures", "test_file.txt"))
end
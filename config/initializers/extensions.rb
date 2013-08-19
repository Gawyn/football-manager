Dir["#{Rails.root}/lib/modules/*.rb"].each {|x| require x}
Dir["#{Rails.root}/lib/extensions/*.rb"].each {|x| require x}

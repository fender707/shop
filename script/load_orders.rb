Order.transaction do
  (1..100).each do |i|
    Order.create( :name => "customer #{i}", :address => "#{i} Main Street")
  end
end

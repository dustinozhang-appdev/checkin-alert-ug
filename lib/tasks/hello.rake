task({:howdy => :environment}) do
  p "Hello"
  p "World!"

  p Flight.count
end
namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    u = User.new
    u.email = "alice@example.com"
    u.password = "password"
    u.phone_number = "1234567890"
    u.save

    f = Flight.new
    f.departs_at = 24.hours.from_now
    f.user_id = u.id
    f.locator = "PNX123"
    f.description = "10 minutes before cutoff"
    f.save
  end
end

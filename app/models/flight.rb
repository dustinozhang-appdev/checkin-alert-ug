# == Schema Information
#
# Table name: flights
#
#  id           :integer          not null, primary key
#  airline      :string
#  departs_at   :datetime
#  description  :string
#  locator      :string
#  message_sent :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

class Flight < ApplicationRecord
end

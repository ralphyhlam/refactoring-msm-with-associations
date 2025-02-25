# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  validates(:director_id, presence: true)
  validates(:title, uniqueness: true)
  belongs_to(:director, class_name: "Director", foreign_key: "director_id", primary_key: "id")
  has_many(:cast, class_name: "Actor", foreign_key: "id", primary_key: "id")
end

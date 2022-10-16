# == Schema Information
#
# Table name: learning_units
#
#  id          :bigint           not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#
class LearningUnit < ApplicationRecord
  has_many :resources
  has_many :curriculum_affiliations
  has_many :curriculums, through: :curriculum_affiliations
  has_many :completed_learning_units

  validates :name, presence: true
end

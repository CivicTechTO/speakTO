class Deputation < ApplicationRecord
  has_many :keywords
  has_many :concepts
end
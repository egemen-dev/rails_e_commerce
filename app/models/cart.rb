# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end

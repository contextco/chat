# frozen_string_literal: true

class Chat < ApplicationRecord
  has_one :first_message, -> { order(created_at: :asc) }, class_name: 'Message'
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
  has_many :documents, through: :messages
  belongs_to :user

  accepts_nested_attributes_for :messages

  def salient_message
    return first_message if first_message&.content.present?

    messages.user_role.first
  end
end

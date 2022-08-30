module Questionable
  extend ActiveSupport::Concern

  included do
    has_one :votation_type, as: :questionable, dependent: :destroy
    accepts_nested_attributes_for :votation_type
    delegate :max_votes, :multiple?, :vote_type, to: :votation_type, allow_nil: true
  end

  def unique?
    votation_type.nil? || votation_type.unique?
  end
end

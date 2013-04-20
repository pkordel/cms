class Article < ActiveRecord::Base
  hstore_accessor :metadata, :tag, :pronunciation, :etymology, :alternative_form

  def hstore_keys
    self.class.hstore_keys
  end

  state_machine initial: :draft_in_progress do

    state :published do
      validates :headword, presence: true
    end

    event :submit do
      transition :draft_in_progress => :pending_review
    end

    event :withdraw do
      transition :pending_review => :draft_in_progress
    end

    event :approve do
      transition :pending_review => :published
    end

    event :reject do
      transition :pending_review => :rejected
    end
  end

  def title
    title = "#{headword}"
    title << " - #{clarification}" if clarification.present?
    title
  end
end

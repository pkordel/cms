class Article < ActiveRecord::Base
  hstore_accessor :metadata, :tag, :pronunciation, :etymology, :alternative_form

  belongs_to :user

  def hstore_keys
    self.class.hstore_keys
  end

  scope :published, -> { Article.with_state(:published).order('updated_at desc') }

  state_machine initial: :draft_in_progress do

    event :submit do
      transition :draft_in_progress => :pending_review
    end

    event :withdraw do
      transition :pending_review => :draft_in_progress
    end

    event :approve do
      transition :pending_review => :published
    end

    event :publish do
      transition [:draft_in_progress, :pending_review] => :published
    end

    event :reject do
      transition :pending_review => :rejected
    end
  end

end

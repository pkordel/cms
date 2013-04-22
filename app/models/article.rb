class Article < ActiveRecord::Base
  hstore_accessor :metadata, :tags, :pronunciation, :etymology, :alternative_form

  belongs_to :creator, class_name: 'User'
  belongs_to :taxonomy

  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships, source: :user

  def hstore_keys
    self.class.hstore_keys
  end

  scope :draft,             -> { with_state(:draft) }
  scope :draft_in_progress, -> { with_state(:draft_in_progress) }
  scope :pending_review,    -> { with_state(:pending_review) }
  scope :published,         -> { with_state(:published) }
  scope :recent,            -> { order('updated_at desc') }

  state_machine initial: :draft do

    event :save_as_draft do
      transition [:draft, :published, :pending_review] => :draft_in_progress
    end

    event :submit do
      transition [:draft, :draft_in_progress] => :pending_review
    end

    event :withdraw do
      transition :pending_review => :draft_in_progress
    end

    event :approve do
      transition :pending_review => :published
    end

    event :publish do
      transition [:draft, :draft_in_progress, :pending_review] => :published
    end

    event :reject do
      transition :pending_review => :rejected
    end
  end

end

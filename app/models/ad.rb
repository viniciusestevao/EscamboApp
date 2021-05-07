class Ad < ApplicationRecord
  #Contants
  QTDE_PER_PAGE = 6
  
  #RatyRate Gem
  ratyrate_rateable 'quality'

  #Callbacks
  before_save :md_to_html

  #Associoations
  belongs_to :member
  belongs_to :category, counter_cache: true
  has_many :comments

  #Validates
  validates :title, :description_md, :description_short, :category, :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}

  #Paperclip
  has_attached_file :picture, styles: { large: "800x300#", medium: "264x150#", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  #Scopes
  scope :descending_order, ->(page) { order(created_at: :desc).page(page).per(QTDE_PER_PAGE) }
  scope :to_the, ->(member = 1) { where(member: member) }
  scope :by_category, ->(id = 1, page) { where(category: id).page(page).per(QTDE_PER_PAGE) }
  scope :search, ->(term, page) { where("lower(title) LIKE ?", "%#{term.downcase}%").page(page).per(QTDE_PER_PAGE) }

  scope :random, ->(qtde = 1) { limit(qtde).order("RANDOM()") }
  
  # Gem money-rails
  monetize :price_cents

  def second
    self[1]
  end

  def third
    self[2]
  end

private

  def md_to_html
    options = {
        filter_html: true,
        link_attributes: {
        rel: "nofollow",
        target: "_blank"
        }
    }

    extensions = {
    space_after_headers: true,
    autolink: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    self.description = markdown.render(self.description_md)
  end
end

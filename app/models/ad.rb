class Ad < ActiveRecord::Base
  belongs_to :brands
  belongs_to :types
  belongs_to :user
  has_one :ad_description, :dependent => :destroy
  has_one :ad_extra, :dependent => :destroy
  has_one :ad_image, :dependent => :destroy
  
  accepts_nested_attributes_for :ad_description
  accepts_nested_attributes_for :ad_extra, allow_destroy: true

  #validates_associated :user
  
  validates :title, presence: {:message => "Tytuł nie może być pusty."}, length: { maximum: 100, :message => "Tytuł nie może być dłuższy niż 100 znaków."} 
  validates :brand_id, presence: {:message => "Marka nie może być pusta."}
  #type dodaj
  validates :production_year, presence: {:message => "Rok produkcji nie może być pusty."}
  validates :exterior_type, presence: {:message => "Musisz wybrać typ nadwozia."}  
  validates :price, presence: {:message => "Musisz podać cenę."}, :numericality => {:message => "Cena - dozwolone tylko liczby."}
  validates :phone, presence: {:message => "Musisz podać numer telefonu."}
  validates :km, :numericality => { :greater_than_or_equal_to => 0, allow_blank: true, :message => "Przebieg - dozwolone tylko liczby."}  
  validates :power, :numericality => { :greater_than => 0, allow_blank: true, :message => "Moc - dozwolone tylko liczby."}
  validates :engine_size, :numericality => { :greater_than => 0, allow_blank: true, :message => "Pojemność - dozwolone tylko liczby."}  
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: {:message => "Musisz podać adres email."},  
                     format: { with: VALID_EMAIL_REGEX, :message => "Adres email nie jest poprawny" },
                     uniqueness: { case_sensitive: false }
end

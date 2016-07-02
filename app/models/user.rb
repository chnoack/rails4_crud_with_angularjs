class User < ActiveRecord::Base
  validates :first_name, :last_name, :email,  presence: true
  validates :last_name, length: { minimum: 2 }

  has_many :addresses, :dependent => :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: :all_blank

  def as_json(options={})
    super(:include => [:addresses])
  end

  def self.required_attribute?(attribute)
   self.validators_on(attribute).map(&:class).include?(ActiveRecord::Validations::PresenceValidator)
  end

  def name
    [self.try(:last_name), self.try(:first_name)].join(', ')
  end

end

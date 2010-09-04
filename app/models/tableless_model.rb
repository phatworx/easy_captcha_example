class TablelessModel
  include EasyCaptcha::ModelHelpers
  include ActiveModel::Conversion
  include ActiveModel::Serialization
  include ActiveModel::MassAssignmentSecurity
  include ActiveModel::Validations
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  extend ActiveModel::Callbacks

  def initialize(attributes = {})
    Rails.logger.debug attributes
    self.attributes=(attributes)
  end
  
  def attributes=(values)
    sanitize_for_mass_assignment(values).each do |k, v|
      send("#{k}=", v)
    end
  end
  
  def persisted?
    false
  end
  
  acts_as_easy_captcha
  validate :valid_captcha?
  
  attr_accessor :captcha
end
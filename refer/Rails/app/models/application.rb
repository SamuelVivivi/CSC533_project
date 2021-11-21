class Application < ApplicationRecord
  belongs_to :applicant
  belongs_to :property
end

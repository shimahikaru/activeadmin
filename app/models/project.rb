class Project < ApplicationRecord
  belongs_to :user
  has_many :project_status_logs
end

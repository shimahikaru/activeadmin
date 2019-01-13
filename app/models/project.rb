class Project < ApplicationRecord
  belongs_to :user
  has_many :project_status_logs

after_create :create_first_status_log

private

  def create_first_status_log
    binding.pry
    ::ProjectStatusLog.create!(project_id: id, status: ::ProjectStatusLog.status[:first_create])
  end
end

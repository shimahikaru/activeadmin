class Project < ApplicationRecord
  belongs_to :admin_user
  has_many :projecty_status_logs
  has_many :project_images

after_create :create_first_status_log


  def progress
    ::ProjectyStatusLog.new(project_id: id).progress(status.status)
  end

  def status
    projecty_status_logs.order(id: :asc).last
  end


  def open?
    projecty_status_logs.last.open?
  end

private

  def create_first_status_log
    binding.pry
    ::ProjectyStatusLog.create!(project_id: id, status: ::ProjectyStatusLog.statuses[:first_create])
  end
end

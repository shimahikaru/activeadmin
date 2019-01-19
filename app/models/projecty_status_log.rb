class ProjectyStatusLog < ApplicationRecord
  belongs_to :project

  enum status: {
    first_create: 0,
    project_open: 5,
  }


  def open?
    project_open?
  end

  def progress(status)
   next_status = case status
      when "first_create"
        ::ProjectyStatusLog.statuses[:project_open]
      when "project_open"
        ::ProjectyStatusLog.statuses[:project_view]
    end
    self.status = next_status
    save
  end

end

class Job < ActiveRecord::Base
  belongs_to :department
  
  validates_presence_of :job_name,:job_name_en,:department_id
  
  # job_type [["社会招聘",0], ["校园招聘",1],["实习生计划",99]]
  scope :published, where(:is_published => true)
  
  scope :in_department, lambda {|department_id|
    { :include=> [:department],:conditions => ["jobs.department_id in (?)", department_id] }
  }
  
  scope :in_job_type, lambda {|job_type|
    { :conditions => ["jobs.job_type in (?)", job_type] }
  }
  
  scope :like_job_name, lambda {|job_name|
    { :conditions => ["jobs.job_name like ? or jobs.job_name_en like ?", "%#{job_name}%", "%#{job_name}%"] }
  }
end

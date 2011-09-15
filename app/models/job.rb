class Job < ActiveRecord::Base
  belongs_to :department
  
  validates_presence_of :job_name,:job_name_en,:department_id
end

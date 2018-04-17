class Point < ApplicationRecord
  belongs_to :user, optional: true
  scope :waiting_monitor, -> {where(student_verify: true, monitor_verify: false, teacher_verify: false) }
  scope :waiting_teacher, -> {where student_verify: true, monitor_verify: true, teacher_verify: false}
end

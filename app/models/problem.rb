# == Schema Information
#
# Table name: problems
#
#  id                 :integer          not null, primary key
#  exploration_id     :integer
#  problem_one        :text
#  problem_two        :text
#  problem_three      :text
#  created_at         :datetime
#  updated_at         :datetime
#  time_to_take       :integer
#  intro_message      :string(255)
#  intro_video_id     :string(255)
#  first_topic        :string(255)
#  first_topic_q1     :text
#  first_topic_q2     :text
#  first_topic_q3     :text
#  second_topic       :string(255)
#  second_topic_q1    :text
#  second_topic_q2    :text
#  second_topic_q3    :text
#  third_topic        :string(255)
#  third_topic_q1     :text
#  third_topic_q2     :text
#  third_topic_q3     :text
#  project_background :text
#

class Problem < ActiveRecord::Base
  belongs_to :exploration
end

class AddTaskAnalysisToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :task_analysis, :text
  end
end

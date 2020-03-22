class Task < ApplicationRecord
  enum kind: [:individual, :work, :others]  

  scope :incoming,  -> { where('start_at > ?', Time.zone.now) }
  # finishedカラムをtrueに更新するメソッドを定義
  def update_finished_true
    self.finished = true if self.finished == false
    self.save
  end

end

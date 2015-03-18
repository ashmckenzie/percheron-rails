class EmailTest < ActiveRecord::Base

  after_create :enqueue_job

  private

    def enqueue_job
      EmailTestJob.perform_later(self)
    end
end

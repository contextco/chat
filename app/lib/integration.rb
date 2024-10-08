# frozen_string_literal: true

class Integration
  include ActiveModel::Model

  INFO = {
    google_docs: {
      backfill_job: Sync::GoogleDocsJob
    },
    gmail: {
      backfill_job: Sync::GmailMessagesJob
    }
  }.freeze

  attr_accessor :key, :backfill_job

  def backfill!(user)
    backfill_job.perform_later(user)
  end

  class << self
    def from_key!(key)
      info = INFO[key.to_sym]
      raise ArgumentError, "Unknown integration key: #{key}" unless info

      new(**info.merge(key:))
    end

    def from_backfill_job(job)
      info = INFO.find { |_, v| v[:backfill_job] == job }
      raise ArgumentError, "Unknown backfill job: #{job}" unless info

      new(**info.second.merge(key: info.first))
    end
  end
end

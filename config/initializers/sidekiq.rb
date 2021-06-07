# frozen_string_literal: true

require "sidekiq/web"
require "sidekiq-scheduler"
require "sidekiq-scheduler/web"

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("SIDEKIQ_URL") }

  config.on(:startup) do
    SidekiqScheduler::Scheduler.instance.rufus_scheduler_options = { max_work_threads: 1 }
    Sidekiq.schedule = YAML.load_file(File.expand_path("../sidekiq_scheduler.yml", __dir__))
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("SIDEKIQ_URL") }
end

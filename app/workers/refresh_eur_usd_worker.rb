class RefreshEurUsdWorker
  include Sidekiq::Worker

  def perform
    rate = FindRateQuery.new(name: "EUR-USD").call

    Fixer::RefreshRate.new(rate: rate).call
  end
end

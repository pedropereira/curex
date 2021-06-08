rate = Rate.create!(name: "EUR-USD")

RefreshEurUsdWorker.new.perform

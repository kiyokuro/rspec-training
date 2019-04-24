require 'spec_helper'

RSpec.describe WeatherBot do
  describe '#notify_forecast' do
    let(:weather_bot) { WeatherBot.new }

    it 'エラーなく予報を通知すること' do
      expect { weather_bot.notify_forecast }.not_to raise_error
    end
  end
end

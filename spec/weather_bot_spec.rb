require 'spec_helper'

RSpec.describe WeatherBot do
  describe '#notify_forecast' do
    let(:weather_bot) { WeatherBot.new }
    let(:slack_client_mock) { double('Slack clinet') }

    before do
      allow(weather_bot).to receive(:slack_client).and_return(slack_client_mock)
    end

    it 'エラーなく予報を通知すること' do
      expect(slack_client_mock).to receive(:ping)
      expect { weather_bot.notify_forecast }.not_to raise_error
    end
  end
end

require 'spec_helper'

RSpec.describe WeatherBot do
  describe '#notify_forecast' do
    let(:weather_bot) { WeatherBot.new }
    let(:slack_client_mock) { double('Slack clinet') }

    before do
      allow(weather_bot).to receive(:slack_client).and_return(slack_client_mock)
    end

    context "エラーが発生しなかった時" do
      it 'エラーなく予報を通知すること' do
        expect(slack_client_mock).to receive(:ping).with('明日は晴れです☀️')
        expect { weather_bot.notify_forecast }.not_to raise_error
      end
    end

    context "エラーが発生した時" do
      before { allow(slack_client_mock).to receive(:ping).and_raise('エラーが発生しました') }

      it 'エラーを通知すること' do
        expect(weather_bot).to receive(:notify_error)
        weather_bot.notify_forecast
      end
    end
  end
end

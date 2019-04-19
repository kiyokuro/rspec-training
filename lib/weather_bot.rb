require 'slack-notifier'
require 'yaml'
require 'pry'

class WeatherBot
  # /config/slack.ymlを作ってwebhock_urlをキーにしてurlを追加する
  # webhock_url: ***
  WEBHOCK_URL = YAML.load_file('config/slack.yml')['webhock_url']

  def notify_forecast
    slack_client.ping('明日は晴れです☀️')
  end

  def slack_client
    Slack::Notifier.new(WEBHOCK_URL)
  end
end

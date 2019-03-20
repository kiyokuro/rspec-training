require "spec_helper"

RSpec.describe User do
  describe "#greet" do
    subject { user.greet }

    let(:user) { User.new(name: "たろう", age: age) }

    context "12歳以下の場合" do
      let(:age) { 12 }

      it { is_expected.to eq "ぼくはたろうだよ。" }
    end

    context "13歳以上の場合" do
      let(:age) { 13 }

      it { is_expected.to eq "僕はたろうです。" }
    end
  end
end

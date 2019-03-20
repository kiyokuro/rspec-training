require "spec_helper"

RSpec.describe User do
  shared_context "12歳の場合" do
    let(:age) { 12 }
  end

  shared_context "13歳の場合" do
    let(:age) { 13 }
  end

  describe "#greet" do
    subject { user.greet }

    let(:user) { User.new(name: "たろう", age: age) }

    shared_examples "子どものあいさつ" do
      it { is_expected.to eq "ぼくはたろうだよ。" }
    end

    shared_examples "大人のあいさつ" do
      it { is_expected.to eq "僕はたろうです。" }
    end

    context "0歳の場合" do
      let(:age) { 0 }

      it_behaves_like "子どものあいさつ"
    end

    context "12歳の場合" do
      include_context "12歳の場合"

      it_behaves_like "子どものあいさつ"
    end

    context "13歳の場合" do
      include_context "13歳の場合"

      it_behaves_like "大人のあいさつ"
    end

    context "100歳の場合" do
      let(:age) { 100 }

      it_behaves_like "大人のあいさつ"
    end
  end

  describe "#child?" do
    subject { user.child? }

    let(:user) { User.new(name: "たろう", age: age) }

    context "12歳以下の場合" do
      include_context "12歳の場合"

      it { is_expected.to eq true }
    end

    context "13歳以上の場合" do
      include_context "13歳の場合"

      it { is_expected.to eq false }
    end
  end
end

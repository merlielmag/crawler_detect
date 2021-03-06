# frozen_string_literal: true

RSpec.describe CrawlerDetect do
  subject { described_class }

  describe ".new" do
    subject { described_class.new("something") }

    it { is_expected.to be_an_instance_of(CrawlerDetect::Detector) }
  end

  describe ".is_crawler?" do
    subject { described_class.is_crawler?(user_agent) }

    let(:user_agent) { "something" }

    it { is_expected.to be(true).or be(false) }

    context "empty header" do
      let(:user_agent) { nil }

      it { is_expected.to be(false) }
    end
  end
end

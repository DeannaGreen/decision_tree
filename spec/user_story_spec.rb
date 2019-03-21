require 'user_story'

describe UserStory do
  it { is_expected.to respond_to(:create_domain_model) }

  describe "#feature_test" do
    it "raises error if there is no domain model when trying to create a feature test" do
      expect { subject.feature_test }.to raise_error 'No domain model created'
    end

    it "creates feature tests" do
      subject.create_domain_model
      expect(subject.feature_test).to eq true
    end
  end

  describe "#unit_test" do
    it "raises error if feature tests have not been created before creating unit tests" do
      expect { subject.unit_test }.to raise_error 'No feature tests created'
    end

    it "creates unit tests" do
      subject.create_domain_model
      subject.feature_test
      expect(subject.unit_test).to eq true
    end
  end

  describe "#run_rspec" do
    it "raises error if unit tests have not been written" do
      expect {subject.run_rspec}.to raise_error 'Unit tests have not been written'
    end

    it 'fails rspec if code has not been written' do
      subject.create_domain_model
      subject.feature_test
      subject.unit_test
      expect(subject.run_rspec).to eq "Red"
    end

    it 'makes rspec pass once code is written' do
      subject.create_domain_model
      subject.feature_test
      subject.unit_test
      subject.write_code
      expect(subject.rspec).to eq "Green"
    end
  end

  describe "#write_code" do
    it "raises error if unit tests have not been created before writing code" do
      expect { subject.write_code }.to raise_error 'No unit tests created'
    end

    it "can write code once unit tests are created" do
      subject.create_domain_model
      subject.feature_test
      subject.unit_test
      expect(subject.write_code).to eq true
    end
  end

  describe "#refactoring_code" do
    it "raises an error refactoring code if no code has been written" do
      expect { subject.refactor_code }.to raise_error 'No code has been written'
    end

    it "can refactor code" do
      subject.create_domain_model
      subject.feature_test
      subject.unit_test
      subject.write_code
      expect(subject.refactor_code).to eq true
    end
  end

  describe "#commit" do
    it "raises an error trying to implement if code has not been refactored" do
      expect { subject.commit }.to raise_error 'Code has not been refactored'
    end

    it "can commit a feature" do
      subject.create_domain_model
      subject.feature_test
      subject.unit_test
      subject.write_code
      subject.refactor_code
      expect(subject.commit).to eq "Feature committed!"
    end
  end
end

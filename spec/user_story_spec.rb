require 'user_story'

describe UserStory do
  it { is_expected.to respond_to(:create_objects_messages) }

  it "raises error if there are no objects & messages when trying to create a feature test" do
    expect { subject.feature_test }.to raise_error 'No objects & messages created'
  end

  it "creates feature tests" do
    subject.create_objects_messages
    expect(subject.feature_test).to eq true
  end

  it "raises error if feature tests have not been created before creating unit tests" do
    expect { subject.unit_test }.to raise_error 'No feature tests created'
  end

  it 'fails initial unit test becuase code is not written' do
    subject.create_objects_messages
    subject.feature_test
    expect(subject.unit_test).to eq true
  end

  it "raises error if unit tests have not been written" do
    expect {subject.run_rspec}.to raise_error 'Unit tests have not been written'
  end

  it 'fails rspec if code has not been written' do
    subject.create_objects_messages
    subject.feature_test
    subject.unit_test
    expect(subject.run_rspec).to eq "Red"
  end

  it "raises error if unit tests have not been created before writing code" do
    expect { subject.write_code }.to raise_error 'No unit tests created'
  end

  it 'makes rspec pass once code is written' do
    subject.create_objects_messages
    subject.feature_test
    subject.unit_test
    subject.write_code
    expect(subject.rspec).to eq "Green"
  end

  it "raises an error refactoring code if no code has been written" do
    expect { subject.refactor_code }.to raise_error 'No code has been written'
  end

  it "raises an error trying to implement if code has not been refactored" do
    expect { subject.implement }.to raise_error 'Code has not been refactored'
  end
end

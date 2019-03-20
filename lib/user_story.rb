class UserStory
  attr_reader :objects_messages, :rspec

  def initialize
    @rspec = "Red"
  end

  def create_objects_messages
    @objects_messages = true
  end

  def feature_test
    fail 'No objects & messages created' unless @objects_messages
    @feature_test = true
  end

  def unit_test
    fail 'No feature tests created' unless @feature_test
    @unit_test = true
  end

  def run_rspec
    fail 'Unit tests have not been written' unless @unit_test
    @rspec
  end

  def write_code
    fail 'No unit tests created' unless @unit_test
    @write_code = true
    @rspec = "Green"
    return @write_code
  end

  def refactor_code
    fail 'No code has been written' unless @write_code
    @refactor_code = true
  end

  def implement
    fail 'Code has not been refactored' unless @refactor_code
    'Feature implemented!'
  end
end

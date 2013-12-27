dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift File.join(dir, 'lib')

require 'puppet'
require 'rspec-puppet'
#require 'spec/autorun'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))
RSpec.configure do |config|
    config.module_path = File.join(fixture_path, 'modules')
    config.manifest_dir = File.join(fixture_path, 'manifests')
end

# We need this because the RAL uses 'should' as a method.  This
# allows us the same behaviour but with a different method name.
#class Object
#    alias :must :should
#end

$: << File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'spec'

require 'request_log_analyzer'

module RequestLogAnalyzerSpecHelper
  
  def log_fixture(name)
    File.dirname(__FILE__) + "/fixtures/#{name}.log"
  end
  
end

module TestFileFormat
  
  module Summarizer
    def self.included(base)
      # monkey patching for summarizer here :-)
    end
  end
  
  module LogParser
    def self.included(base)
      # monkey patching for log parser here :-)
    end
  end
  
  LINE_DEFINITIONS = {
    :first => {
      :header => true,
      :teaser => /processing /,
      :regexp => /processing request (\d+)/,
      :captures => [{:request_no => :integer}]    
    },
    :test => {
      :teaser => /testing /,
      :regexp => /testing is (\w+)/,
      :captures => [{:test_capture => :string}]
    }, 
    :last => {
      :footer => true,
      :teaser => /finishing /,
      :regexp => /finishing request (\d+)/,
      :captures => [{:request_no => :integer}]
    }
  }
end
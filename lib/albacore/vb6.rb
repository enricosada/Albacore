require 'albacore/albacoretask'

class Vb6
  include Albacore::Task
  include Albacore::RunCommand
  
  attr_accessor :project

  def execute
    params = []
    params << "/make #{project}"

    @command = "VB6.exe"

    result = run_command "VB6", params
    
    failure_message = 'VB6 Failed. See Build Log For Detail'
    fail_with_message failure_message if !result
  end
  
end

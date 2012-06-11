require 'spec_helper'
require 'albacore/sqlcmd'

#
#    vb6_exe = "C:/Programmi/Microsoft Visual Studio/VB98/vb6.exe"
#    
#    batch_prj_dir = "src/Almaviva.WeFis/Batch/#{name}/" 
#    vbp = File.basename Dir[batch_prj_dir + '*.vbp'].first    
#    log_file = "#{vbp}.vb6build.log"
#
#    options = {
#      'make' => vbp,
#      'out'  => log_file,
#      'outdir' => '"' + File.expand_path(batch_prj_dir + 'bin').windows_path + '"'
#    }
#
#    Dir.chdir batch_prj_dir do
#      sh %Q("#{vb6_exe}") + ' ' + options.map {|k,v| "/"+k+" "+v}.join(' ')
#      File.open(log_file, 'r') { |f| puts f.read }
#    end
#

describe Vb6, "when running a script the easy way" do
  before :all do
    @cmd = Vb6.new
    @cmd.extend(SystemPatch)
  end

  it "should contain make argument" do
    @cmd.project = "gran.vbp"
    @cmd.disable_system = true
    
    @cmd.execute

    @cmd.system_command.should include('/make gran.vbp')
  end
end
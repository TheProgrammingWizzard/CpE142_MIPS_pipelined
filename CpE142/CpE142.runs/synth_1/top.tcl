# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7s50csga324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.cache/wt [current_project]
set_property parent.project_path C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths c:/Users/admin/Documents/projects/CPE142_nonpipe/CPE142_nonpipe.srcs/sources_1/new [current_project]
set_property ip_output_repo c:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/ALU.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/ALUControl.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/BranchAdder.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/Control.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/DataMemory.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/IDEX.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/IFID.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/InstructionMemory.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/MEMWB.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/PCAdder.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/ProgramCounter.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/Registers.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/SignExtender.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/SignShift.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/clkdiv.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/exmem.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/mux16.v
  C:/Users/admin/Documents/projects/CpE142_pipeline/CpE142/CpE142.srcs/sources_1/new/top.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}

synth_design -top top -part xc7s50csga324-1


write_checkpoint -force -noxdef top.dcp

catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }
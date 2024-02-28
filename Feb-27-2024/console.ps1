
function fGetDataForConsole ([array]$_io_process_arr) {
	#
	## get process header and disk data
	$_process_metrics_arr = fGetDataForHtml $_io_process_arr
	$_process_header_arr = $_process_metrics_arr[0].ProcessHeader
	$_process_sub_header_arr = $_process_metrics_arr[0].ProcessSubHeader
	$_process_disk_data_arr = $_process_metrics_arr[0].ProcessData
	#
	# define color pallete
	$_header_color = "white"
	$_header_inner_color = "cyan"
	#
	## define process header labels - set 1 of 3
	$_label_process_type = "Process"
	$_label_process_alt_name = "Id"
	$_label_process_state = "Status "
	$_label_process_uptime = "Uptime     "
	$_label_process_size = "Size   "
	$_label_process_progress = "%    "
	$_label_process_eta = "ETA        "
	$_label_process_sector_time = "Sector "
	$_label_process_disks = "   Disks  "
	$_label_process_replot_disks = " Replot Sectors "
	$_label_process_rewards = "   Rewards    "
	$_label_process_misses = "Miss"
	# node extra columns
	$_label_process_sync_status = "Synced"
	$_label_process_peers = "Peers"
	## define process header labels - set 2 of 3
	$_label_process_type_row2 = "Type   "
	$_label_process_alt_name_row2 = "  "
	$_label_process_state_row2 = "       "
	$_label_process_uptime_row2 = "           "
	$_label_process_size_row2 = "       "
	$_label_process_progress_row2 = "Cmpl "
	$_label_process_eta_row2 = "           "
	$_label_process_sector_time_row2 = "Time   "
	$_label_process_disks_row2 = "----------"
	$_label_process_replot_disks_row2 = "----------------"
	$_label_process_rewards_row2 = "--------------"
	$_label_process_misses_row2 = "    "
	# node extra columns
	$_label_process_sync_status_row2 = "      "
	$_label_process_peers_row2 = "     "
	## define process header labels - set 3 of 3
	$_label_process_type_row3 = "       "
	$_label_process_alt_name_row3 = "  "
	$_label_process_state_row3 = "       "
	$_label_process_uptime_row3 = "           "
	$_label_process_size_row3 = "       "
	$_label_process_progress_row3 = "     "
	$_label_process_eta_row3 = "           "
	$_label_process_sector_time_row3 = "       "
	$_label_process_disks_row3 = "#/Pltd/Rem"
	$_label_process_replot_disks_row3 = "expng/expd/%cmpl"
	$_label_process_rewards_row3 = "Tot/PH/Est PD "
	$_label_process_misses_row3 = "    "
	# node extra columns
	$_label_process_sync_status_row3 = "      "
	$_label_process_peers_row3 = "     "
	#
	## node label sizing assessment
	#$_label_count_node = 5
	$_label_count_node = 4
	#$_label_total_length_node = $_label_process_type.Length + $_process_alt_name_max_length + $_label_process_state.Length + $_label_process_sync_status.Length + $_label_process_peers.Length
	$_label_total_length_node = $_process_alt_name_max_length + $_label_process_state.Length + $_label_process_sync_status.Length + $_label_process_peers.Length
	#$_label_separator_count_node = 6
	$_label_separator_count_node = 5
	$_label_line_separator_length_node = $_label_total_length_node + $_label_separator_count_node - 2
	#
	## farmer label sizing assessment
	#$_label_count = 12
	$_label_count = 11
	#$_label_total_length = $_label_process_type.Length + $_process_alt_name_max_length + $_label_process_state.Length + $_label_process_uptime.Length +	$_label_process_size.Length + $_label_process_progress.Length + 
	$_label_total_length =  $_process_alt_name_max_length + $_label_process_state.Length + $_label_process_uptime.Length +	$_label_process_size.Length + $_label_process_progress.Length + 
							$_label_process_eta.Length + $_label_process_sector_time.Length + $_label_process_disks.Length + 
							$_label_process_replot_disks.Length + $_label_process_rewards.Length + $_label_process_misses.Length
	#$_label_separator_count = 13
	$_label_separator_count = 12
	#
	#
	#$_label_line_separator = "-"
	#$_label_line_separator_upper = "-"
	$_label_line_separator = "_"
	$_label_line_separator_upper = [char](8254)			# overline unicode (reverse of underscore)
	$_label_line_separator_length = $_label_total_length + $_label_separator_count - 2
	#
	$_data_line_separator = "-"
	#
	$_spacer = " "
	#
	## read and display node table
	$_console_header_log = ""
	$_console_header_row2_log = ""
	$_console_header_row3_log = ""
	$_console_header_log_finish_line = ""
	$_b_process_header_printed = $false
	foreach ($_header in $_process_header_arr)
	{
			#
			$_console_data_log = ""
			#
			## get process identifiers
			$_process_name = $_header.UUId
			$_process_alt_name = $_header.Hostname
			$_process_isOftype = $_header.ProcessType
			$_process_state = $_header.State
			$_process_sync_state = $_header.SyncStatus
			$_process_peers = $_header.Peers
			#
			if ($_process_isOftype.toLower() -ne "node") { continue }
			#
			## build header and data for console display
			$_spacer_length = 0
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			#
			#$_console_data_log += $_label_spacer + $_process_isOftype
			#$_console_header_log += $_label_spacer + $_label_process_type
			#$_console_header_row2_log += $_label_spacer + $_label_process_type_row2
			#$_console_header_row3_log += $_label_spacer + $_label_process_type_row3
			#####
			#$_spacer_length = [int]($_label_process_type.Length)
			#$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			#$_label_spacer = "|" + $_label_spacer
			#$_console_header_log_finish_line += $_label_spacer
			#
			#
			#$_spacer_length = [int]($_label_process_type.Length - $_process_isOftype.Length)
			#$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			#$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_alt_name
			#
			#$_spacer_length = [int]($_label_process_type.Length - $_label_process_type.Length)
			#$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			#$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_alt_name
			$_console_header_row2_log += $_label_spacer + $_label_process_alt_name_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_alt_name_row3
			####
			#$_spacer_length = [int]($_label_process_alt_name.Length + 6)
			$_spacer_length = [int]($_process_alt_name_max_length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			if ($_process_state.toLower() -eq "running") {
				# TBD - coloring
			}
			else{
				# TBD - coloring
			}
			#
			#
			#$_spacer_length = [int]($_process_alt_name.Length - $_process_alt_name.Length)
			$_spacer_length = [int]($_process_alt_name_max_length - $_process_alt_name.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_state
			#
			#$_spacer_length = [int]($_process_alt_name.Length - $_label_process_alt_name.Length)
			$_spacer_length = [int]($_process_alt_name_max_length - $_label_process_alt_name.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_state
			$_console_header_row2_log += $_label_spacer + $_label_process_state_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_state_row3
			####
			$_spacer_length = [int]($_label_process_state.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			$_spacer_length = [int]($_label_process_state.Length - $_process_state.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_sync_state
			#
			$_spacer_length = [int]($_label_process_state.Length - $_label_process_state.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_sync_status
			$_console_header_row2_log += $_label_spacer + $_label_process_sync_status_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_sync_status_row3
			####
			$_spacer_length = [int]($_label_process_sync_status.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			$_spacer_length = [int]($_label_process_sync_status.Length - $_process_sync_state.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_peers
			#
			$_spacer_length = [int]($_label_process_sync_status.Length - $_label_process_sync_status.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_peers
			$_console_header_row2_log += $_label_spacer + $_label_process_peers_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_peers_row3
			####
			$_spacer_length = [int]($_label_process_peers.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			# last column delimiter only
			$_spacer_length = [int]($_label_process_peers.Length - $_process_peers.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer
			#
			$_spacer_length = [int]($_label_process_peers.Length - $_label_process_peers.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer
			$_console_header_row2_log += $_label_spacer
			$_console_header_row3_log += $_label_spacer
			####
			$_spacer_length = [int]($_label_process_peers.Length - $_label_process_peers.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			## write to console
			if (!($_b_process_header_printed))
			{
				###
				$_temp_label_ = "Node:"
				$_spacer_length = $_label_line_separator_length_node
				$_line_separator = fBuildDynamicSpacer $_spacer_length $_label_line_separator
				Write-Host ($_spacer + $_line_separator) -Foregroundcolor $_header_color
				$_spacer_length = ($_label_line_separator_length_node - $_temp_label_.Length)/ 2
				$_line_separator = fBuildDynamicSpacer $_spacer_length $_spacer
				$_line_separator = "|" + $_line_separator 
				Write-Host $_line_separator -nonewline -Foregroundcolor $_header_color
				Write-Host $_temp_label_ -nonewline -Foregroundcolor $_header_inner_color
				$_spacer_length = ($_label_line_separator_length_node - $_temp_label_.Length + 1)/ 2
				$_line_separator = fBuildDynamicSpacer $_spacer_length $_spacer
				$_line_separator = $_line_separator + "|"
				Write-Host $_line_separator -Foregroundcolor $_header_color
				###
				$_spacer_length = $_label_line_separator_length_node
				$_line_separator = fBuildDynamicSpacer $_spacer_length $_label_line_separator
				#Write-Host ($_spacer + $_line_separator) -Foregroundcolor $_header_color
				Write-Host ("|" + $_line_separator + "|") -Foregroundcolor $_header_color
				#
				Write-Host $_console_header_log -Foregroundcolor $_header_color
				Write-Host $_console_header_row2_log -Foregroundcolor $_header_color
				#Write-Host $_console_header_row3_log -Foregroundcolor $_header_color
				#
				$_spacer_length = $_label_line_separator_length_node
				$_line_separator_upper = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
				#Write-Host $_line_separator_upper -Foregroundcolor $_header_color
				Write-Host $_console_header_log_finish_line -Foregroundcolor $_header_color
				#
				Write-Host $_console_data_log
				$_b_process_header_printed = $true
			}
			else 
			{
				#$_spacer_length = $_label_line_separator_length_node - 2		#accounted for starting and ending "|" padding
				#$_line_separator = fBuildDynamicSpacer $_spacer_length $_spacer
				#Write-Host $_line_separator
				#
				Write-Host $_console_data_log
			}
	}
	#
	# write finish line for node table
	$_spacer_length = $_label_line_separator_length_node
	$_line_separator_upper = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
	Write-Host ($_spacer + $_line_separator_upper) -Foregroundcolor $_header_color
	#
	#
	##
	## read and display farmer table
	$_console_header_log = ""
	$_console_header_row2_log = ""
	$_console_header_row3_log = ""
	$_console_header_log_finish_line = ""
	$_b_process_header_printed = $false
	#
	##
	$_all_process_size_TiB = 0
	$_all_process_size_TiB_disp = "-"
	$_all_process_completed_sectors = 0
	$_all_process_total_sectors = 0
	#$_all_process_progress = 0
	$_all_process_progress_disp = "-"
	$_all_process_rewards = 0
	$_all_process_rewards_per_hour = 0
	$_all_process_misses = 0
	##
	#
	foreach ($_header in $_process_header_arr)
	{
			#
			$_console_data_log = ""
			#
			## get process identifiers
			$_process_name = $_header.UUId
			$_process_alt_name = $_header.Hostname
			$_process_isOftype = $_header.ProcessType
			$_process_state = $_header.State
			$_process_sync_state = $_header.SyncStatus
			$_process_peers = $_header.Peers
			#
			if ($_process_isOftype.toLower() -ne "farmer") { continue }
			#
			## build header and data for console display
			$_spacer_length = 0
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			#
			#$_console_data_log += $_label_spacer + $_process_isOftype
			#$_console_header_log += $_label_spacer + $_label_process_type
			#$_console_header_row2_log += $_label_spacer + $_label_process_type_row2
			#$_console_header_row3_log += $_label_spacer + $_label_process_type_row3
			#####
			#$_spacer_length = [int]($_label_process_type.Length)
			#$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			#$_label_spacer = "|" + $_label_spacer
			#$_console_header_log_finish_line += $_label_spacer
			#
			#
			#$_spacer_length = [int]($_label_process_type.Length - $_process_isOftype.Length)
			#$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			#$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_alt_name
			#
			#$_spacer_length = [int]($_label_process_type.Length - $_label_process_type.Length)
			#$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			#$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_alt_name
			$_console_header_row2_log += $_label_spacer + $_label_process_alt_name_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_alt_name_row3
			####
			#$_spacer_length = [int]($_label_process_alt_name.Length + 6)
			$_spacer_length = [int]($_process_alt_name_max_length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			if ($_process_state.toLower() -eq "running") {
				# TBD - coloring
			}
			else{
				# TBD - coloring
			}
			#
			#
			#$_spacer_length = [int]($_process_alt_name.Length - $_process_alt_name.Length)
			$_spacer_length = [int]($_process_alt_name_max_length - $_process_alt_name.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_state
			#
			#$_spacer_length = [int]($_process_alt_name.Length - $_label_process_alt_name.Length)
			$_spacer_length = [int]($_process_alt_name_max_length - $_label_process_alt_name.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_state
			$_console_header_row2_log += $_label_spacer + $_label_process_state_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_state_row3
			####
			$_spacer_length = [int]($_label_process_state.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			# get uptime, size, % complete, eta and sector time at process level
			$_process_uptime = "-"
			$_process_uptime_disp = "-"
			$_process_uptime_seconds = 0
			$_process_size_TiB = "-"
			$_overall_progress = "-"
			$_process_eta_disp = "-"
			$_process_sector_time_disp = "-"
			$_process_total_disks = "-"
			$_process_plotted_disks = "-"
			$_process_remaining_disks = "-"
			$_process_disks_disp = "-"
			foreach ($_sub_header in $_process_sub_header_arr)
			{
				if ($_sub_header.UUId -eq $_process_name)
				{
					$_process_uptime = $_sub_header.Uptime
					$_process_uptime_disp = $_process_uptime
					if ($_sub_header.UptimeTSObj -ne $null) 
					{
						$_process_uptime_seconds = $_sub_header.UptimeTSObj.TotalSeconds
						$_process_uptime_disp = $_sub_header.UptimeTSObj.days.ToString() + "d " + $_sub_header.UptimeTSObj.hours.ToString() + "h " + $_sub_header.UptimeTSObj.minutes.ToString() + "m"
					}
					#
					if ($_sub_header.TotalSectors -ne "-")
					{
						#$_process_size_TiB = ([math]::Ceiling(([int]($_sub_header.TotalSectors) / 1000) * 10) / 10).ToString() + "TiB"
						$_process_size_TiB = ([math]::Round([int]($_sub_header.TotalSectors) / 1000, 1)).ToString() + "TiB"
						$_all_process_size_TiB += [int]($_sub_header.TotalSectors)
						#
						$_overall_progress = ([math]::Round(([int]($_sub_header.CompletedSectors) / [int]($_sub_header.TotalSectors)) * 100, 1)).toString() + "%"
						$_all_process_completed_sectors += [int]($_sub_header.CompletedSectors)
						$_all_process_total_sectors += [int]($_sub_header.TotalSectors)
						#
						if ($_sub_header.RemainingSectors -ne "-" -and $_sub_header.SectorTime -ne $null -and $_sub_header.TotalDisksForETA -ne 0) {
							$_process_eta = [double](($_sub_header.SectorTime * $_sub_header.RemainingSectors) / $_sub_header.TotalDisksForETA)
							$_process_eta_obj = New-TimeSpan -seconds $_process_eta
							$_process_eta_disp = $_process_eta_obj.days.toString() + "d " + $_process_eta_obj.hours.toString() + "h " + $_process_eta_obj.minutes.toString() + "m" 
							$_process_sector_time = New-TimeSpan -seconds ($_sub_header.SectorTime / $_sub_header.TotalDisksForETA)
							$_process_sector_time_disp =  $_process_sector_time.minutes.ToString() + "m " + $_process_sector_time.seconds.ToString() + "s"
						}
					}
					#
					$_process_total_disks = $_sub_header.TotalDisks
					$_process_remaining_disks = $_sub_header.TotalDisksForETA
					if ($_process_remaining_disks -ne "-" -and $_process_total_disks -ne "-")
					{
						$_process_plotted_disks = $_process_total_disks - $_process_remaining_disks
					}
					$_process_disks_disp = $_process_total_disks.ToString() + "/" + $_process_plotted_disks.ToString() + "/" + $_process_remaining_disks.ToString()
					break
				}
			}
			#
			#
			$_spacer_length = [int]($_process_state.Length - $_process_state.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			#$_console_data_log += $_label_spacer + $_process_uptime
			$_console_data_log += $_label_spacer + $_process_uptime_disp
			#
			$_spacer_length = [int]($_process_state.Length - $_label_process_state.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_uptime
			$_console_header_row2_log += $_label_spacer + $_label_process_uptime_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_uptime_row3
			####
			$_spacer_length = [int]($_label_process_uptime.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			#$_spacer_length = [int]($_label_process_uptime.Length - $_process_uptime.Length)
			$_spacer_length = [int]($_label_process_uptime.Length - $_process_uptime_disp.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_size_TiB
			#
			$_spacer_length = [int]($_label_process_uptime.Length - $_label_process_uptime.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_size
			$_console_header_row2_log += $_label_spacer + $_label_process_size_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_size_row3
			####
			$_spacer_length = [int]($_label_process_size.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			$_spacer_length = [int]($_label_process_size.Length - $_process_size_TiB.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_overall_progress
			#
			$_spacer_length = [int]($_label_process_size.Length - $_label_process_size.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_progress
			$_console_header_row2_log += $_label_spacer + $_label_process_progress_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_progress_row3
			####
			$_spacer_length = [int]($_label_process_progress.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			$_spacer_length = [int]($_label_process_progress.Length - $_overall_progress.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_eta_disp
			#
			$_spacer_length = [int]($_label_process_progress.Length - $_label_process_progress.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_eta
			$_console_header_row2_log += $_label_spacer + $_label_process_eta_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_eta_row3
			####
			$_spacer_length = [int]($_label_process_eta.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			$_spacer_length = [int]($_label_process_eta.Length - $_process_eta_disp.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_sector_time_disp
			#
			$_spacer_length = [int]($_label_process_eta.Length - $_label_process_eta.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_sector_time
			$_console_header_row2_log += $_label_spacer + $_label_process_sector_time_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_sector_time_row3
			####
			$_spacer_length = [int]($_label_process_sector_time.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			$_spacer_length = [int]($_label_process_sector_time.Length - $_process_sector_time_disp.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_disks_disp
			#
			$_spacer_length = [int]($_label_process_sector_time.Length - $_label_process_sector_time.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_disks
			$_console_header_row2_log += $_label_spacer + $_label_process_disks_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_disks_row3
			####
			$_spacer_length = [int]($_label_process_disks.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			# get replot, rewards and misses from disk level data and roll-up to process (farm) level
			$_replot_count_ = 0
			$_replot_count_hold = 0
			$_about_to_expire_sectors_count = 0
			$_rewards_ = 0
			$_misses_ = 0
			$_process_replot_disks = "-"
			$_process_replot_disks_hold = "-"
			$_process_expiring_sectors_count = 0
			$_process_rewards = "-"
			$_process_misses = "-"
			foreach ($_data in $_process_disk_data_arr)
			{
				if ($_process_name -ne $_data.UUId) {
						continue
				}
				#
				if ($_data.ReplotStatus -ne "-")
				{
					#$_replot_count_ += 1
					$_replot_count_ += [int]($_data.ReplotStatus)
					$_process_replot_disks = $_replot_count_.ToString()
				}
				if ($_data.ReplotStatusHold -ne "-")
				{
					$_replot_count_hold += [int]($_data.ReplotStatusHold)
					$_process_replot_disks_hold = $_replot_count_hold.ToString()
				}
				if ($_data.ExpiringSectors -ne "-")
				{
					$_about_to_expire_sectors_count += $_data.ExpiringSectors
					$_process_expiring_sectors_count = $_about_to_expire_sectors_count.ToString()
				}
				if ($_data.Rewards -ne "-")
				{
					$_rewards_ += [int]($_data.Rewards)
					$_process_rewards = $_rewards_.ToString()
					$_all_process_rewards += [int]($_data.Rewards)
				}
				if ($_data.Misses -ne "-")
				{
					$_misses_ += [int]($_data.Misses)
					$_process_misses = $_misses_.ToString()
					$_all_process_misses += [int]($_data.Misses)
				}
			}
			$_process_rewards_per_hour = "-"
			$_process_rewards_per_day_estimated = "-"
			#Write-Host "_process_rewards: " $_process_rewards
			#Write-Host "_process_uptime_seconds :" $_process_uptime_seconds
			if ($_process_uptime_seconds -gt 0 -and $_process_uptime_seconds -ne "-" -and $_process_rewards -ne "-")
			{
				$_process_rewards_per_hour = [math]::Round(([int]($_process_rewards) / $_process_uptime_seconds) * 3600, 1)
				$_all_process_rewards_per_hour += $_process_rewards_per_hour
				$_process_rewards_per_day_estimated = [math]::Round(([int]($_process_rewards) / $_process_uptime_seconds) * 3600 * 24, 1)
			}
			$_process_rewards_disp = "-"
			if ($_process_rewards -ne "-")
			{
				$_process_rewards_disp = $_process_rewards + "/" + $_process_rewards_per_hour.ToString() + "/" + $_process_rewards_per_day_estimated.ToString()
			}
			#
			#
			#$_spacer_length = [int]($_label_process_remaining_disks.Length - $_process_remaining_disks.Length)
			$_spacer_length = [int]($_label_process_disks.Length - $_process_disks_disp.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			#$_console_data_log += $_label_spacer + $_process_replot_disks
			$_replot_progress = "-"
			if ($_process_replot_disks -ne "-" -and $_process_replot_disks_hold -ne "-")
			{
				if ([int]($_process_replot_disks) -gt 0 -and [int]($_process_replot_disks_hold) -gt 0)
				{
					$_replot_progress = ([math]::Round($_process_replot_disks / $_process_replot_disks_hold, 1)).ToString() + "%"
				}
			}
			## DO NOT DELETE (TBD add sectors remaining) ## - 	#$_process_replot_sector_count_disp = $_process_expiring_sectors_count + "/" + $_process_replot_disks_hold + "/" + $_process_replot_disks
			$_process_replot_sector_count_disp = $_process_expiring_sectors_count + "/" + $_process_replot_disks_hold + "/" + $_replot_progress
			if ($_process_replot_disks_hold -eq 0) {
				if ($_process_expiring_sectors_count -gt 0)
				{
					$_process_replot_sector_count_disp = $_process_expiring_sectors_count.ToString() + "/" + "-" + "/" + "-"
				}
				else
				{
					$_process_replot_sector_count_disp = "-" + "/" + "-" + "/" + "-"
				}
			}
			$_console_data_log += $_label_spacer + $_process_replot_sector_count_disp
			#
			#$_spacer_length = [int]($_label_process_remaining_disks.Length - $_label_process_remaining_disks.Length)
			$_spacer_length = [int]($_label_process_disks.Length - $_label_process_disks.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_replot_disks
			$_console_header_row2_log += $_label_spacer + $_label_process_replot_disks_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_replot_disks_row3
			####
			$_spacer_length = [int]($_label_process_replot_disks.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			#$_spacer_length = [int]($_label_process_replot_disks.Length - $_process_replot_disks.Length)
			$_spacer_length = [int]($_label_process_replot_disks.Length - $_process_replot_sector_count_disp.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			#$_console_data_log += $_label_spacer + $_process_rewards
			$_console_data_log += $_label_spacer + $_process_rewards_disp
			#
			$_spacer_length = [int]($_label_process_replot_disks.Length - $_label_process_replot_disks.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_rewards
			$_console_header_row2_log += $_label_spacer + $_label_process_rewards_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_rewards_row3
			####
			$_spacer_length = [int]($_label_process_rewards.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			#$_spacer_length = [int]($_label_process_rewards.Length - $_process_rewards.Length)
			$_spacer_length = [int]($_label_process_rewards.Length - $_process_rewards_disp.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer + $_process_misses
			#
			$_spacer_length = [int]($_label_process_rewards.Length - $_label_process_rewards.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer + $_label_process_misses
			$_console_header_row2_log += $_label_spacer + $_label_process_misses_row2
			$_console_header_row3_log += $_label_spacer + $_label_process_misses_row3
			####
			$_spacer_length = [int]($_label_process_misses.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			# last column delimiter only
			$_spacer_length = [int]($_label_process_misses.Length - $_process_misses.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_data_log += $_label_spacer
			#
			$_spacer_length = [int]($_label_process_misses.Length - $_label_process_misses.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_spacer
			$_label_spacer = $_label_spacer + "|"
			$_console_header_log += $_label_spacer
			$_console_header_row2_log += $_label_spacer
			$_console_header_row3_log += $_label_spacer
			####
			$_spacer_length = [int]($_label_process_misses.Length - $_label_process_misses.Length)
			$_label_spacer = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
			$_label_spacer = "|" + $_label_spacer
			$_console_header_log_finish_line += $_label_spacer
			#
			#
			## write to console
			if (!($_b_process_header_printed))
			{
				###
				$_temp_label_ = "Farm:"
				$_spacer_length = $_label_line_separator_length
				$_line_separator = fBuildDynamicSpacer $_spacer_length $_label_line_separator
				Write-Host ($_spacer + $_line_separator) -Foregroundcolor $_header_color
				$_spacer_length = ($_label_line_separator_length - $_temp_label_.Length)/ 2
				$_line_separator = fBuildDynamicSpacer $_spacer_length $_spacer
				$_line_separator = "|" + $_line_separator 
				Write-Host $_line_separator -nonewline -Foregroundcolor $_header_color
				Write-Host $_temp_label_ -nonewline -Foregroundcolor $_header_inner_color
				$_spacer_length = ($_label_line_separator_length - $_temp_label_.Length)/ 2
				$_line_separator = fBuildDynamicSpacer $_spacer_length $_spacer
				$_line_separator = $_line_separator + "|"
				Write-Host $_line_separator -Foregroundcolor $_header_color
				###
				#
				# reserve spot for overall farm process summary line
				$_spacer_length = $_label_line_separator_length
				$_line_separator = fBuildDynamicSpacer $_spacer_length $_spacer
				$_line_separator = "|" + $_line_separator + "|"
				Write-Host $_line_separator -Foregroundcolor $_header_color
				Write-Host "|" -nonewline
				$_all_process_summary_CursorPosition = $host.UI.RawUI.CursorPosition
				Write-Host
				#
				$_spacer_length = $_label_line_separator_length
				$_line_separator = fBuildDynamicSpacer $_spacer_length $_label_line_separator
				#Write-Host ($_spacer + $_line_separator) -Foregroundcolor $_header_color
				Write-Host ("|" + $_line_separator + "|") -Foregroundcolor $_header_color
				#
				Write-Host $_console_header_log -Foregroundcolor $_header_color
				Write-Host $_console_header_row2_log -Foregroundcolor $_header_color
				Write-Host $_console_header_row3_log -Foregroundcolor $_header_color
				#
				$_spacer_length = $_label_line_separator_length
				$_line_separator_upper = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
				#Write-Host $_line_separator_upper -Foregroundcolor $_header_color
				Write-Host $_console_header_log_finish_line -Foregroundcolor $_header_color
				#
				Write-Host $_console_data_log
				$_b_process_header_printed = $true
			}
			else 
			{
				#$_spacer_length = $_label_line_separator_length - 2		#accounted for starting and ending "|" padding
				#$_line_separator = fBuildDynamicSpacer $_spacer_length $_spacer
				#Write-Host $_line_separator
				#
				Write-Host $_console_data_log
			}
	}
	$_spacer_length = $_label_line_separator_length
	$_line_separator_upper = fBuildDynamicSpacer $_spacer_length $_label_line_separator_upper
	Write-Host ($_spacer + $_line_separator_upper) -Foregroundcolor $_header_color
	$_most_recent_CursorPosition = $host.UI.RawUI.CursorPosition
	#
	#
	### write overall farm process summary line at previously reserved spot
	$_all_process_size_TiB_disp = ([math]::Round($_all_process_size_TiB / 1000, 1))
	if ($_all_process_total_sectors -gt 0)
	{
		$_all_process_progress_disp = ([math]::Round(($_all_process_completed_sectors / $_all_process_total_sectors) * 100, 1)).toString() + "%"
	}
	$_all_process_rewards_per_day_estimated = [math]::Round($_all_process_rewards_per_hour * 24, 1)
	# reposition cursor for writing overall farm process summary line
	$_farm_grand_total_disp =  	"Size: " + $_all_process_size_TiB_disp.toString() + "TiB, % Complete: " + $_all_process_progress_disp.toString() + 
								", Rewards (total/per hour/est per day): " + $_all_process_rewards.toString() + "/" + $_all_process_rewards_per_hour.toString() + "/" + $_all_process_rewards_per_day_estimated.toString() + 
								", Miss: " + $_all_process_misses.toString()
	$_farm_grand_total_disp_padding = fBuildDynamicSpacer ($_label_line_separator_length - $_farm_grand_total_disp.Length) $_spacer
	[Console]::SetCursorPosition($_all_process_summary_CursorPosition.X, $_all_process_summary_CursorPosition.Y)
	[System.Console]::Write($_farm_grand_total_disp + $_farm_grand_total_disp_padding + "|")
	#
	#revert back cursor position to last written summary data
	[Console]::SetCursorPosition($_most_recent_CursorPosition.X, $_most_recent_CursorPosition.Y)
	###
	#
	#
	## display latest github version info
	$_gitVersionDisp = " - "
	$_gitVersionDispColor = $_html_red
	if ($null -ne $gitVersion) {
		$currentVersion = $gitVersion[0] -replace "[^.0-9]"
		$_gitVersionDisp = $gitVersion[0]
		$_gitVersionDispColor = $_html_green
	}

	Write-Host
	Write-Host "Latest github version : " -nonewline
	Write-Host "$($_gitVersionDisp)" -ForegroundColor $_gitVersionDispColor

	##
	# display last refresh time 
	$currentDate = (Get-Date).ToLocalTime().toString()
	# Refresh
	Write-Host "Last refresh on: " -ForegroundColor White -nonewline; Write-Host "$currentDate" -ForegroundColor Yellow;
	#echo `n
	#
}

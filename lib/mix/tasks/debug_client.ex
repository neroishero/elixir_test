defmodule Mix.Tasks.DebugClient do
	use Mix.Task

	require Logger
	require Server

	@shortdoc "debug server"

	def run(_) do
		Process.flag(:trap_exit, true)
		config_logger()
		Logger.info("***********************Client Server starting***********************")
		:os.type ==	{:win32,   :nt} && :observer.start()
 
		Server.start_link(1, 1)
		Server.start_server()
		#trap_exit()
	end

	defp config_logger() do

		#Logger.configure_backend( [{LoggerFileBackend, :info}], metadata: [ :module, :line ])
		Logger.configure_backend(:console,
			metadata: [ :module, :line ],
			handle_sasl_reports: true,
			truncate: 16000
		)
	end

	# defp trap_exit() do
	# 	receive do
	# 		msg -> Logger.info(" exit info ----------------: #{inspect(msg)}")
	# 	end
	# end
end

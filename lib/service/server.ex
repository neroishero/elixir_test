defmodule Server do

# use
	#use Application
	use GenServer
# requires
	require Logger

# consts
	@db_models_client [

	]

	@player_handlers [
	]

	@cfg_service_configs [

	]

	@log_schedulers [

	]


	@services_client [

	]

	@db_models_world [

	]

	#世界服务器的所有服务
	@services_world	[

	]

	# @services_stop [
	#
	#
	# ]

	@switches [

	]

	@type_client_debug 1
	@type_client 	   2
	@type_world_debug  3
	#@type_world        4
	@type_clear_db     5

	def main(args) do

	end

	def start_link(type, _args) do
		GenServer.start_link(__MODULE__, type, name: __MODULE__)
	end

	def start_server() do
		GenServer.cast(__MODULE__, :start)
	end

	def stop_server() do
		GenServer.cast(__MODULE__, :stop)
	end

	def init(type) do
		{:ok, type}
	end

	def handle_cast(:start, type) do
		Process.sleep(1000)
		start(type)
		{:noreply, type}
	end

	def handle_cast(:stop, state) do
		stop(state)
		{:stop, state}
	end

	def start(type) do
		services = get_services(type)
		Enum.reduce_while(services, :ok, fn {mod, params}, :ok ->
			result = apply(mod, :start, [params])
			case result do
			 	{:ok, _} -> Logger.info("**Service** #{inspect(mod)} started!")
							{:cont, :ok}
			 	_ 		 -> Logger.info("!!!!!!!!!Service** #{inspect(mod)} fails!")
							{:halt, :error}
							#raise("**Service** #{inspect(mod)} fails!")
			end
		end)
	end


	defp stop(type) do
		services = get_services(type) |> Enum.reverse()
		Enum.each(services, fn {mod, _params} ->
			Logger.info("-------------Stopping server #{inspect(mod)}")
			apply(mod, :stop, [nil])
			#mod.stop(nil)
		end)
		:init.stop()
	end

	defp get_services(type) do
		case type do
			1 -> @services_client
			2 -> @services_world
			_ -> @services_client
		end
	end


end

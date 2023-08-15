/**
 * This is your application router.  From here you can controll all the incoming routes to your application.
 *
 * https://coldbox.ortusbooks.com/the-basics/routing
 */
component {

	function configure(){
		/**
		 * --------------------------------------------------------------------------
		 * Router Configuration Directives
		 * --------------------------------------------------------------------------
		 * https://coldbox.ortusbooks.com/the-basics/routing/application-router#configuration-methods
		 */
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 */

		// A nice healthcheck route example
		route( "/healthcheck", function( event, rc, prc ){
			return "Ok!";
		} );

		// A nice RESTFul Route example
		route( "/api/echo", function( event, rc, prc ){
			return { "error" : false, "data" : "Welcome to my awesome API!" };
		} );

		// @app_routes@

		// Conventions-Based Routing
		route( ":handler/:action?" ).end();


		route( "/carro/create" ).as("carro_create").to('carro.create')
			.withAction( {
				POST : "cadastrarCarro",
				OPTIONS: "preFlight"
		});

		route( "/carro/show" ).as("carro_show").to('carro.show')
			.withAction( {
				GET : "mostrarCarro",
				OPTIONS: "preFlight"
		});

		route( "/carro/update" ).as("carro_update").to('carro.update')
			.withAction( {
				PUT : "atualizarCarro",
				OPTIONS: "preFlight"
		});

		route( "/carro/delete" ).as("carro_deletar").to('carro.deletar')
			.withAction( {
				DELETE : "deletarCarro",
				OPTIONS: "preFlight"
		});

		route( "/carro/listar" ).as("carro_listar").to('carro.listar')
			.withAction( {
				GET : "obterLista",
				OPTIONS: "preFlight"
		});
	}

}

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


		route( "/carro/create" ).as("carro_create").to('carro.create');
		route( "/carro/show" ).as("carro_show").to('carro.show');
		route( "/carro/update" ).as("carro_update").to('carro.update');
		route( "/carro/delete" ).as("carro_deletar").to('carro.deletar');
		route( "/carro/listar" ).as("carro_listar").to('carro.listar');
		
		//APIs
		group( { pattern="/api/sql/carro", target="Api.SQLCarro." }, function(){
			route( "/lista" ).to('Api.CarroSQL');
			route( "/cadastrar" ).to('Api.CarroSQL.cadastrar');
			route( "/atualizar" ).to('Api.CarroSQL.atualizar');
			route( "/obter" ).to('Api.CarroSQL.obter');
			route( "/deletar" ).to('Api.CarroSQL.deletar');
		} );

		group( { pattern="/api/orm/carro", target="Api.ORMCarro." }, function(){
			route( "/lista" ).to('Api.CarroORM');
			route( "/cadastrar" ).to('Api.CarroORM.cadastrar');
			route( "/atualizar" ).to('Api.CarroORM.atualizar');
			route( "/obter" ).to('Api.CarroORM.obter');
			route( "/deletar" ).to('Api.CarroORM.deletar');
		} );

		// Conventions-Based Routing
		route( ":handler/:action?" ).end();
	}

}

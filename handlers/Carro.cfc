component extends="coldbox.system.EventHandler" {

	property name="carro" inject="entityService:Carro";

	
	function index( event, rc, prc ){
		event.setView( "formularioCarro" );
	}

	any function create( event, rc, prc ){

		dados = carro.new();

		dados.setModeloCarro(rc.form.modelo_carro);
		dados.setAno(rc.form.ano);
		dados.setQuantidade(rc.form.quantidade);
		dados.save(dados);

		return "Carro cadastrado com sucesso!";
	}

	any function show( event, rc, prc ){

		dados 		= carro.get();
		modelo 		= dados.getModeloCarro();
		ano 		= dados.getAno();
		quantidade 	= dados.getQuantidade();

		writeDump(carro.getMemento());
		abort;
	}

	any function update( event, rc, prc ){

		// Obtenha o ID do carro
        var idCarro = rc.routeVars.idCarro;
		dados  = carro.get(id=idCarro);

		if (dados) {

			// Atualize os atributos do carro com os novos valores
            dados.getModeloCarro(rc.form.nome);
            dados.getAno(rc.form.idade);
			dados.getQuantidade(rc.form.idade);
            
            // Salve as alterações no banco de dados
            carro.save(dados);
            
            return "Carro atualizado com sucesso!";

		} else {

			return "Carro não encontrado.";
		}

	}

	any function delete( event, rc, prc ){

		// Obtenha o ID do carro
        var idCarro = rc.routeVars.idCarro;
		dados  = carro.get(id=idCarro);

		if (dados) {

			carro.delete(dados);            
            return "Carro Excluido com sucesso!";

		} else {

			return "Carro não encontrado.";
		}

	}

	any function listar( event, rc, prc ){

		dados  = carro.list();

		writeDump(arrayLen(carro));
		abort;
	}

}

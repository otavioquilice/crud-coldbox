component extends="coldbox.system.EventHandler" {

	property name="carro" inject="entityService:Carro";

	
	function index( event, rc, prc ){

		event.setView( "formularioCarro" );
	}

	any function create( event, rc, prc ){

		if (isNull(rc.modeloCarro) || isNull(rc.ano) || isNull(rc.quantidade)  ) {
			return "Todos os campos são obrigatórios!";
		};
	
		dados = carro.new();

		dados.setModeloCarro(rc.modeloCarro);
		dados.setAno(rc.ano);
		dados.setQuantidade(rc.quantidade);
		dados.save(dados);

		return relocate(url='http://localhost:8500/carro/listar');

		
	}

	any function show( event, rc, prc ){

		var carroID = rc.id; 
        var dados = carro.get(carroID);

		if (dados.getIdCarro()) {

			prc.id = dados.getIdCarro();
			prc.modelo = dados.getModeloCarro();
			prc.ano = dados.getAno();
			prc.quantidade = dados.getQuantidade();

			event.setView( "formularioUpdate" );
			
		} else {

			return "Carro não encontrado.";
		}

	}

	any function update( event, rc, prc ){

        var idCarro = rc.id;
		dados  = carro.get(idCarro);

		if (dados.getIdCarro()) {

            dados.setModeloCarro(rc.modeloCarro);
            dados.setAno(rc.ano);
			dados.setQuantidade(rc.quantidade);
            carro.save(dados);

			return relocate(url='http://localhost:8500/carro/listar');

		} else {

			return "Carro não encontrado.";
		}

	}

	any function delete( event, rc, prc ){

        var idCarro = rc.id;
		dados  = carro.get(idCarro);

		if (dados.getIdCarro()) {

			carro.delete(dados);  
			   
            return relocate(url='http://localhost:8500/carro/listar');

		} else {

			return "Carro não encontrado.";
		}

	}

	any function listar( event, rc, prc ){

		dados  = carro.list();

		var dadosSimplificados = [];

		for( dado in dados ) {

			dadosSimplificados.append({
				modelo: dado.getModeloCarro(),
				ano: dado.getAno(),
				quantidade: dado.getQuantidade(),
				editar: '<a href="/carro/show?id=#dado.getIdCarro()#">Editar</a>',
				excluir: '<a href="/carro/delete?id=#dado.getIdCarro()#">Excluir</a>'
			});
		}

		prc.carros = dadosSimplificados;

		event.setView( "listaCarro" );

	}

}

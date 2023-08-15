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

		return "Carro cadastrado com sucesso!";

		
	}

	any function show( event, rc, prc ){

		var carroID = rc.id; 
        var dados = carro.get(carroID);

		if (dados.getIdCarro()) {

			var dadoSimplificado = {
				modelo: dados.getModeloCarro(),
				ano: dados.getAno(),
				quantidade: dados.getQuantidade()
    		};
    
    		return dadoSimplificado;
			
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

			return "Carro atualizado com sucesso!";

		} else {

			return "Carro não encontrado.";
		}

	}

	any function delete( event, rc, prc ){

        var idCarro = rc.id;
		dados  = carro.get(idCarro);

		if (dados.getIdCarro()) {

			carro.delete(dados);  
			   
            return "Carro Excluido com sucesso!";

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
				quantidade: dado.getQuantidade()
			});
		}
    
		return dadosSimplificados;

	}

}

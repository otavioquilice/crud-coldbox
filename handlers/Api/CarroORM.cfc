
/**
 * My Event Handler Hint
 */
component extends="coldbox.system.RestHandler"{

    property name="carro" inject="entityService:Carro";
    property name="carroSQL" inject="CarroService";

    // OPTIONAL HANDLER PROPERTIES
    this.prehandler_only 	= "";
    this.prehandler_except 	= "";
    this.posthandler_only 	= "";
    this.posthandler_except = "";
    this.aroundHandler_only = "";
    this.aroundHandler_except = "";

    // REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
    this.allowedMethods = {};

    any function index( event, rc, prc ){

        try {
            dados  = carro.list(asQuery = true);

            status = 200;
            var data = {
                "data" = dados,
                "error":false,
                "pagination":{
                    "totalPages":1,
                    "maxRows":0,
                    "offset":0,
                    "page":10,
                    "totalRecords":0
                },
                "messages":["Sucesso"]
            }
        } catch( any e) {

            status = 500;
            var data = {
                "data" = e.detail,
                "error":true,
                "pagination":{
                    "totalPages":1,
                    "maxRows":0,
                    "offset":0,
                    "page":10,
                    "totalRecords":0
                },
                "messages":[e.message]
            }
        }

        event.renderData(data=data,type="json",statusCode=status);   
    }

    any function cadastrar( event, rc, prc ){

        try {

            dados = carro.new();
            dados.setModeloCarro(rc.modeloCarro);
            dados.setAno(rc.ano);
            dados.setQuantidade(rc.quantidade);
            dados.save(dados);

            status = 200;
            var data = {
                "data" = true,
                "error":false,
                "pagination":{
                    "totalPages":1,
                    "maxRows":0,
                    "offset":0,
                    "page":10,
                    "totalRecords":0
                },
                "messages":["Carro cadastrado com sucesso"]
            }
        } catch( any e) {

            status = 500;
            var data = {
                "data" = e.detail,
                "error":true,
                "pagination":{
                    "totalPages":1,
                    "maxRows":0,
                    "offset":0,
                    "page":10,
                    "totalRecords":0
                },
                "messages":[e.message]
            }
        }

        event.renderData(data=data,type="json",statusCode=status); 
       
    }

    any function atualizar( event, rc, prc ){

        try {

		    dados  = carro.get(rc.idCarro);
            dados.setModeloCarro(rc.modeloCarro);
            dados.setAno(rc.ano);
			dados.setQuantidade(rc.quantidade);
            carro.save(dados);

            status = 200;
            var data = {
                "data" = true,
                "error":false,
                "pagination":{
                    "totalPages":1,
                    "maxRows":0,
                    "offset":0,
                    "page":10,
                    "totalRecords":0
                },
                "messages":["Carro atualizado com sucesso"]
            }
        } catch( any e) {

            status = 500;
            var data = {
                "data" = e.detail,
                "error":true,
                "pagination":{
                    "totalPages":1,
                    "maxRows":0,
                    "offset":0,
                    "page":10,
                    "totalRecords":0
                },
                "messages":[e.message]
            }
        }

        event.renderData(data=data,type="json",statusCode=status); 

       
    }

    any function obter( event, rc, prc ){

        try {
            
            dados  = carro.get(rc.idCarro);

            objeto = {};
            objeto.idCarro      = dados.getIdCarro();
            objeto.modeloCarro  = dados.getModeloCarro();
            objeto.ano          = dados.getAno();
            objeto.quantidade   = dados.getQuantidade();

            status = 200;
            var data = {
                "data" = objeto,
                "error":false,
                "pagination":{
                    "totalPages":1,
                    "maxRows":0,
                    "offset":0,
                    "page":10,
                    "totalRecords":0
                },
                "messages":["Consulta realizada com sucesso"]
            }
        } catch( any e) {

            status = 500;
            var data = {
                "data" = e.detail,
                "error":true,
                "pagination":{
                    "totalPages":1,
                    "maxRows":0,
                    "offset":0,
                    "page":10,
                    "totalRecords":0
                },
                "messages":[e.message]
            }
        }

        event.renderData(data=data,type="json",statusCode=status); 

    }

    any function deletar( event, rc, prc ){

        try {

            dados  = carro.get(rc.idCarro);
            carro.delete(dados);  

            status = 200;
            var data = {
                "data" = true,
                "error":false,
                "pagination":{
                    "totalPages":1,
                    "maxRows":0,
                    "offset":0,
                    "page":10,
                    "totalRecords":0
                },
                "messages":["Carro deletado com sucesso"]
            }
        } catch( any e) {

            status = 500;
            var data = {
                "data" = e.detail,
                "error":true,
                "pagination":{
                    "totalPages":1,
                    "maxRows":0,
                    "offset":0,
                    "page":10,
                    "totalRecords":0
                },
                "messages":[e.message]
            }
        }

        event.renderData(data=data,type="json",statusCode=status); 

       
    }

}

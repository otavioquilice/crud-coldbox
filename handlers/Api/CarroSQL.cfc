
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
    this.allowedMethods = {
        // index       = 'GET',
        // cadastrar   = 'POST',
        // atualizar   = 'PUT',
        // obter       = 'GET',
        // deletar     = 'DELETE'
    };


    any function index( event, rc, prc ){

        try {
            dados  = carroSQL.lista();

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

            objeto = {};
            objeto.modeloCarro  = rc.modeloCarro;
            objeto.ano          = rc.ano;
            objeto.quantidade   = rc.quantidade;

            dados = carroSQL.cadastrar(objeto);

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
                "messages":["Carro Cadastrado com sucesso"]
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

            objeto = {};
            objeto.idCarro      = rc.idCarro;
            objeto.modeloCarro  = rc.modeloCarro;
            objeto.ano          = rc.ano;
            objeto.quantidade   = rc.quantidade;

            dados  = carroSQL.atualizar(objeto);

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

            id = rc.idCarro;
            dados  = carroSQL.obter(id);

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

            id = rc.idCarro;
            dados  = carroSQL.deletar(id);

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

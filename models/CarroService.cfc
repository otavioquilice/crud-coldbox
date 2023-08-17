component{

    any function lista(){
        
        cfQuery(name = 'dados'){
            writeOutput("
                SELECT * FROM tb_carro
            ")
        }
        return dados;
    }
    
    any function cadastrar(objeto){
        
        cfQuery(name = 'dados'){
            writeOutput("
                INSERT INTO tb_carro (modeloCarro, ano, quantidade)
                VALUES ('#objeto.modeloCarro#', '#objeto.ano#', '#objeto.quantidade#')
            ")
        }
        return true;
    }
    
    any function atualizar(objeto){
        
        cfQuery(name = 'dados'){
            writeOutput("
                UPDATE tb_carro
                SET
                    modeloCarro = '#objeto.modeloCarro#',
                    ano         = '#objeto.ano#',
                    quantidade  = '#objeto.quantidade#'
                WHERE
                    idCarro = #objeto.idCarro#
            ")
        }
        return true;
    } 

    any function obter(id){
        
        cfQuery(name = 'dados'){
            writeOutput("
                SELECT * FROM tb_carro
                WHERE idCarro = #id#
            ")
        }
        return dados;
    }
    
    any function deletar(id){
        
        cfQuery(name = 'dados'){
            writeOutput("
                DELETE FROM tb_carro 
                WHERE idCarro = #id#
            ")
        }
        return true;
    } 
}
<cfoutput>
    <h1>Cadastrar Carro</h1>

    <form  method="post" action="/carro/create">
        <div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <label for="exampleInputEmail1">Nome modelo</label>
            <input type="text" class="form-control" name="modeloCarro" value="" id="modelo" aria-describedby="modelo" placeholder="Nome Modelo">
        </div>
        <div class="form-groupcol-xs-12 col-sm-6 col-md-4 col-lg-3">
            <label for="ano">Ano</label>
            <input type="date" class="form-control date" id="ano" name="ano" value="" placeholder="Clique no calendário">
        </div>
            <div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <label for="Quantidade">quantidade</label>
            <input type="number" class="form-control"  type="number" type="number" min="0" step="1" id="quantidade" name="quantidade" value="" placeholder="Digite um número inteiro">
        </div>
        <br>
        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>
    <br>
    <a href="/carro/listar">Voltar para a lista de Carros</a>
</cfoutput>

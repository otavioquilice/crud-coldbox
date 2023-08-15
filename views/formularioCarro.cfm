<h1>Cadastrar Carro</h1>

<form method="post" action="/carro/create">
    <label for="modeloCarro">Nome Modelo:</label>
    <input type="text" id="modeloCarro" name="modeloCarro" value=""><br><br>
    
    <label for="ano">Ano:</label>
    <input type="text" id="ano" name="ano" value=""><br><br>

    <label for="quantidade">Quantidade:</label>
    <input type="number" type="number" min="0" step="1" id="quantidade" name="quantidade" value="#carro.quantidade#"><br><br>
    
    <input type="submit" value="Cadastrar">
</form>
<br>
<a href="event.buildLink('carro.listar')">Voltar para a lista de Carros</a>


    <h1>Lista de Usuários</h1>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Modelo</th>
                <th>Ano</th>
                <th>Quantidade</th>
            </tr>
        </thead>
        <tbody>
            <cfloop query="users">
                <tr>
                    <td>#users.id#</td>
                    <td>#users.name#</td>
                    <td>#users.email#</td>
                </tr>
            </cfloop>
        </tbody>
    </table>
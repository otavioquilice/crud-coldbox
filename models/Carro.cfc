component persistent="true" table="tb_carro" extends="cborm.models.ActiveEntity"{
    
    // chave primária
    property name="idCarro" type="int" fieldtype="id" column="idCarro" generator="increment" params="{sequence = 'seq_carro'}" setter="false";

    // Atrubutos
    property name="modeloCarro"     ormtype="string"    fieldtype="column" column="modeloCarro"  sqltype="varchar2" length="255"  notnull="false";
    property name="ano"             ormtype="date"      fieldtype="column" column="ano"          sqltype="date"                   notnull="false";
    property name="quantidade"      ormtype="int"       fieldtype="column" column="quantidade"   sqltype="int"      length="255"  notnull="false";

    this.constraints = {};

    this.memento = {
        defaultIncludes = [],
        defaultExcludes = [],
        neverIncludes   = [],
        defaults        = {},
        mappers         = {}
    };

    function init(){

        super.init( useQueryCaching="false");
        return this;
    }

    
}
<?php

class ClientDB
{

    private $_bd;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getClientById($id)
    {
        $query = "select * from client";
        $query.= " where id_client = :id";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->bindValue(':id', $id);
            $resultset->execute();
            $data = $resultset->fetch();
            $this->_cli = new Client($data);
            $this->_bd->commit();
            return $this->_cli; // retourne l'instance de Jeux
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }

    }

}


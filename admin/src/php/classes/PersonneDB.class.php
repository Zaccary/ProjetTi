<?php

class PersonneDB extends Personne
{

    private $_bd;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getPersonne($nom,$mdp)
    {
        $query = "select verifier_connexion(:nom,:mdp) as retour"; //retour pour 1 ou 0 retourné
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->bindValue(':nom',$nom);
            $resultset->bindValue(':mdp',$mdp);
            $resultset->execute();
            $retour = $resultset->fetchColumn(0);
            return $retour;
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de la requête " . $e->getMessage();
        }

    }



}

<?php

class JeuxDB extends Jeux
{

    private $_bd;
    private $_array = array();
    private $_jeu;

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getJeuxById($id_jeu)
{
    $query = "select * from vue_jeux_config";
    $query.= " where id_jeux = :id_jeu";
    try {
        //renvoie qu'un seul jeu
        $this->_bd->beginTransaction();
        $resultset = $this->_bd->prepare($query);
        $resultset->bindValue(':id_jeu', $id_jeu);
        $resultset->execute();
        $data = $resultset->fetch();
        $this->_jeu = new Jeux($data);
        $this->_bd->commit();
        return $this->_jeu; // retourne l'instance de Jeux
    } catch (PDOException $e) {
        $this->_bd->rollback();
        print "Echec de la requête " . $e->getMessage();
    }
}

    public function getAllJeux()
    {
        $query = "select * from vue_jeux_config";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);;
            $resultset->execute();
            $data = $resultset->fetchAll();
            //var_dump($data);
            foreach ($data as $d) {
                $_array[] = new Jeux($d);
            }
            $this->_bd->commit();
            return $_array;
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de la requête " . $e->getMessage();
        }
    }

}

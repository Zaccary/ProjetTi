<?php

class CarteGraphiqueDB extends Processeurs
{

    private $_bd;
    private $_array = array();
    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }


    public function getAllCG()
    {
        $query = "select * from carte_graphique";
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

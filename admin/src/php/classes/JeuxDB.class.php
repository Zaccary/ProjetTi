<?php

class JeuxDB extends Jeux
{

    private $_bd;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getProduitsById_cat($id_cat)
    {
        $query = "select * from vue_jeux_config";
        $query.= " where id_jeux = :id_cat";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->bindValue(':id_cat',$id_cat);
            $resultset->execute();
            $data = $resultset->fetchAll();
            //var_dump($data);
            foreach ($data as $d) {
                $_array[] = new Jeux($d);
            }
            return $_array;
            $this->_bd->commit();
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

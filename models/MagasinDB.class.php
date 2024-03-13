<?php class CategorieDB extends Categorie
{
    private $_db;
    private $_attributs = array();

    public function __construct($db)
    {
        $this->_db = $db;
    }

    public function getAllCategories()
    {
        $query = "select * from categorie";
        try {
            $resultset = $this->_db->prepare($query);
            $resultset->execute();
            $data = $resultset->fetchAll();
            if (count($data) > 0) {
                foreach ($data as $d) {
                    $this->_attributs[] = new Categorie($d);
                }
            }
            if (count($this->_attributs) != 0) {
                return $this->_attributs;
            } else {
                return null;
            }
        } catch (PDOException $e) {
            print "Echec de la requête " . $e->getMessage();
        }
    }

    public function getCategorieById($id_cat)
    {
        print "id_cat : " . $id_cat;
        $query = "select * from categorie where id_categorie = :id_cat";
        try {
            $resultset = $this->_db->prepare($query);
            $resultset->bindValue(':id_cat', $id_cat);
            $resultset->execute();
            $data = $resultset->fetch();
            if (count($data) > 0) {
                $this->_attributs[] = new Categorie($data);
            }
            if ($this->_attributs != null) {
                return $this->_attributs;
            } else {
                return null;
            }
        } catch (PDOException $e) {
            print "Echec de la requête " . $e->getMessage();
        }
    }
}
<?php class ProduitsDB extends Produits
{
    private $_db;
    private $_attributs = array();

    public function __construct($db)
    {
        $this->_db = $db;
    }

    public function getAllProduits()
    {
        $query = "select * from produit";
        try {
            $resultset = $this->_db->prepare($query);
            $resultset->execute();
            $data = $resultset->fetchAll();
            if (count($data) > 0) {
                foreach ($data as $d) {
                    $this->_attributs[] = new Accueil($d);
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

    public function getProduit($id)
    {
        return "coucou du modèle";
    }

    public function getProduitsByIdCat($id_cat)
    {
        $query = "select * from vue_produits_cat_magasin where id_categorie = :id_cat";
        try {
            $resultset = $this->_db->prepare($query);
            $resultset->bindValue(':id_cat', $id_cat);
            $resultset->execute();
            $data = $resultset->fetchAll();
            if (count($data) > 0) {
                foreach ($data as $d) {
                    $this->_attributs[] = new Produits($d);
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
}
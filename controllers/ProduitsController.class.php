<?php class ProduitsController
{
    private $_db;
    private $_prod;

    public function __construct($db)
    {
        $this->_db = $db;
        $this->_prod = new ProduitsDB($db);
    }

    public function afficherProduitsParCategorie($id_cat)
    {
        $produits_cat = $this->_prod->getProduitsByIdCat($id_cat);
        return $produits_cat;
    }

    public function detailproduitDemande($id)
    {
        $leProduit = $this->_prod->getProduit($id);
        return $leProduit;
    }
}
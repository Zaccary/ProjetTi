<?php class CategorieController
{
    private $_categorieDB;
    private $_db;

    public function __construct($db)
    {
        $this->_db = $db;
        $this->_categorieDB = new CategorieDB($this->_db);
    }

    public function afficherCategories()
    {
        $allCat = $this->_categorieDB->getAllCategories();
        return $allCat;
    }

    public function afficherUneCategorie($id)
    {
        $uneCat = $this->_categorieDB->getCategorieById($id);

        return $uneCat;
    }
}
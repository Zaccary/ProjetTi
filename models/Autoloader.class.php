<?php class Autoloader
{ //fonction avec callback
    static function register()
    {
        spl_autoload_register(array(__CLASS__, 'autoload'));
    } //méthode appelée par register()

    static function autoload($classname)
    {
        if (file_exists('models/' . $classname . ".class.php")) {
            require 'models/' . $classname . ".class.php";
        } else if (file_exists('./controllers/' . $classname . ".class.php")) {
            require './controllers/' . $classname . ".class.php";
        }
    }
}
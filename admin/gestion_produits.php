
<?php

require_once '../classes/admin.php';
require_once '../classes/user.php';
require_once '../classes/database.php';

session_start();





if(!isset($_SESSION['user']->getStatus) OR $_SESSION['user']->getStatus != 1){
    exit();
    
}






?>





<html lang="fr">
  
  <body>

    <ul>

    <?php while($p = $products->fetch(PDO::FETCH_ASSOC)) { ?>

        <li> <?= $p['id_product'] ?> : <?= $p['title'] ?> - 
    
        <?php if($p['confirm'] == 0) { ?> 

            <a href="gestion_product_form.php?update=<?= $p['id_product']?>">
            Update</a> - 

            <a href="gestion_product_form.php?supprime=<?= $p['id_product']?>">
            Delete</a>


        <?php }?>
        
        </li>

        <?php } ?>

    </ul>


    <article class="container">

            <a class="waves-effect waves-light white black-text btn-small" href="gestion_product_form.php"> Add new products </a>
        </article>
  </body>

</html>
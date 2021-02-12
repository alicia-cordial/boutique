<?php
require_once('../classes/cart.php');
require_once('../classes/order.php');
$cart = new cart();
$shop = new shop();

/*Traitement vider le panier*/
if (isset($_POST['removeAll'])) {
    $alert = "Are you sure?";
}
if (isset($_POST['confirmremoveAll'])) {
    $cart->deleteCart();
}
var_dump($_POST);
/*Traitement enlever un article*/
if (isset($_POST['removeOne'])) {
    $cart->deleteProduct($_POST['position']);
}

/*Traitement verif stock*/
if (isset($_POST['verifyCart'])) {
    for ($i = 0; $i < count($_SESSION['panier']); $i++) {
        $verif = $cart->verifyStock($i, $_SESSION['panier'][$i]->getId(), $_SESSION['panier'][$i]->getQuantity());
        if ($verif == 'adjustQuantity') {
            $message[] = 'Quantity of ' . $_SESSION['panier'][$i]->getTitle() . ' have been adjusted to fit stock';
        } elseif ($verif == 'deleteProduct') {
            $message[] = 'Product ' . $_SESSION['panier'][$i]->getTitle() . ' have been removed because it was out of stock';
        }
        if (!isset($message)) {
            $success = 'Everything is okay';
        }
    }
}

if (isset($_POST['pay'])) {
    /*REMPLACER PAR SESSION ID*/
    $_SESSION['order'] = new order(1, $cart->getTotal(), date('Y-m-d'));
    $_SESSION['price'] =  $cart->getTotal();
   header('location:payment.php');
}

?>

<!--Si panier rempli-->
<?php if (isset($_SESSION['panier']) and !empty($_SESSION['panier'])) : ?>
    <?php $i = 0;?>
    <!--Affichage produit-->
    <?php foreach ($_SESSION['panier'] as $article) : ?>
        <div>

            <p>Title :<?= $article->getTitle() ?></p>
            <p>Price :<?= $article->getPrice() ?></p>
            <p>Quantity :</p><?= $article->getQuantity() ?></p>
            <form method="post" action="shopcart.php">
                <input type="hidden" name="position" value="<?= $i ?>">
                <input type="submit" name="removeOne" value="Delete">
            </form>
            <?php $i++; ?>
        </div>

    <?php endforeach; ?>

    <!--Affichage total et boutons action-->
    <p>Total : <?= $cart->getTotal() ?></p>

    <!--Affichage boutons vider panier-->
    <form method="post" action="shopcart.php">
        <input type="submit" name="removeAll" value="Empty Cart">
    </form>
    <?php if (isset($alert)) : ?>
        <div>
            <?= $alert ?>
            <form method="post" action="shopcart.php">
                <input type="submit" name="confirmremoveAll" value="Yes">
            </form>
        </div>
    <?php endif; ?>


    <!--Affichage bouton vérifier stock /paiement-->
    <div>
        <form method="post" action="shopcart.php">
            <input type="submit" name="verifyCart" value="Verify Stock">
        </form>
    </div>

    <?php if (isset($message)) : ?>
        <div>
            <?php foreach ($message as $mess) : ?>
                <?= $mess ?>
            <?php endforeach; ?>
        </div>
    <?php elseif (isset($success)) : ?>
        <div>
            <?= $success ?>
            <form method="post" action="shopcart.php">
                <input type="submit" name="pay" value="Pay">
            </form>
        </div>
    <?php endif; ?>

    <!--Si panier vide-->
<?php else : ?>
    <p>Nothing here!</p>
<?php endif; ?>
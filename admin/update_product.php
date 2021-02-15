
<?php

require_once '../classes/admin.php';
require_once '../classes/user.php';
require_once '../classes/product.php';

session_start();


if (!empty($_GET['id']) and is_numeric($_GET['id'])) {
    $id = htmlspecialchars($_GET['id']);

if (isset($_POST['submit'])) {
    $admin = new admin;

    if ($admin->productExists($id)) {

        $reference = htmlspecialchars($_POST['reference']);
        $title = htmlspecialchars($_POST['title']);
        $category = htmlspecialchars($_POST['category']);
        $subcat = htmlspecialchars($_POST['subcat']);
        $description = htmlspecialchars($_POST['description']);
        $shortdesc = htmlspecialchars($_POST['shortdesc']);
        $image = $_FILES['image'];
        $price = htmlspecialchars($_POST['price']);
        $stock = htmlspecialchars($_POST['stock']);
    }


    if (empty($errors)) {

        $_SESSION['admin']->update($reference, $category, $subcat, $title, $description, $shortdesc, $image, $price, $stock);
        $success = "Product has been udpated<a href='produit.php'>Tous les produits</a>";


    }

}
}

?>



<html>

<!--Alerte (erreur ou succès)-->
<?php if (!empty($errors)): ?>
    <div>
        <?php foreach ($errors as $error) {
            echo '<p class="red-text">' . $error . '</p>';
        }
        ?>
    </div>
<?php elseif (isset($success)): ?>
    <div>
        <p class="white-text"><?php echo $success; ?></p>
    </div>
<?php endif; ?><body>



<h1> Products form </h1>


<form method="post" enctype="multipart/form-data" action="update_product.php" >

    <label for="reference">reference</label><br>
    <input type="text" id="reference" name="reference" placeholder="product reference" value="<?php //echo $_SESSION['admin']->getReference(); ?>"> <br><br>


    <label for="category">category</label><br>
    <select name="category" id="category">
        <option value=""> ----- Choose ----- </option>
        <option value="nintendo"> nintendo </option>
        <option value="xbox"> xbox </option>
        <option value="playstation"> playstation </option>
    </select><br><br>

    <label for="subcat">subcategory</label><br>
    <select name="subcat[]"  id=subcat">
        <option value=""> ----- Choose ----- </option>
        <option value="games"> games </option>
        <option value="secondhand"> secondhand </option>
        <option value="consoles"> consoles </option>
    </select><br><br>


    <label for="title">title</label><br>
    <input type="text" id="title" name="title" placeholder="product title" value="<?php // echo $_SESSION['admin']->getTitle(); ?>"> <br><br>

    <label for="description">description</label><br>
    <textarea name="description" id="description" placeholder="product description" value="<?php// echo $_SESSION['admin']->getDescription(); ?>"></textarea><br><br>

    <label for="description">description</label><br>
    <textarea name="shortdescription" id="shortdescription" placeholder="product short description" value="<?php //echo $_SESSION['admin']->getShortdesc(); ?>"></textarea><br><br>

    <label for="picture">picture</label><br>
    <input type="file" id="picture" name="picture"><br><br>

    <label for="price">price</label><br>
    <input type="text" id="price" name="price" placeholder="product price" value="<?php //echo $_SESSION['admin']->getPrice(); ?>"><br><br>

    <label for="stock">stock</label><br>
    <input type="text" id="stock" name="stock" placeholder="product stock" value="<?php //echo $_SESSION['admin']->getStock(); ?>"><br><br>

    <button class="btn waves-effect waves-light black" type="submit" name="submit">
        <i class="material-icons right">send</i>
    </button>

</form>


</body>

</html>
<?php

require_once '../classes/admin.php';
require_once '../classes/user.php';

$title = 'Members';

if (!isset($_SESSION['user']) or $_SESSION['user']->getStatus() != 1) {
    header('location:../pages/connexion.php');
} else {

    $admin = new admin;
}
?>




    <html>

<?php include 'includes/header.php'; ?>

    <h1>All Members</h1>

    <table>
        <thead>
        <tr>
            <th>login</th>
            <th>lastname</th>
            <th>firstname</th>
            <th>email</th>
            <th>city</th>
            <th>zip</th>
            <th>adress</th>
            <th>supprimer</th>


        </tr>
        </thead>

        <tbody>
        <?php foreach ($admin->allMembers() as $user) {


            ?>
            <tr>
                <td><?= $user['login']; ?></td>
                <td><?= $user['lastname']; ?></td>
                <td><?= $user['firstname']; ?></td>
                <td><?= $user['email']; ?></td>
                <td><?= $user['city']; ?></td>
                <td><?= $user['zip']; ?></td>
                <td><?= $user['adress']; ?></td>
                <td>
                    <form method='post' action='delete_member.php'>
                        <input type="hidden" value="<?= $user['id_member'] ?>" name="id">
                        <input type='submit' name='removeUser' value='Delete user'>

                    </form>
                </td>

            </tr>

        <?php } ?>

        </tbody>
    </table>


<?php include 'includes/footer.php'; ?>
-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 26 mars 2021 à 08:14
-- Version du serveur :  5.7.30
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `boutique`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id_category`, `name`) VALUES
(1, 'nintendo'),
(2, 'xbox'),
(3, 'playstation');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id_message` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_message` date NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id_message`, `message`, `date_message`, `id_member`, `title`) VALUES
(2, 'sls,dòsdjs^do\r\njs\r\nd^', '2021-03-05', 2, 'TITLE'),
(3, 'sfsfsfs', '2021-03-24', 2, 'TITLE'),
(4, 'sd', '2021-03-12', 2, 'DJ'),
(5, 'sdij', '2021-03-12', 3, 'TITLE2'),
(6, 'csYour message', '2021-03-01', 1, 'LOL'),
(7, 'Your messageco', '2021-03-01', 1, 'contrôle'),
(8, 'Your message', '2021-03-01', 1, ''),
(9, 'Your message', '2021-03-01', 1, 'sd'),
(10, 'ljd', '2021-03-01', 1, 'f'),
(11, 'sdsdds', '2021-03-01', 1, 'sdsdsdsd');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id_order` int(11) NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `date_register` date NOT NULL,
  `state` enum('being processed','send','delivered') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id_order`, `id_member`, `amount`, `date_register`, `state`) VALUES
(26, 1, 154, '2021-02-11', 'being processed'),
(28, 1, 126, '2021-02-12', 'send'),
(29, 1, 12, '2021-02-17', 'send'),
(30, 1, 17776, '2021-02-27', 'being processed'),
(31, 1, 50, '2021-03-05', 'being processed'),
(32, 1, 50, '2021-03-05', 'being processed'),
(33, 1, 25, '2021-03-23', 'being processed');

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id_order_details` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id_order_details`, `id_order`, `quantity`, `price`, `title`) VALUES
(23, 26, 2, 35, ''),
(24, 26, 2, 42, ''),
(25, 27, 3, 35, ''),
(26, 28, 3, 42, ''),
(27, 31, 1, 50, 'The Legend of Zelda: Link’s Awakening'),
(28, 32, 1, 50, 'The Legend of Zelda: Link’s Awakening'),
(29, 33, 1, 25, 'Taxi Chaos');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id_product` int(3) NOT NULL,
  `reference` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` int(3) NOT NULL,
  `stock` int(3) NOT NULL,
  `shortdesc` text NOT NULL,
  `subcategory` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id_product`, `reference`, `category`, `title`, `description`, `image`, `price`, `stock`, `shortdesc`, `subcategory`) VALUES
(1, 'IIIII', 'nintendo', 'Super Mario 3d World+ Bowser’s Fury', 'The Super Mario 3D World + Bowser’s Fury game features the same great co-op gameplay, creative levels and power-ups as the original game, but with added improvements. In the Super Mario 3D World part of the game, characters move faster and the dash powers up more quickly. Both adventures support the newly added Snapshot Mode—pause the action to get the perfect shot, apply filters, and decorate with stamps!\r\n\r\nIn Super Mario 3D World, choose from Mario, Luigi, Peach, and Toad and set off to save the Sprixie Kingdom. Each character has a distinct playstyle—Luigi can jump extra high and Peach can float for a short time. Rosalina is also available as a playable character later in the game! Jump, dash, and pounce to reach the goal while collecting Green Stars, coins and power-ups.\r\n\r\nCollect stamps throughout your adventure in Super Mario 3D World and use them in Snapshot Mode (in both Super Mario 3D World and the Bowser’s Fury adventure) to create masterpieces to share with friends and family.\r\n\r\nIn Bowser’s Fury, Mario arrives on Lake Lapcat and is confronted with a rampaging Bowser! Join forces with Bowser Jr. and venture through an interconnected world made of cat-themed…well, everything. Enemies, flowers, and even birds take on a feline form.', '106991.jpg', 60, 2, 'Pounce and climb through dozens of colorful courses! Mario (and his friends) can use a variety of power-ups like the Super Bell, which grants catlike abilities like climbing and scratching. Team up with up to three other players locally* or online** to reach the goal and see who can get a high score.', 'games'),
(2, 'AAAAA', 'nintendo', 'The Legend of Zelda: Link’s Awakening', 'Along the way, you’ll meet a hilarious assortment of charming characters to which you’ll never want to say goodbye.\r\n\r\nIn this new version of the game, the classic soundtrack has been reborn with new arrangements, and now you can equip more items at once, review key conversations, and navigate the map in new ways. Try your hand at the renovated mini-games to earn dolls based on the Super Mario series…or Chamber Stones. These unusual stones can be used to arrange your own Chamber Dungeons; each one is a puzzle in and of itself! Place chambers from dungeons found throughout the game on a series of objective-based grids… Where should the bosses go? How do you get from the entrance to the stairwell? They’re your dungeons, so arrange them however you see fit. To earn more Chamber Stones, you must conquer the main adventure’s dungeons and mini-games or tap any amiibo featuring a The Legend of Zelda character to unlock Chambers exclusive to amiibo.', '103132.jpg', 30, 0, 'As Link, you awaken in a strange land away from Hyrule, where animals talk and monsters roam. To uncover the truth behind your whereabouts and rouse the legendary Wind Fish, explore Koholint Island and all its trap-ridden dungeons, reimagined in stunning detail for this new release of one of the most beloved The Legend of Zelda games. ', 'secondhand'),
(5, 'BBBBB', 'nintendo', 'Little nightmares II', 'Return to a world of charming horror in Little Nightmares II, a suspense adventure game in which you play as Mono, a young boy trapped in a world that has been distorted by the humming transmission of a distant tower.  With Six, the girl in the yellow raincoat, as his guide, Mono sets out to discover the dark secrets of The Signal Tower. Their journey won\'t be easy; Mono and Six will face a host of new threats from the terrible residents of this world.  Will you dare to face this collection of new, little nightmares?', '107666.jpg', 42, 0, 'Return to a world of charming horror in Little Nightmares II, a suspense adventure game in which you play as Mono, a young boy trapped in a world that has been distorted by the humming transmission of a distant tower.', 'games'),
(7, 'CCCCC', 'nintendo', 'Animal Crossing: new Horizon', 'If you’re looking to spend quality holiday time with friends and family virtually, special occasions*** such as Turkey Day on Nov. 26 and Toy Day on Dec. 24 will be added with the new update, delivering holiday events that can be experienced with others. It’s a great time of year to welcome visitors over and show off your island while enjoying each other’s company. The winter update also brings new Reactions and hairstyles to Animal Crossing: New Horizons, an upgrade option for expanded in-game home item storage, and save data transfer capabilities.*\r\n\r\n\r\nEscape to a deserted island and create your own paradise as you explore, create, and customize in the Animal Crossing: New Horizons game. Your island getaway has a wealth of natural resources that can be used to craft everything from tools to creature comforts. You can hunt down insects at the crack of dawn, decorate your paradise throughout the day, or enjoy sunset on the beach while fishing in the ocean. The time of day and season match real life, so each day on your island is a chance to check in and find new surprises all year round.\r\n\r\nShow off your island utopia to family and friends—or pack your bags and visit theirs. Whether playing online* or with others beside you**, island living is even better when you can share it. Even without hopping on a flight, you’ll meet a cast of charming animal residents bursting with personality. Friendly faces like Tom Nook and Isabelle will lend their services and happily help you grow your budding community. Escape to your island getaway—however, whenever, and wherever you want.\r\n', '103131.jpg', 55, 0, 'Bundle up, it’s sweater weather! Colder weather may be arriving, but luckily, it’s also ushering in warm holiday cheer in the Animal Crossing: New Horizons game for the Nintendo Switch system. Alongside the auburn-colored maple leaves that are beginning to drift down from the trees, islands located in the Northern Hemisphere will be visited by tranquil blankets of snow', 'games'),
(8, 'DDDDD', 'nintendo', 'Pokemon Shield', 'Eius populus ab incunabulis primis ad usque pueritiae tempus extremum, quod annis circumcluditur fere trecentis, circummurana pertulit bella, deinde aetatem ingressus adultam post multiplices bellorum aerumnas Alpes transcendit et fretum, in iuvenem erectus et virum ex omni plaga quam orbis ambit inmensus, reportavit laureas et triumphos, iamque vergens in senium et nomine solo aliquotiens vincens ad tranquilliora vitae discessit.\r\n\r\nPer hoc minui studium suum existimans Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocque deformi genere mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum.', '110075.jpg', 44, 1, 'Victus universis caro ferina est lactisque abundans copia qua sustentantur, et herbae multiplices et siquae alites capi per aucupium possint, et plerosque mos vidimus frumenti usum et vini penitus ignorantes.', 'games'),
(10, 'EEEEE', 'nintendo', 'Pikmin 3 Deluxe', 'Eius populus ab incunabulis primis ad usque pueritiae tempus extremum, quod annis circumcluditur fere trecentis, circummurana pertulit bella, deinde aetatem ingressus adultam post multiplices bellorum aerumnas Alpes transcendit et fretum, in iuvenem erectus et virum ex omni plaga quam orbis ambit inmensus, reportavit laureas et triumphos, iamque vergens in senium et nomine solo aliquotiens vincens ad tranquilliora vitae discessit.\r\n\r\nPer hoc minui studium suum existimans Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocque deformi genere mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum.', '110075.jpg', 53, 32, 'Victus universis caro ferina est lactisque abundans copia qua sustentantur, et herbae multiplices et siquae alites capi per aucupium possint, et plerosque mos vidimus frumenti usum et vini penitus ignorantes.', 'games'),
(11, 'FFFFF', 'nintendo', 'Kirby Fighters 2', 'Eius populus ab incunabulis primis ad usque pueritiae tempus extremum, quod annis circumcluditur fere trecentis, circummurana pertulit bella, deinde aetatem ingressus adultam post multiplices bellorum aerumnas Alpes transcendit et fretum, in iuvenem erectus et virum ex omni plaga quam orbis ambit inmensus, reportavit laureas et triumphos, iamque vergens in senium et nomine solo aliquotiens vincens ad tranquilliora vitae discessit.\r\n\r\nPer hoc minui studium suum existimans Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocque deformi genere mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum.', '110075.jpg', 33, 2, 'Victus universis caro ferina est lactisque abundans copia qua sustentantur, et herbae multiplices et siquae alites capi per aucupium possint, et plerosque mos vidimus frumenti usum et vini penitus ignorantes.', 'games'),
(12, 'GGGGG', 'nintendo', 'Xenoblade Chronicles: Definitive Edition', 'Eius populus ab incunabulis primis ad usque pueritiae tempus extremum, quod annis circumcluditur fere trecentis, circummurana pertulit bella, deinde aetatem ingressus adultam post multiplices bellorum aerumnas Alpes transcendit et fretum, in iuvenem erectus et virum ex omni plaga quam orbis ambit inmensus, reportavit laureas et triumphos, iamque vergens in senium et nomine solo aliquotiens vincens ad tranquilliora vitae discessit.\r\n\r\nPer hoc minui studium suum existimans Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocque deformi genere mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum.', '110075.jpg', 65, 0, 'Victus universis caro ferina est lactisque abundans copia qua sustentantur, et herbae multiplices et siquae alites capi per aucupium possint, et plerosque mos vidimus frumenti usum et vini penitus ignorantes.', 'games'),
(13, 'JJJJJ', 'nintendo', 'Luigi\'s Mansion 3', 'Eius populus ab incunabulis primis ad usque pueritiae tempus extremum, quod annis circumcluditur fere trecentis, circummurana pertulit bella, deinde aetatem ingressus adultam post multiplices bellorum aerumnas Alpes transcendit et fretum, in iuvenem erectus et virum ex omni plaga quam orbis ambit inmensus, reportavit laureas et triumphos, iamque vergens in senium et nomine solo aliquotiens vincens ad tranquilliora vitae discessit.\r\n\r\nPer hoc minui studium suum existimans Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocque deformi genere mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum.', '110075.jpg', 70, 4, 'Victus universis caro ferina est lactisque abundans copia qua sustentantur, et herbae multiplices et siquae alites capi per aucupium possint, et plerosque mos vidimus frumenti usum et vini penitus ignorantes.', 'games'),
(14, 'HHHHH', 'nintendo', 'DRAGON QUEST XI S: Echoes of an Elusive Age ', 'Eius populus ab incunabulis primis ad usque pueritiae tempus extremum, quod annis circumcluditur fere trecentis, circummurana pertulit bella, deinde aetatem ingressus adultam post multiplices bellorum aerumnas Alpes transcendit et fretum, in iuvenem erectus et virum ex omni plaga quam orbis ambit inmensus, reportavit laureas et triumphos, iamque vergens in senium et nomine solo aliquotiens vincens ad tranquilliora vitae discessit.\r\n\r\nPer hoc minui studium suum existimans Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocque deformi genere mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum.', '110075.jpg', 70, 2, 'Victus universis caro ferina est lactisque abundans copia qua sustentantur, et herbae multiplices et siquae alites capi per aucupium possint, et plerosque mos vidimus frumenti usum et vini penitus ignorantes.', 'games'),
(15, 'KKKKK', 'nintendo', 'Nintendo Switch', 'Also includes all the extras you need to get started. Model number: HAC-001(-01) (product serial number begins with “XKW”) This model includes battery life of approximately 4.5 - 9 hours. The battery life will depend on the games you play. For instance, the battery will last approximately 5.5 hours for The Legend of Zelda: Breath of the Wild (games sold separately).\r\n\r\nIntroducing Nintendo Switch, the new home video game system from Nintendo. In addition to providing single and multiplayer thrills at home, the Nintendo Switch system can be taken on the go so players can enjoy a full home console experience anytime, anywhere. The mobility of a handheld is now added to the power of a home gaming system, with unprecedented new play styles brought to life by the two new Joy-Con controllers.', '61-PblYntsL._AC_SL1500_.jpg', 299, 10, 'Get the gaming system that lets you play the games you want, wherever you are, however you like. Includes the Nintendo Switch console and Nintendo Switch dock in black, with contrasting left and right Joy‑Con controllers-one red, one blue.', 'consoles'),
(16, 'AAAAA', 'nintendo', 'The Legend of Zelda: Link’s Awakening', 'Along the way, you’ll meet a hilarious assortment of charming characters to which you’ll never want to say goodbye.\r\n\r\nIn this new version of the game, the classic soundtrack has been reborn with new arrangements, and now you can equip more items at once, review key conversations, and navigate the map in new ways. Try your hand at the renovated mini-games to earn dolls based on the Super Mario series…or Chamber Stones. These unusual stones can be used to arrange your own Chamber Dungeons; each one is a puzzle in and of itself! Place chambers from dungeons found throughout the game on a series of objective-based grids… Where should the bosses go? How do you get from the entrance to the stairwell? They’re your dungeons, so arrange them however you see fit. To earn more Chamber Stones, you must conquer the main adventure’s dungeons and mini-games or tap any amiibo featuring a The Legend of Zelda character to unlock Chambers exclusive to amiibo.', '103132.jpg', 50, 0, 'As Link, you awaken in a strange land away from Hyrule, where animals talk and monsters roam. To uncover the truth behind your whereabouts and rouse the legendary Wind Fish, explore Koholint Island and all its trap-ridden dungeons, reimagined in stunning detail for this new release of one of the most beloved The Legend of Zelda games. ', 'games'),
(17, 'Taxi Chaos', 'playstation', 'Taxi Chaos', 'Power through midtown in a strong muscle car, race past all parks in an exotic supercar or drift around the business area in a Japanese tuner taxi. Whicher you choose - your challenge is to deliver your passengers on time! At least, if you want to make any money.\r\n\r\nNavigate through crowded streets, dodge pedestrians across sidewalks or even defy the laws of gravity by jumping over rooftops! Nothing is too extreme when it comes to delivering your passengers on time! Discover the best shortcuts and get to know New Yellow City (NYC), as well as your passengers, like the back of your hand.', 'sddefault.jpg', 25, 1, 'Power through midtown in a strong muscle car, race past all parks in an exotic supercar or drift around the business area in a Japanese tuner taxi. Whicher you choose - your challenge is to deliver your passengers on time! At least, if you want to make any money.\r\n\r\nNavigate through crowded streets, d', 'games'),
(18, 'Xbox X', 'xbox', 'Xbox X', 'Voici la Xbox Series X, notre console la plus rapide et la plus puissante jamais conçue, pour une génération de consoles qui vous place, vous, le joueur, au centre.', 'Console-Microsoft-Xbox-Series-X-Noir.jpg', 500, 5, 'Voici la Xbox Series X, notre console la plus rapide et la plus puissante jamais conçue, pour une génération de consoles qui vous place, vous, le joueur, au centre.', 'consoles'),
(19, 'Xbox S', 'xbox', 'Xbox S', 'La console Xbox One S (« slim ») a tout d\'une grande. Plus fine que les autres modèles, elle possède jusqu\'à 2 To de stockage. Elle est également dotée de la technologie HDR, pour des couleurs plus lumineuses et un rendu à l\'écran sans précédent, mais aussi d\'une résolution quatre fois plus importante que la résolution HD, vous permettant ainsi de visionner des Blu-ray 4k ! ', 'b7414f03-9878-4ed3-a9a4-b4ab8f19ca97.jpg', 300, 5, 'La console Xbox One S (« slim ») a tout d\'une grande. Plus fine que les autres modèles, elle possède jusqu\'à 2 To de stockage. Elle est également dotée de la technologie HDR, pour des couleurs plus lumineuses et un rendu à l\'écran sans précédent, mais aussi d\'une résolution quatre fois plus importan', 'consoles'),
(20, 'Xbox S', 'xbox', 'SECONDHAND box S', 'La console Xbox One S (« slim ») a tout d\'une grande. Plus fine que les autres modèles, elle possède jusqu\'à 2 To de stockage. Elle est également dotée de la technologie HDR, pour des couleurs plus lumineuses et un rendu à l\'écran sans précédent, mais aussi d\'une résolution quatre fois plus importante que la résolution HD, vous permettant ainsi de visionner des Blu-ray 4k !', '2.jpg', 40, 3, 'La console Xbox One S (« slim ») a tout d\'une grande. Plus fine que les autres modèles, elle possède jusqu\'à 2 To de stockage. Elle est également dotée de la technologie HDR, pour des couleurs plus lumineuses et un rendu à l\'écran sans précédent, mais aussi d\'une résolution quatre fois plus importan', 'secondhand'),
(21, 'Blastful', 'playstation', 'Blastful', 'Blastful is a fast-paced arcade shoot-em-up.\r\n*Enjoy crazy shooting action in procedurally generated visuals with retro style.\r\n*Cyberpunk flavored techno-beats.\r\n*Blast your way through 10 different types of enemies with 5 different weapons.', 'blastful.jpeg', 14, 3, 'Blastful is a fast-paced arcade shoot-em-up.\r\n*Enjoy crazy shooting action in procedurally generated visuals with retro style.\r\n*Cyberpunk flavored techno-beats.\r\n*Blast your way through 10 different types of enemies with 5 different weapons.', 'games'),
(22, 'Dungeons AND Bombs', 'playstation', 'Dungeons AND Bombs', 'This is dynamic fusion of classic puzzles with boxes and bombs. When enemies drag people into their dark lair and do their vile deeds there, the hero and his faithful sword always come to the rescue. But what if the hero does not have a sword, but only a lot of enthusiasm and an endless supply of explosives? Well, bad for them. Go through dark labyrinths of dungeons and try not to blast yourself up!\r\n\r\n*Cyberpunk flavored techno-beats.\r\n*Blast your way through 10 different types of enemies with 5 different weapons.', 'Dungeons &amp; Bombs .jpeg', 10, 4, 'This is dynamic fusion of classic puzzles with boxes and bombs. When enemies drag people into their dark lair and do their vile deeds there, the hero and his faithful sword always come to the rescue. But what if the hero does not have a sword, but only a lot of enthusiasm and an endless supply of ex', 'games');

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `id_review` int(11) NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `message_review` varchar(255) NOT NULL,
  `date_review` date NOT NULL,
  `note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `review`
--

INSERT INTO `review` (`id_review`, `id_member`, `message_review`, `date_review`, `note`) VALUES
(1, 2, 'sdsdsdsd', '2021-03-03', 2),
(2, 3, 'dffdf', '2021-03-03', 0),
(3, 3, 'LOVE', '2021-03-04', 0),
(4, 3, 'LOVE', '2021-03-04', 0),
(5, 1, 'COOL', '2021-03-07', 5),
(6, 1, 'good', '2021-03-07', 5);

-- --------------------------------------------------------

--
-- Structure de la table `subcategory`
--

CREATE TABLE `subcategory` (
  `id_subcategory` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `subcategory`
--

INSERT INTO `subcategory` (`id_subcategory`, `name`) VALUES
(1, 'secondhand'),
(2, 'games'),
(3, 'consoles');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_member` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `zip` int(5) UNSIGNED ZEROFILL NOT NULL,
  `adress` varchar(50) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `newsletter` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_member`, `login`, `password`, `lastname`, `firstname`, `email`, `city`, `zip`, `adress`, `status`, `avatar`, `newsletter`) VALUES
(1, 'admin', '$2y$10$R8HHF15lCT6oD8l7TKMBJuzAPGTOdZV7lWD5NOKyjFOjjcM.oPPAS', 'admin', 'admin', 'admin@hotmail.fr', 'Marseille', 13001, '8 rue d\'Hozier', 1, '', 'yes'),
(2, 'ali', '$2y$10$NjkANR7H11C.jXfXpzIX0.Q2td7aMar1Jq5VVIT/52EfH.P4gTwZS', 'ali', 'ali', 'alicia.cordial@gmail.com', 'Lyon', 69006, '', 0, '123398861_1454561721399525_6939529384045067753_o.jpg', 'yes'),
(3, 'rara', '$2y$10$Rc4XhI2FcaCVgY5FmeIiWemr0b.V8kEl3skoSsr1wJ54gt6U72m1u', 'rara', 'rara', 'rara@gmail.com', 'Paris', 75020, '14 avenue stendhal', 0, 'E622532D-391E-44F6-BA7E-A42984B0C884.jpeg', 'yes');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_message`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id_order_details`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id_review`);

--
-- Index pour la table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id_subcategory`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_member`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id_order_details` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id_subcategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

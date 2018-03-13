
USE `home_food_service`;
DELETE FROM `category` WHERE id > 0;
INSERT INTO `category` VALUES 
(1,'No category','Pas de catégorie',''),
(2,'Italian','Italien','italian_pic.jpg'),
(3,'Greek','Grec','greek_pic.jpg'),
(4,'Chinese','Chinois','chinese_pic.jpg'),
(5,'Indian','Indien','indian_pic.jpg'),
(6,'Drinks','Boissons',''),
(7,'Dessert ','Déserts','');


DELETE FROM `item` WHERE id > 0;
INSERT INTO `item` VALUES 
(1,'Breaded Eggplant Rollatini',11.99,'eggplant, egg, beaten, seasoned bread crumbs,olive oil, ricotta cheese.','',1,2,'Rollatini aubergines panées','aubergine, oeuf, battu, chapelure assaisonnée, huile des olive, fromage ricotta.','italian_food_breaded_egg.jpg'),
(2,'Breaded Eggplant Rollatini',14.99,'eggplant, egg, beaten, seasoned bread crumbs,olive oil, ricotta cheese.','',2,2,'Rollatini aubergines panées','aubergine, oeuf, battu, chapelure assaisonnée, huile des olive, fromage ricotta.','italian_food_breaded_egg.jpg'),
(3,'Breaded Eggplant Rollatini',17.99,'eggplant, egg, beaten, seasoned bread crumbs,olive oil, ricotta cheese.','',3,2,'Rollatini aubergines panées','aubergine, oeuf, battu, chapelure assaisonnée, huile des olive, fromage ricotta.','italian_food_breaded_egg.jpg'),
(4,'Chicken Lasagna',15.75,' The ricotta, chicken, noodles , sauce mixture, spinach, mozzarella cheese and Parmesan cheese','',1,2,'Lasagne au poulet','La ricotta, poulet, nouilles, mélange de sauce, épinards, fromage mozzarella et parmesan.','italian_food_lasagna.jpg'),
(5,'Chicken Lasagna',17.75,' The ricotta, chicken, noodles , sauce mixture, spinach, mozzarella cheese and Parmesan cheese','',2,2,'Lasagne au poulet','La ricotta, poulet, nouilles, mélange de sauce, épinards, fromage mozzarella et parmesan.','italian_food_lasagna.jpg'),
(6,'Chicken Lasagna',19.75,' The ricotta, chicken, noodles , sauce mixture, spinach, mozzarella cheese and Parmesan cheese','',3,2,'Lasagne au poulet','La ricotta, poulet, nouilles, mélange de sauce, épinards, fromage mozzarella et parmesan.','italian_food_lasagna.jpg'),
(7,'Stracciatella Soup ',12.00,'Chicken broth, eggs, freshly grated Parmesan,chopped flat-leaf parsley,chopped fresh basil leaves,spinach leaves, cut in thin strips. Salt and freshly ground black pepper.','',1,2,'Soupe Stracciatella','Bouillon de poulet, œufs, parmesan fraîchement râpé, persil plat haché, feuilles de basilic frais hachées, feuilles des épinard, coupées en fines lanières. Sel et poivre noir fraîchement moulu.','italian_food_soup.jpg'),
(8,'Stracciatella Soup ',14.00,'Chicken broth, eggs, freshly grated Parmesan,chopped flat-leaf parsley,chopped fresh basil leaves,spinach leaves, cut in thin strips. Salt and freshly ground black pepper.','',2,2,'Soupe Stracciatella','Bouillon de poulet, œufs, parmesan fraîchement râpé, persil plat haché, feuilles de basilic frais hachées, feuilles des épinard, coupées en fines lanières. Sel et poivre noir fraîchement moulu.','italian_food_soup.jpg'),
(9,'Stracciatella Soup ',16.00,'Chicken broth, eggs, freshly grated Parmesan,chopped flat-leaf parsley,chopped fresh basil leaves,spinach leaves, cut in thin strips. Salt and freshly ground black pepper.','',3,2,'Soupe Stracciatella','Bouillon de poulet, œufs, parmesan fraîchement râpé, persil plat haché, feuilles de basilic frais hachées, feuilles des épinard, coupées en fines lanières. Sel et poivre noir fraîchement moulu.','italian_food_soup.jpg'),
(10,'chicken and vegetables ',7.99,'chicken, for which the diced chicken is covered with cornstarch, and vegetables, sweet and sour sauce and mashed garlic are added.','',1,2,'Poulet et légumes grillé',' poulet, pour lequel le poulet coupé en dés est recouvert de fécule de maïs, et des légumes, sauce aigre-douce et purée des ail sont ajoutés.','vagi.jpg'),
(11,'chicken and vegetables ',9.99,'chicken, for which the diced chicken is covered with cornstarch, and vegetables, sweet and sour sauce and mashed garlic are added.','',2,2,'Poulet et légumes grillé',' poulet, pour lequel le poulet coupé en dés est recouvert de fécule de maïs, et des légumes, sauce aigre-douce et purée des ail sont ajoutés.','vagi.jpg'),
(12,'chicken and vegetables ',11.99,'chicken, for which the diced chicken is covered with cornstarch, and vegetables, sweet and sour sauce and mashed garlic are added.','',3,2,'Poulet et légumes grillé',' poulet, pour lequel le poulet coupé en dés est recouvert de fécule de maïs, et des légumes, sauce aigre-douce et purée des ail sont ajoutés.','vagi.jpg'),
(13,'greek salad ',  9.99,'lettuce, olives, cheese, cucumber, tomatoes, onion,peppers and dressing.','',1,3,'salade grecque ','laitue, olives, fromage, concombre, tomates, oignon, poivrons et vinaigrette.','Greek_Salad.jpg'),
(14,'greek salad ',  11.99,'lettuce, olives, cheese, cucumber, tomatoes, onion,peppers and dressing.','',2,3,'salade grecque','laitue, olives, fromage, concombre, tomates, oignon, poivrons et vinaigrette.','Greek_Salad.jpg'),
(15,'greek salad ',  15.99,'lettuce, olives, cheese, cucumber, tomatoes, onion,peppers and dressing.','',3,3,'salade grecque','laitue, olives, fromage, concombre, tomates, oignon, poivrons et vinaigrette.','Greek_Salad.jpg'),
(16,'Gigantes Plaki - White beans',9.99,'Greek extra virgin olive oil ,Spanish onion. Onion, garlic cloves, finely chopped,tomato purée.','',1,3,'Gigantes Plaki - Haricots blancs','Huile des olive extra vierge grecque, oignon espagnol. Oignon, gousses des ail, hachées finement, purée de tomates','greek_food_gigantes.jpg'),
(17,'Gigantes Plaki - White beans',11.99,'Greek extra virgin olive oil ,Spanish onion. Onion, garlic cloves, finely chopped,tomato purée.','',2,3,'Gigantes Plaki - Haricots blancs','Huile des olive extra vierge grecque, oignon espagnol. Oignon, gousses des ail, hachées finement, purée de tomates','greek_food_gigantes.jpg'),
(18,'Gigantes Plaki - White beans',12.99,'Greek extra virgin olive oil ,Spanish onion. Onion, garlic cloves, finely chopped,tomato purée.','',3,3,'Gigantes Plaki - Haricots blancs','Huile des olive extra vierge grecque, oignon espagnol. Oignon, gousses des ail, hachées finement, purée de tomates','greek_food_gigantes.jpg'),
(19,'Grape Leaves',7.75,'fresh grape leaves,  extra-virgin olive oil, large white onion, large spring onions, rice','',1,3,'Feuilles de vigne','feuilles de vigne fraîches, huile des olive extra-vierge, gros oignon blanc, gros oignons, riz','greek_food_leaves.jpg'),
(20,'Grape Leaves',9.75,'fresh grape leaves,  extra-virgin olive oil, large white onion, large spring onions, rice','',2,3,'Feuilles de vigne','feuilles de vigne fraîches, huile des olive extra-vierge, gros oignon blanc, gros oignons, riz','greek_food_leaves.jpg'),
(21,'Grape Leaves',10.75,'fresh grape leaves,  extra-virgin olive oil, large white onion, large spring onions, rice','',3,3,'Feuilles de vigne','feuilles de vigne fraîches, huile des olive extra-vierge, gros oignon blanc, gros oignons, riz','greek_food_leaves.jpg'),
(22,'Grilled Chicken Salad',10.25,'garlic powder, cumin, coriander, smoked paprika, sea salt, pepper, and olive oil, lettuce,tomato ,cucumber.','',1,3,'Salade de poulet grillé','poudre des ail, cumin, coriandre, paprika fumé, sel de mer, poivre et huile des olive, laitue, tomate, concombre.','greek_food_salad.jpg'),
(23,'Grilled Chicken Salad',12.25,'garlic powder, cumin, coriander, smoked paprika, sea salt, pepper, and olive oil, lettuce,tomato ,cucumber.','',2,3,'Salade de poulet grillé','poudre des ail, cumin, coriandre, paprika fumé, sel de mer, poivre et huile des olive, laitue, tomate, concombre.','greek_food_salad.jpg'),
(24,'Grilled Chicken Salad',14.75,'garlic powder, cumin, coriander, smoked paprika, sea salt, pepper, and olive oil, lettuce,tomato ,cucumber.','',3,3,'Salade de poulet grillé','poudre des ail, cumin, coriandre, paprika fumé, sel de mer, poivre et huile des olive, laitue, tomate, concombre.','greek_food_salad.jpg'), 
(25,'Noodles',3.88,'Rice noodles, Onion,Red pepper,Snow peas,Curry, Lime juice,Garlic','',1,4,'Nouilles','Nouilles de riz, oignon, poivron rouge, pois mange-tout, curry, jus de citron vert, ai','chinese_food_noodle.jpg'),
(26,'Noodles',5.88,'Rice noodles, Onion,Red pepper,Snow peas,Curry, Lime juice,Garlic','',2,4,'Nouilles','Nouilles de riz, oignon, poivron rouge, pois mange-tout, curry, jus de citron vert, ai','chinese_food_noodle.jpg'),
(27,'Noodles',7.88,'Rice noodles, Onion,Red pepper,Snow peas,Curry, Lime juice,Garlic','',3,4,'Nouilles','Nouilles de riz, oignon, poivron rouge, pois mange-tout, curry, jus de citron vert, ai','chinese_food_noodle.jpg'),
(28,'Ramen',7.88,'chicken, noodles, spinach, sweetcorn and eggs to make this moreish Japanese noodle soup','',1,4,'Ramen','poulet,  nouilles, épinards, japonaise plus nouille aux nouilles  ','chinese_food_ramen.jpg'),
(29,'Ramen',9.99,'chicken, noodles, spinach, sweetcorn and eggs to make this moreish Japanese noodle soup','',2,4,'Ramen',' poulet, nouilles, épinards, japonaise plus nouille aux nouilles','chinese_food_ramen.jpg'),
(30,'Ramen',10.99,'chicken, noodles, spinach, sweetcorn and eggs to make this moreish Japanese noodle soup','',3,4,'Ramen','poulet, nouilles, épinards, japonaise plus nouille aux nouilles ','chinese_food_ramen.jpg'),
(31,'Sushi',7.88,' smoked salmon instead of imitation crabmeat. Serve with teriyaki sauce and wasabi','',1,4,'sushis','saumon fumé au lieu des imitation de chair de crabe. Servir avec une sauce teriyaki et du wasabi','chinese_food_sushi.jpg'),
(32,'Sushi',10.38 ,' smoked salmon instead of imitation crabmeat. Serve with teriyaki sauce and wasabi','',2,4,'sushis','saumon fumé au lieu des imitation de chair de crabe. Servir avec une sauce teriyaki et du wasabi','chinese_food_sushi.jpg'),
(33,'Sushi',12.38 ,' smoked salmon instead of imitation crabmeat. Serve with teriyaki sauce and wasabi','',3,4,'sushis','saumon fumé au lieu des imitation de chair de crabe. Servir avec une sauce teriyaki et du wasabi','chinese_food_sushi.jpg'),
(34,'Chinese Chicken Salad',  9.99,'lettuce, red cabbage, chicken, mandarin oranges, crushed ramen noodles, carrot, green onions, and sliced almonds.','',1,4,' Salade de poulet Chinoise','laitue, chou rouge, poulet, mandarines, nouilles ramen écrasées, carottes, oignons verts et amandes tranchées.','india.jpg'),
(35,'Chinese Chicken Salad',  10.99,'lettuce, red cabbage, chicken, mandarin oranges, crushed ramen noodles, carrot, green onions, and sliced almonds.','',2,4,' Salade de poulet Chinoise','laitue, chou rouge, poulet, mandarines, nouilles ramen écrasées, carottes, oignons verts et amandes tranchées.','india.jpg'),
(36,'Chinese Chicken Salad',  11.99,'lettuce, red cabbage, chicken, mandarin oranges, crushed ramen noodles, carrot, green onions, and sliced almonds.','',3,4,'Salade de poulet Chinoise','laitue, chou rouge, poulet, mandarines, nouilles ramen écrasées, carottes, oignons verts et amandes tranchées.','india.jpg'),
(37,'Chicken Biryani',9.75,'Rice, Indian spices, Vegetables, Meat, Egg, Yoghurt, Dried Fruits','',1,5,'poulet Biryani','Riz, épices indiennes, légumes, viande, oeufs, yogourt, fruits séchés','indian_food_biriani.jpg'),
(38,'Chicken Biryani',13.45 ,'Rice, Indian spices, Vegetables, Meat, Egg, Yoghurt, Dried Fruits','',2,5,'poulet Biryani','Riz, épices indiennes, légumes, viande, oeufs, yogourt, fruits séchés','indian_food_biriani.jpg'),
(39,'Chicken Biryani',15.45 ,'Rice, Indian spices, Vegetables, Meat, Egg, Yoghurt, Dried Fruits','',3,5,'poulet Biryani','Riz, épices indiennes, légumes, viande, oeufs, yogourt, fruits séchés','indian_food_biriani.jpg'),
(40,'Bhaji',7.75,'Pav, Potatoes, Tomatoes, Onions, Mixed vegetables','',1,5,'Bhaji','Pav, pommes de terre, tomates, oignons, légumes variés','indian_food_bhaji.jpg'),
(41,'Bhaji',9.75,'Pav, Potatoes, Tomatoes, Onions, Mixed vegetables','',2,5,'Bhaji','Pav, pommes de terre, tomates, oignons, légumes variés','indian_food_bhaji.jpg'),
(42,'Bhaji',11.50,'Pav, Potatoes, Tomatoes, Onions, Mixed vegetables','',3,5,'Bhaji','Pav, pommes de terre, tomates, oignons, légumes variés','indian_food_bhaji.jpg'),
(43,'lamb kabob and Naan ',7.75,'Rice, Vegetables,lamb Meat with ,Indian spices and Naan ','',1,5,'Agneau Kabob et Naan','Faites frire les dals, les épices, les oignons et les ail, en trempant le tamarin avec de les eau et le jaggery.','indian_foodklamb.jpg'),
(44,'lamb kabob and Naan ',9.75,'Rice, Vegetables,lamb Meat with ,Indian spices and Naan','',2,5,'Agneau Kabob et Naan','Faites frire les dals, les épices, les oignons et les ail, en trempant le tamarin avec de les eau et le jaggery.','indian_foodklamb.jpg'),
(45,'lamb kabob and Naan ',10.25,'Rice, Vegetables,lamb Meat with ,Indian spices and Naan','',3,5,'Agneau Kabob et Naan','Faites frire les dals, les épices, les oignons et les ail, en trempant le tamarin avec de les eau et le jaggery.','indian_foodklamb.jpg'),
(46,'Kuzhambu',7.75,'Fried the dals, spices, onions, and garlic,soaking tamarind with water, and jaggery. ','',1,5,'Kuzhambu','Faites frire les dals, les épices, les oignons et les ail, en trempant le tamarin avec de les eau et le jaggery.','indian_food_kuzhambu.jpg'),
(47,'Kuzhambu',9.75,'Fried the dals, spices, onions, and garlic,soaking tamarind with water, and jaggery. ','',2,5,'Kuzhambu','Faites frire les dals, les épices, les oignons et les ail, en trempant le tamarin avec de les eau et le jaggery.','indian_food_kuzhambu.jpg'),
(48,'Kuzhambu',10.25,'Fried the dals, spices, onions, and garlic,soaking tamarind with water, and jaggery. ','',3,5,'Kuzhambu','Faites frire les dals, les épices, les oignons et les ail, en trempant le tamarin avec de les eau et le jaggery.','indian_food_kuzhambu.jpg'),
(49,'Fresh Juice',3.25,'Mango,Orange ,Pineapple,Lemon.','',1,6,'Fruit Frais','Mangue, Orange, Ananas, Citron','juice.jpg'),
(50,'Pumpkin and Banana Smoothie',5.25,'fresh Pumpkin,Banana and honey','',1,6,'(Smoothie à la citrouille et aux bananes','Citrouille fraîche, banane et miel','Orange_Juice.jpg'),
(51,'Tropical Avocado Smoothie',6.25,'ice and garnish with grated lemon. Great for avocado lovers.','',1,6,'(Smoothie des avocat tropical','glacer et garnir de citron râpé. Idéal pour les amateurs des avocat.','Avocado_Smoothie.jpg'),
(52,'Mango and Pumpkin Smoothie',7.25,'mango, pumpkin, carrot juice, honey and cinnamon and spinach.','',1,6,'(Smoothie à la mangue et à la citrouille','mangue, citrouille, jus de carotte, miel et cannelle et épinards.','pumpkin.jpg'),
(53,'Gingerbread Chai Coffee',3.25,'fresh Pumpkin,Banana and honey','',1,6,'(Café Chai au pain des épice','La saveur de pain des épice dans ce thé chai vous fera sentir chaud et confortable à les intérieur.','Gingerbread_Chai_Coffee.jpg'),
(54,'French Vanilla Mocha',5.25,'a delightful hot treat and perfect when you need a little pick-me-up.','',1,6,'(Moka à la vanille française','un délice chaud délicieux et parfait quand vous avez besoin des un petit remontant.','Gingerbread_Chai_Coffee.jpg'),
(55,'Cinnamon Hot Cocoa',4.25,'rich, creamy and comforting,cinnamon, chocolate bits and whipped cream.','',1,6,'(Chocolat chaud à la cannelle','riche, crémeux et réconfortant, cannelle, morceaux de chocolat et crème fouettée.','Snow_Capped_Cinnamon_Hot Cocoa.jpg'),
(56,'Mocha Ice Cream Pie',7.25,'Black Bottom Mocha Ice Cream Pie is perfect for summertime entertaining full of fantastic flavor.','',1,7,'Tarte à la crème glacée au moka','La tarte à la crème glacée moka à fond noir est parfaite pour les réceptions estivales. Cest facile à faire et plein de saveur fantastique.','Mocha_Ice_Cream_Pie.jpg'),
(57,'Chocolate-Peanut Butter Cake',10.25,'chopped Baby Ruth and butter,Combine evaporated milk, sugar, coconut, peanuts and egg yolks in medium bowl.','',1,7,'Gâteau au chocolat et beurre des arachide','émincé de bébé Ruth et de beurre, mélanger le lait évaporé, le sucre, la noix de coco, les arachides et les jaunes des oeufs dans un bol moyen','Chocolate_Peanut_Butter_Cake.jpg'),
(58,'Bread Pudding',8.25,'  Brown sugar, cinnamon and nutmeg, Bread Pudding with whipped cream.','',1,7,'Pouding au pain','   Sucre brun, cannelle et muscade, pouding au pain avec crème fouettée.    ','Bread_Pudding.jpg'),
(59,'White Chip Chocolate Cookies',9.25,'  Delicious and stylish White Chip Chocolate Cookies.','',1,7,'Biscuits au chocolat à la puce blanche','Délicieux et élégant biscuits au chocolat blanc aux pépites.','Chocolate_Cookies.jpg'),
(60,'Chocolate Raspberry Lava Cakes',9.25,'  start a celebrate than with this chocolate raspberry lava cake! .','',1,7,'Gâteaux au chocolat et aux framboises','Commencez une fête avec ce gâteau au chocolat et aux framboises!.','Lava_Cakes.jpg');

DELETE FROM `size` WHERE id > 0;
INSERT INTO `size` VALUES (1,'Small','Petit'),(2,'Regular','Moyen'),(3,'Large','Grand');

DELETE FROM `stage` WHERE id > 0;
INSERT INTO `stage` VALUES 
(1,'Open','Ouvert'),
(2,'Preparing','Préparation'),
(3,'Ready','Prêt'),
(4,'Out for delivery','En cours de livraison'),
(5,'Delivered','Livré');


DROP VIEW IF EXISTS `view_fr`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_fr` AS select `item`.`id` AS `id`,`item`.`image` AS `image`,`item`.`name_fr` AS `name`,`item`.`price` AS `price`,`item`.`description_fr` AS `description`,`item`.`ingredients` AS `ingredients`,`size`.`name_fr` AS `size`,`category`.`name_fr` AS `category` from ((`item` join `size` on((`item`.`size_id` = `size`.`id`))) join `category` on((`item`.`category_id` = `category`.`id`))) order by `item`.`id`;


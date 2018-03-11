
USE `home_food_service`;
DELETE FROM `category` WHERE id > 0;
INSERT INTO `category` VALUES 
(1,'No category','Pas de catégorie',''),
(2,'Italian','Italian','italian_pic.jpg'),
(3,'Greek','Greek','greek_pic.jpg'),
(4,'Chinese','Chinese','chinese_pic.jpg'),
(5,'Indian','Indian','indian_pic.jpg'),
(6,'Drinks','Boissons',''),
(7,'Deserts','Déserts',''),
(8,'Souce','Souuce',''),
(9,'Salads','Saladas',''),
(10,'Sides','Côtés','');


DELETE FROM `item` WHERE id > 0;
INSERT INTO `item` VALUES 
(1,'Breaded Eggplant Rollatini',11.99,'Discription','',1,2,'Rollatini aubergines panées','French Description','italian_food_breaded_egg.jpg'),
(2,'Breaded Eggplant Rollatini',14.99,'Discription','',2,2,'Rollatini aubergines panées','French Description','italian_food_breaded_egg.jpg'),
(3,'Breaded Eggplant Rollatini',17.99,'Discription','',3,2,'Rollatini aubergines panées','French Description','italian_food_breaded_egg.jpg'),
(4,'Chicken Lasagna',15.75,'Discription','',1,2,'Lasagne au poulet','French Description','italian_food_lasagna.jpg'),
(5,'Chicken Lasagna',17.75,'Discription','',2,2,'Lasagne au poulet','French Description','italian_food_lasagna.jpg'),
(6,'Chicken Lasagna',19.75,'Discription','',3,2,'Lasagne au poulet','French Description','italian_food_lasagna.jpg'),
(7,'Stracciatella Soup ',12.00,'Discription','',1,2,'Soupe Stracciatella','French Description','italian_food_soup.jpg'),
(8,'Stracciatella Soup ',14.00,'Discription','',2,2,'Soupe Stracciatella','French Description','italian_food_soup.jpg'),
(9,'Stracciatella Soup ',16.00,'Discription','',3,2,'Soupe Stracciatella','French Description','italian_food_soup.jpg'),
(10,'Gigantes Plaki - White beans',9.99,'Discription','',1,3,'Gigantes Plaki - Haricots blancs','French Description','greek_food_gigantes.jpg'),
(11,'Gigantes Plaki - White beans',11.99,'Discription','',2,3,'Gigantes Plaki - Haricots blancs','French Description','greek_food_gigantes.jpg'),
(12,'Gigantes Plaki - White beans',12.99,'Discription','',3,3,'Gigantes Plaki - Haricots blancs','French Description','greek_food_gigantes.jpg'),
(13,'Grape Leaves',7.75,'Discription','',1,3,'Feuilles de vigne','French Description','greek_food_leaves.jpg'),
(14,'Grape Leaves',9.75,'Discription','',2,3,'Feuilles de vigne','French Description','greek_food_leaves.jpg'),
(15,'Grape Leaves',10.75,'Discription','',3,3,'Feuilles de vigne','French Description','greek_food_leaves.jpg'),
(16,'Grilled Chicken Salad',10.25,'Discription','',1,3,'Salade de poulet grillé','French Description','greek_food_salad.jpg'),
(17,'Grilled Chicken Salad',12.25,'Discription','',2,3,'Salade de poulet grillé','French Description','greek_food_salad.jpg'),
(18,'Grilled Chicken Salad',14.75,'Discription','',3,3,'Salade de poulet grillé','French Description','greek_food_salad.jpg'), 
(19,'Noodles',3.88,'Discription','',1,4,'Nouilles','French Description','chinese_food_noodle.jpg'),
(20,'Noodles',5.88,'Discription','',2,4,'Nouilles','French Description','chinese_food_noodle.jpg'),
(21,'Noodles',7.88,'Discription','',3,4,'Nouilles','French Description','chinese_food_noodle.jpg'),
(22,'Ramen',7.88,'Discription','',1,4,'Ramen','French Description','chinese_food_ramen.jpg'),
(23,'Ramen',9.99,'Discription','',2,4,'Ramen','French Description','chinese_food_ramen.jpg'),
(24,'Ramen',10.99,'Discription','',3,4,'Ramen','French Description','chinese_food_ramen.jpg'),
(25,'Sushi',7.88,'Discription','',1,4,'sushis','French Description','chinese_food_sushi.jpg'),
(26,'Sushi',10.38 ,'Discription','',2,4,'sushis','French Description','chinese_food_sushi.jpg'),
(27,'Sushi',12.38 ,'Discription','',3,4,'sushis','French Description','chinese_food_sushi.jpg'),
(28,'Chicken Biryani',9.75,'Discription','',1,5,'poulet Biryani','French Description','indian_food_biriani.jpg'),
(29,'Chicken Biryani',13.45 ,'Discription','',2,5,'poulet Biryani','French Description','indian_food_biriani.jpg'),
(30,'Chicken Biryani',15.45 ,'Discription','',3,5,'poulet Biryani','French Description','indian_food_biriani.jpg'),
(31,'Bhaji',7.75,'Discription','',1,5,'Bhaji','French Description','indian_food_bhaji.jpg'),
(32,'Bhaji',9.75,'Discription','',2,5,'Bhaji','French Description','indian_food_bhaji.jpg'),
(33,'Bhaji',11.50,'Discription','',3,5,'Bhaji','French Description','indian_food_bhaji.jpg'),
(34,'Kuzhambu',7.75,'Discription','',1,5,'Kuzhambu','French Description','indian_food_kuzhambu.jpg'),
(35,'Kuzhambu',9.75,'Discription','',2,5,'Kuzhambu','French Description','indian_food_kuzhambu.jpg'),
(36,'Kuzhambu',10.25,'Discription','',3,5,'Kuzhambu','French Description','indian_food_kuzhambu.jpg');



DELETE FROM `size` WHERE id > 0;
INSERT INTO `size` VALUES (1,'Small','Petit'),(2,'Regular','Moyen'),(3,'Large','Grand');

DELETE FROM `stage` WHERE id > 0;
INSERT INTO `stage` VALUES 
(1,'Open','Ouvert'),
(2,'Preparing','Préparation'),
(3,'Ready','Prêt'),
(4,'Out for delivery','En cours de livraison'),
(5,'Delivered','Livré');

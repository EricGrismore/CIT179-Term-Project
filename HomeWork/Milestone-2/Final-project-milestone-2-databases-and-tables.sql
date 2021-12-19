
Use myBuisnessOrder;
GO
Insert Into ZipCode Values (44857, 'Indianapolis', 'Indiana')
Insert Into ZipCode Values (66489, 'Phoenix', 'Arizona')
Insert Into ZipCode Values (95137, 'Detroit', 'Michigan')
Insert Into ZipCode Values (12356, 'Lewiston', 'Idaho')
Insert Into ZipCode Values (66488, 'Denver', 'Colorado')



Use myBuisnessOrder;
GO
Insert Into Inventory Values (1, 'Pyrite', '4"', 3.26)
Insert Into Inventory Values (2, 'Opal', '4 1/2"', 2.68)
Insert Into Inventory Values (3, 'Amethyst', '4"', 4.56)
Insert Into Inventory Values (4, 'Calcite', '4"', 5.26)
Insert Into Inventory Values (5, 'Azurite', '4 1/4"', 6.87)
Insert Into Inventory Values (6, 'Chrysocolla', '5"', 3.33)


/*Use myBuisnessOrder;
GO
Insert Into Shipping Values (1, 'American Shippers')
Insert Into Shipping Values (2, 'Mikes Mighty Lifters')
*/
  
Use myBuisnessOrder;
GO
Insert Into Museum Values (1 , '44857', 'Museum Of Natural History', '123 First Avenue')
Insert Into Museum Values (2, '66489', 'Grand Canyon Arts Museum', '10 State Street')
Insert Into Museum Values (3, '95137', 'Golden State Museum', '144 Fourth Avenue')
Insert Into Museum Values (4, '12356', 'Billy Rocks Geode Museum', '23 Fletcher Blvd.')
Insert Into Museum Values (5, '66488', 'Calarado Earth Museum', '1 Hwy 6')

Use myBuisnessOrder;
GO
Insert Into Owner Values ('456', 44857, 'Cole', 'Reeves')
Insert Into Owner Values ('789', 66489, 'Kyle', 'Little')
Insert Into Owner Values ('123', 95137, 'Dick', 'Yail')
Insert Into Owner Values ('256', 12356, 'Yuri', 'Tye')
Insert Into Owner Values ('657', 66488, 'Polly', 'Leaf')

Use myBuisnessOrder;
GO
Insert Into Buyer Values ('56422', '44857', 'James', 'Rocket')
Insert Into Buyer Values ('74285', '66489', 'Lee', 'Desu')
Insert Into Buyer Values ('95487', '95137', 'Fie', 'Woods')
Insert Into Buyer Values ('11568', '12356', 'Logan', 'Vesper')
Insert Into Buyer Values ('73958', '66488', 'Shara', 'Fix')

Use myBuisnessOrder;
GO
Insert Into Exhibits Values (1, '1', '1')
Insert Into Exhibits Values (2, '1', '2')
Insert Into Exhibits Values (3, '1', '5')
Insert Into Exhibits Values (4, '2', '1')
Insert Into Exhibits Values (5, '2', '4')
Insert Into Exhibits Values (6, '2', '5')
Insert Into Exhibits Values (7, '3', '1')
Insert Into Exhibits Values (8, '3', '2')
Insert Into Exhibits Values (9, '3', '3')
Insert Into Exhibits Values (10, '3', '4')
Insert Into Exhibits Values (11, '3', '5')
Insert Into Exhibits Values (12, '4', '2')
Insert Into Exhibits Values (13, '4', '4')
Insert Into Exhibits Values (14, '5', '3')
Insert Into Exhibits Values (15, '5', '4')
Insert Into Exhibits Values (16, '5', '5')

Use myBuisnessOrder;
GO
Insert Into Orders Values (1, '456', '56422', 12/13/2002)
Insert Into Orders Values (2, '789', '74285', 12/13/2002)
Insert Into Orders Values (3, '123', '95487', 12/13/2002)
Insert Into Orders Values (4, '256', '11568', 12/13/2002)
Insert Into Orders Values (5, '657', '73958', 12/13/2002)

Use myBuisnessOrder;
GO
Insert Into OrderDetail Values (1, 1, 1, 1, '1/12/2003')
Insert Into OrderDetail Values (2, 1, 2, 10, '1/12/2003')
Insert Into OrderDetail Values (3, 1, 5, 1, '1/12/2003')
Insert Into OrderDetail Values (4, 2, 1, 2, '1/12/2003')
Insert Into OrderDetail Values (5, 2, 4, 6, '1/12/2003')
Insert Into OrderDetail Values (6, 2, 5, 4, '1/30/1900')
Insert Into OrderDetail Values (7, 3, 1, 6, '1/30/1900')
Insert Into OrderDetail Values (8, 3, 2, 8, '1/30/1900')
Insert Into OrderDetail Values (9, 3, 3, 4, '1/30/1900')
Insert Into OrderDetail Values (10, 3, 4, 8, '1/30/1900')
Insert Into OrderDetail Values (11, 3, 5, 2, '1/30/1900')
Insert Into OrderDetail Values (12, 4, 2, 1, '1/30/1900')
Insert Into OrderDetail Values (13, 4, 4, 2, '1/30/1900')
Insert Into OrderDetail Values (14, 5, 3, 7, '1/30/1900')
Insert Into OrderDetail Values (15, 5, 4, 1, '1/30/1900')
Insert Into OrderDetail Values (16, 5, 5, 2, '1/30/1900')


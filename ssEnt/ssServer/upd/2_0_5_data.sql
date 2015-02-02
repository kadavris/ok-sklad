insert into tables (tabid, tablename, keyname) values (51, 'WebShops', 'id');

insert into usertreeview 
(id, funid, treeid, pid, num, imageindex, isgroup, showintree, gtype, showexpanded, visible, disabledindex)
values (110, null, 0, 0, 6000, 91, 1, 0, 600, 1, 1, 92);

insert into viewlng (id, langid, name) values (110, 1, 'Интернет');
insert into viewlng (id, langid, name) values (110, 2, 'Iнтернет');
insert into viewlng (id, langid, name) values (110, 3, 'Internet');



insert into functions (funid, classname, tabid, logging) values (68, 'TfmWebShops', 51, 0);

insert into usertreeview 
(id, funid, treeid, pid, num, imageindex, isgroup, showintree, gtype, showexpanded, visible, disabledindex)
 values (111, 68, 0, 110, 6000, 210, 0, 0, 601, 0, 1, 211);

insert into viewlng (id, langid, name) values (111, 1, 'Веб-Магазины');
insert into viewlng (id, langid, name) values (111, 2, 'Веб-Магазiни');
insert into viewlng (id, langid, name) values (111, 3, 'Web-Stores');



insert into functions (funid, classname, tabid, logging) values (69, 'TfmRSS', null, 0);

insert into usertreeview 
(id, funid, treeid, pid, num, imageindex, isgroup, showintree, gtype, showexpanded, visible, disabledindex)
 values (112, 69, 0, 110, 6000, 212, 0, 0, 602, 0, 1, 213);

insert into viewlng (id, langid, name) values (112, 1, 'Свежие новости от разработчика');
insert into viewlng (id, langid, name) values (112, 2, 'Свiжи новини вiд девелопера');
insert into viewlng (id, langid, name) values (112, 3, 'Hot news from developer');






!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (105, 3, 'Contract reports');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (102, 3, 'Expense items');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (0,   3, 'Warehouse + Sales');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (108, 3, 'Supplier orders');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (109, 3, 'Discount cards');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (11, 3, 'Banks');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (12, 3, 'Account types');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (15, 3, 'Service');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (17, 3, 'Users');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (18, 3, 'User Groups');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (19, 3, 'User Monitor');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (2,  3, 'Measuring Units');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (20, 3, 'TrashCan');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (21, 3, 'Documents');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (23, 3, 'Settings');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (25, 3, 'Warehouses');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (26, 3, 'Goods receipt slips');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (27, 3, 'Goods dispatch slips');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (28, 3, 'Warehouses (All)');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (29, 3, 'Incoming payments');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (3,  3, 'Currency');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (30, 3, 'Outgoing payments');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (31, 3, 'Payments');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (32, 3, 'Way-bills/Slips');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (33, 3, 'Databases');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (34, 3, 'Reports');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (35, 3, 'Warehousing Reports');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (36, 3, 'Finance Reports');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (37, 3, 'Contractors Reports');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (38, 3, 'Product Groups');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (39, 3, 'Invoice');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (40, 3, 'Price Types');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (41, 3, 'Documents');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (43, 3, 'Countries');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (44, 3, 'Waybills');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (45, 3, 'Contracts');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (46, 3, 'Purchasing contracts');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (47, 3, 'Selling contracts');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (48, 3, 'Stock transfer slips');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (50, 3, 'Additional directories');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (51, 3, 'Services');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (52, 3, 'Event registers');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (53, 3, 'Sets');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (54, 3, 'Goods write-off statements');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (55, 3, 'Return invoices');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (56, 3, 'Return to supplier');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (57, 3, 'Return from customer');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (58, 3, 'Goods balances entry');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (59, 3, 'Service groups');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (6,  3, 'Products (All)');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (60, 3, 'Internal reports');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (61, 3, 'Cash');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (62, 3, 'Finances');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (63, 3, 'Non-cash funds');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (64, 3, 'Cash Books');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (65, 3, 'Document register');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (66, 3, 'SQL-query editor');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (67, 3, 'Financial operations');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (68, 3, 'Taxes');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (69, 3, 'Memorandum');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (70, 3, 'Discount card groups');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (8, 3, 'Directories');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (107, 3, 'Customer orders');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (106, 3, 'Orders');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (104, 3, 'Inventory statements');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (103, 3, 'Additional expenses');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (101, 3, 'Price lists');
!NOERR!insert INTO VIEWLNG (ID, LANGID, NAME) VALUES (10, 3, 'Clients/Partners (All)');

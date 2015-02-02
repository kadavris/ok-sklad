update reports set num=repid;

insert into reports (repid, grpid, fil, num) values (25, 35, 1, 1);

insert into replng (repid, langid, name) values (25, 1, 'Развернутый отчет о приходе');
insert into replng (repid, langid, name) values (25, 2, 'Розгорнутий звiт про прибуток товарiв');

insert into functions (funid, classname, tabid, logging) values (64, 'TfmOrders', 24, 0);
insert into functions (funid, classname, tabid, logging) values (65, 'TfmOrders', 24, 0);

insert into usertreeview (id, funid, treeid, pid, num, imageindex, isgroup, showintree, gtype, showexpanded, visible, disabledindex)
 values (106, null, 0, 21, 751, 48, 1, 0, null, 1, 1, null);
insert into usertreeview (id, funid, treeid, pid, num, imageindex, isgroup, showintree, gtype, showexpanded, visible, disabledindex)
 values (107, 64, 0, 106, 100, 190, 0, 0, -16, 0, 1, 199);
insert into usertreeview (id, funid, treeid, pid, num, imageindex, isgroup, showintree, gtype, showexpanded, visible, disabledindex)
 values (108, 65, 0, 106, 100, 189, 0, 0, 16, 0, 1, 200);

insert into viewlng (id, langid, name) values (106, 1, 'Заказы');
insert into viewlng (id, langid, name) values (106, 2, 'Замовлення');
insert into viewlng (id, langid, name) values (107, 1, 'Заказы от клиентов');
insert into viewlng (id, langid, name) values (107, 2, 'Замовлення вiд клiєнтiв');
insert into viewlng (id, langid, name) values (108, 1, 'Заказы поставщикам');
insert into viewlng (id, langid, name) values (108, 2, 'Замовлення постачальникам');


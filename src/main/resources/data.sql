INSERT  INTO role VALUES (1, 'ROLE_ADMIN');
INSERT  INTO role VALUES (2, 'ROLE_USER');

INSERT INTO public.user_info (id, password, username) VALUES (1, '$2a$10$uw/TrA4h5AyExAAKvQzXFegAjQa6wIvscidN8LJg9I6UoscVupDgi', 'qwertyui');
INSERT INTO public.user_info (id, password, username) VALUES (2, '$2a$10$7zgpSpIVH5oS0Zd9c1GN.ekxrTrvNpqkfnSntnqBOOpjCwubWcgaq', 'qwertyui2');
-- пароль совпадает с логином пользователей. скрипты для быстрого стата)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

INSERT INTO public.menu (id, namemenu, userinfo_id) VALUES (1, '1', 1);
INSERT INTO public.menu (id, namemenu, userinfo_id) VALUES (2, '2', 1);
INSERT INTO public.menu (id, namemenu, userinfo_id) VALUES (3, '1', 2);
INSERT INTO public.menu (id, namemenu, userinfo_id) VALUES (4, '2', 2);

INSERT INTO public.bookmark (id, comment, link, menu_id, userinfo_id) VALUES (2, 'qwertyui 1.2', '1.2', 1, 1);
INSERT INTO public.bookmark (id, comment, link, menu_id, userinfo_id) VALUES (3, 'qwertyui 2.1', '2.1', 2, 1);
INSERT INTO public.bookmark (id, comment, link, menu_id, userinfo_id) VALUES (4, 'qwertyui 2.2', '2.2', 2, 1);
INSERT INTO public.bookmark (id, comment, link, menu_id, userinfo_id) VALUES (1, 'qwertyui 1.1', '1.1', 1, 1);
INSERT INTO public.bookmark (id, comment, link, menu_id, userinfo_id) VALUES (5, 'qwertyui2 1.1', '1.1', 3, 2);
INSERT INTO public.bookmark (id, comment, link, menu_id, userinfo_id) VALUES (6, 'qwertyui2 1.2', '1.2', 3, 2);
INSERT INTO public.bookmark (id, comment, link, menu_id, userinfo_id) VALUES (7, 'qwertyui2 2.1', '2.1', 4, 2);
INSERT INTO public.bookmark (id, comment, link, menu_id, userinfo_id) VALUES (8, 'qwertyui2 2.2', '2.2 ', 4, 2);

INSERT INTO public.user_role (user_id, role_id) VALUES (1, 2);
INSERT INTO public.user_role (user_id, role_id) VALUES (2, 2);
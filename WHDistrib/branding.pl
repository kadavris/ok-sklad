%countryIDs = (
	'ENG' => 0,
	'RUS' => 1,
	'UKR' => 2,
	'ESP' => 3,
	'FRA' => 4
);

%slang = (
	'RUS' => 'ru',
	'UKR' => 'ua',
	'ENG' => 'en'
);

%langDistr = (
	'RUS' => [ qw~free com beta~ ],
	'UKR' => [ qw~com~ ],
	'ENG' => [ qw~free-bo free-oi com-bo com-oi gold~ ]
);

%distribs = (
    #lang-distr[-mod[-mod]*]
	#lang-distr    exe name                             suff list     .gdb name suffix
# for suff list 'std' is always included. main brand goes first. additional suffixes follows
	'ENG-free-oi'  => [q~"ok-inventory-demo-new"~,      q~"oi,usa"~,  'eng'],
	'ENG-com-oi'   => [q~"ok-inventory"~,               q~"oi,usa"~,  'eng'],

	'RUS-com'      => [q~"ok-sklad-${shortLang}"~,      q~"rus"~,     'rus'],
	'RUS-free'     => [q~"ok-sklad-demo-new"~,     	    q~"rus"~,     'rus'],
	#'RUS-beta'    => [q~"ok-sklad-${shortLang}-beta"~, q~"rus"~,     'rus']

	#'ENG-free-bo'  => [q~"biz-operator-demo-new"~,      q~"bo,usa"~, 'eng'],
	#'ENG-com-bo'   => [q~"biz-operator"~,               q~"bo,usa"~, 'eng'],

	'UKR-com'      => [q~"ok-sklad-${shortLang}"~,       q~"ukr"~,    'ukr'],

	#'ENG-com-gold' => [q~"biz-operator-ec"~,            q~"gold"~,   'gold'],
);

%srvNameSuff = (
	'gold' => 'com',
	'beta' => 'com',

	'com'  => 'com',
	'free' => 'free'
);

%branding = (
	'ENG-free-bo' =>
		  "_TITLE_=Biz-Operator\n"
		. "_MOTTO_=Finances and Stock Management plus Web Stores\n"
		. "_COPYRIGHT_=Biz-Operator\n"
		. "_URL_=www.Biz-Operator.com\n"
		. "_INSTDIR_=Biz-Operator\n"
		. "_COMPANY_=Biz-Operator\n"
		. "_URL_KeyActivate_=\n"
		. "_URL_KeyActivatePost_=\n"
		. "_URL_KeyCheck_=\n"
		. "_URL_KeyCheckPost_=\n"
		. "_URL_KeyHost_=PTAyijqcbdefqYmo1U2V5OUdkdVZtZHVsV0xyOW1MM2QzZA==\n"
	,

	'ENG-com-bo'  =>
		  "_TITLE_=Biz-Operator\n"
		. "_MOTTO_=Finances and Stock Management plus Web Stores\n"
		. "_COPYRIGHT_=Biz-Operator\n"
		. "_URL_=www.Biz-Operator.com\n"
		. "_INSTDIR_=Biz-Operator\n"
		. "_COMPANY_=Biz-Operator\n"
		. "_URL_KeyActivate_=PT1BmefprlnatY29Cbkw0VkdadWwyTHQ5Mll1a25jdlJuYmxabmJwMXlhdjV5ZDNkM0x2b0RjMFJIYQ==\n"
		. "_URL_KeyActivatePost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyCheck_=PT1BmefprlnatY29Cbkw0VkdadWwyTHQ5Mll1a25jdlJuYmxabmJwMXlhdjV5ZDNkM0x2b0RjMFJIYQ==\n"
		. "_URL_KeyCheckPost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyHost_=PTAyijqcbdefqYmo1U2V5OUdkdVZtZHVsV0xyOW1MM2QzZA==\n"
	,

	'ENG-free-oi' =>
		  "_TITLE_=OK-Inventory\n"
		. "_MOTTO_=Finances and Stock Management plus Web Stores\n"
		. "_COPYRIGHT_=Irystyle\n"
		. "_URL_=www.OK-Inventory.com\n"
		. "_INSTDIR_=OK-Inventory\n"
		. "_COMPANY_=OK-Inventory\n"
		. "_URL_KeyActivate_=\n"
		. "_URL_KeyActivatePost_=\n"
		. "_URL_KeyCheck_=\n"
		. "_URL_KeyCheckPost_=\n"
		. "_URL_KeyHost_=PTAyijqcbdefqYmo1U2V5OUdkdVZtZHVsV0xyOW1MM2QzZA==\n"
	,

	'ENG-com-oi'  =>
		  "_TITLE_=OK-Inventory\n"
		. "_MOTTO_=Finances and Stock Management plus Web Stores\n"
		. "_COPYRIGHT_=Irystyle\n"
		. "_URL_=www.OK-Inventory.com\n"
		. "_INSTDIR_=OK-Inventory\n"
		. "_COMPANY_=OK-Inventory\n"
		. "_URL_KeyActivate_=PT1BmefprlnatY29Cbkw0VkdadWwyTHQ5Mll1a25jdlJuYmxabmJwMXlhdjV5ZDNkM0x2b0RjMFJIYQ==\n"
		. "_URL_KeyActivatePost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyCheck_=PT1BmefprlnatY29Cbkw0VkdadWwyTHQ5Mll1a25jdlJuYmxabmJwMXlhdjV5ZDNkM0x2b0RjMFJIYQ==\n"
		. "_URL_KeyCheckPost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyHost_=PTAyijqcbdefqYmo1U2V5OUdkdVZtZHVsV0xyOW1MM2QzZA==\n"
	,

	'ENG-com-gold' =>
		  "_TITLE_=Biz-Operator for Exquisite Creations\n"
		. "_MOTTO_=Finances and Stock Management plus Web Stores\n"
		. "_COPYRIGHT_=Biz-Operator\n"
		. "_URL_=www.Biz-Operator.com\n"
		. "_INSTDIR_=Biz-Operator\n"
		. "_COMPANY_=Biz-Operator\n"
		. "_URL_KeyActivate_=PT1BmefprlnatY29Cbkw0VkdadWwyTHQ5Mll1a25jdlJuYmxabmJwMXlhdjV5ZDNkM0x2b0RjMFJIYQ==\n"
		. "_URL_KeyActivatePost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyCheck_=PT1BmefprlnatY29Cbkw0VkdadWwyTHQ5Mll1a25jdlJuYmxabmJwMXlhdjV5ZDNkM0x2b0RjMFJIYQ==\n"
		. "_URL_KeyCheckPost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyHost_=PTAyijqcbdefqYmo1U2V5OUdkdVZtZHVsV0xyOW1MM2QzZA==\n"
	,

	'RUS-free' =>
		  "_TITLE_=ОК-Склад\n"
		. "_MOTTO_=Склад, финансы и интернет-магазины\n"
		. "_COPYRIGHT_=Иристайл\n"
		. "_URL_=www.OK-Sklad.com\n"
		. "_INSTDIR_=OK-Sklad\n"
		. "_COMPANY_=Иристайл\n"
		. "_URL_KeyActivate_=\n"
		. "_URL_KeyActivatePost_=\n"
		. "_URL_KeyCheck_=\n"
		. "_URL_KeyCheckPost_=\n"
		. "_URL_KeyHost_=PT1RgngfookrcYnZObUxrRkdick5YTHI5bUwzZDNk\n"
	,

	'RUS-com'  =>
		  "_TITLE_=ОК-Склад\n"
		. "_MOTTO_=Склад, финансы и интернет-магазины\n"
		. "_COPYRIGHT_=Иристайл\n"
		. "_URL_=www.OK-Sklad.com\n"
		. "_INSTDIR_=OK-Sklad\n"
		. "_COMPANY_=Иристайл\n"
		. "_URL_KeyActivate_=d2hHocprfmrftY3VnWFprNVdhdjAyYmo1Q1poeDJhejF5YXY1eWQzZDNMdm9EYzBSSGE=\n"
		. "_URL_KeyActivatePost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyCheck_=d2hHocprfmrftY3VnWFprNVdhdjAyYmo1Q1poeDJhejF5YXY1eWQzZDNMdm9EYzBSSGE=\n"
		. "_URL_KeyCheckPost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyHost_=PT1RgngfookrcYnZObUxrRkdick5YTHI5bUwzZDNk\n"
	,

	'UKR-com' => 
		  "_TITLE_=ОК-Склад\n"
		. "_MOTTO_=Фiнанси, Склади та Веб-Магазiни\n"
		. "_COPYRIGHT_=Иристайл\n"
		. "_URL_=www.OK-Sklad.com\n"
		. "_INSTDIR_=OK-Sklad\n"
		. "_COMPANY_=Иристайл\n"
		. "_URL_KeyActivate_=d2hHocprfmrftY3VnWFprNVdhdjAyYmo1Q1poeDJhejF5YXY1eWQzZDNMdm9EYzBSSGE=\n"
		. "_URL_KeyActivatePost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyCheck_=d2hHocprfmrftY3VnWFprNVdhdjAyYmo1Q1poeDJhejF5YXY1eWQzZDNMdm9EYzBSSGE=\n"
		. "_URL_KeyCheckPost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyHost_=PT1RgngfookrcYnZObUxrRkdick5YTHI5bUwzZDNk\n"
	,

	'RUS-beta' =>
		  "_TITLE_=ОК-Склад: Beta/RC\n"
		. "_MOTTO_=Склад, финансы и интернет-магазины\n"
		. "_COPYRIGHT_=Иристайл\n"
		. "_URL_=www.OK-Sklad.com\n"
		. "_INSTDIR_=OK-Sklad\n"
		. "_COMPANY_=Иристайл\n"
		. "_URL_KeyActivate_=d2hHocprfmrftY3VnWFprNVdhdjAyYmo1Q1poeDJhejF5YXY1eWQzZDNMdm9EYzBSSGE=\n"
		. "_URL_KeyActivatePost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyCheck_=d2hHocprfmrftY3VnWFprNVdhdjAyYmo1Q1poeDJhejF5YXY1eWQzZDNMdm9EYzBSSGE=\n"
		. "_URL_KeyCheckPost_=PTBUddjdobbphZWx0bUo1VjJhZnQyWWxoMlk5QTNi\n"
		. "_URL_KeyHost_=PT1RgngfookrcYnZObUxrRkdick5YTHI5bUwzZDNk\n"
	
);

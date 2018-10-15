-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 12 2017 г., 16:07
-- Версия сервера: 5.5.45
-- Версия PHP: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `track_in`
--

-- --------------------------------------------------------

--
-- Структура таблицы `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `album_id` int(10) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(200) NOT NULL,
  `album_date_of_create` date NOT NULL,
  `album_description` text NOT NULL,
  `album_logo` varchar(400) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `album`
--

INSERT INTO `album` (`album_id`, `album_name`, `album_date_of_create`, `album_description`, `album_logo`, `group_id`) VALUES
(1, 'The Black Album', '1991-08-12', 'Metallica (також відомий як «Чорний альбом» (англ. The Black Album)) — п''ятий студійний альбом метал колективу Metallica, виданий 12-го серпня 1991-го року. Останній з трешового періоду, надалі гурт відійшов до помірнішого виконання, що надалі неоднозначно було сприйнято прихильниками. Комерційно найуспішніший диск команди, 2003-го (252-а позиція) увішов до топ-500 за версією «Rolling Stone»[1].', 'https://upload.wikimedia.org/wikipedia/uk/thumb/b/bd/Metallica_-_Metallica.jpg/250px-Metallica_-_Metallica.jpg', 2),
(8, 'Heroes', '2014-05-16', 'Heroes — сьомий студійний альбом шведського павер-метал гурту Sabaton, випущений 16 травня 2014 року на лейблі Nuclear Blast. Це перший альбом гурту в новому складі з гітаристами Крісом Роландом і Турбйорном Енглундом, а також з новим барабанщиком Ханнесом Ван Далом.', 'https://upload.wikimedia.org/wikipedia/uk/6/60/Sabaton_Heroes_cover.jpg', 31),
(9, 'Carolus Rex', '2012-02-23', 'Carolus Rex (укр. Король Карл) — шостий студійний альбом шведського павер-метал гурту Sabaton, який вийшов 23 травня 2012 року. Альбом присвячений Тридцятирічній війні і королю Швеції Карлу Дванадцятому, та його військовим походам. Альбом вийшов в двох варіантах: на англійській і на шведській, спеціальна версія альбому включає в себе обидва варіанти на двох дисках. Це також буде останній альбом за участю гітаристів Oskar Montelius та Rikard Sundén, барабанщика Daniel Mullback і клавішника Daniel Mÿhr.', 'https://upload.wikimedia.org/wikipedia/uk/thumb/0/06/Sabaton_Carolus_Rex.jpg/250px-Sabaton_Carolus_Rex.jpg', 31),
(10, 'Return in Bloodred', '2005-04-04', 'Повернення в Bloodred (англ. «Возвращение в багрянце») - дебютний студійний альбом німецької пауер-металу групи Powerwolf. Була випущена 4 квітня 2005 року під лейблом Metal Blade Records.', 'https://vignette.wikia.nocookie.net/lyricwiki/images/0/0e/Powerwolf_-_Return_in_Bloodred.jpg/revision/latest?cb=20091218145356', 29);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` int(6) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(250) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`) VALUES
(1, 'Thrash metal'),
(2, 'Hard-rock'),
(3, 'Power metal'),
(4, 'Speed Metal'),
(6, 'Heavy Metal'),
(7, 'Rapcore');

-- --------------------------------------------------------

--
-- Структура таблицы `group_genre`
--

CREATE TABLE IF NOT EXISTS `group_genre` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `group_id` int(9) NOT NULL,
  `genre_id` int(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `group_genre`
--

INSERT INTO `group_genre` (`id`, `group_id`, `genre_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(4, 29, 3),
(6, 31, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `group_member`
--

CREATE TABLE IF NOT EXISTS `group_member` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `group_id` int(9) NOT NULL,
  `group_member_id` int(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `group_member`
--

INSERT INTO `group_member` (`id`, `group_id`, `group_member_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(10, 29, 17),
(11, 29, 18),
(12, 31, 19),
(13, 31, 20),
(14, 31, 21),
(18, 31, 23),
(19, 31, 24),
(20, 3, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `group_t`
--

CREATE TABLE IF NOT EXISTS `group_t` (
  `group_id` int(8) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(150) NOT NULL,
  `group_genre_id` int(6) NOT NULL,
  `group_date_of_create` date NOT NULL,
  `group_description` text NOT NULL,
  `group_logo` varchar(350) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `group_t`
--

INSERT INTO `group_t` (`group_id`, `group_name`, `group_genre_id`, `group_date_of_create`, `group_description`, `group_logo`) VALUES
(2, 'Metallica', 1, '1981-01-01', 'Аудіо Metallicaопис файлу (МФА: [məˈtælɨkə]) — американський метал-гурт з Лос-Анджелеса, Каліфорнія, для творчості якого характерний швидкий темп, інструментальна майстерність та агресивні гітарні соло, які й визначили їхнє місце у «великій четвірці треш-металу» разом з Slayer, Megadeth та Anthrax[1]. Заснований в 1981 році, коли Джеймс Гетфілд відгукнувся на оголошення барабанщика Ларса Ульріха, розміщене у місцевій газеті. Зараз до складу гурту, окрім Гетфілда та Ульріха, входять гітарист Кірк Геммет (який приєднався у 1983) та бас-гітарист Роберт Трухільйо (з 2003 року). Також в різні періоди учасниками гурту були: гітарист Дейв Мастейн (який згодом заснував Megadeth), басисти Рон Макговні, Кліфф Бертон та Джейсон Ньюстед. Гурт також тривалий час співпрацював з Бобом Роком, який спродюсував усі їхні альбоми з 1990 до 2003 року, та виконував обов''язки бас-гітариста в період між відходом Ньюстеда та приходом Трухільйо.', 'https://www.metal-archives.com/images/1/2/5/125_logo.png?0307'),
(3, 'AC/DC', 2, '1973-11-00', 'AC/DC (сокр. от англ. alternating current/direct current — переменный/постоянный ток)[1] — австралийская рок-группа, сформированная в Сиднее в ноябре 1973 года выходцами из Шотландии, братьями Малькольмом и Ангусом Янгами.', 'http://www.acdc.com/templates/default/images/og_image.jpg'),
(29, 'Powerwolf', 3, '2003-01-01', 'Powerwolf — німецький павер-метал гурт, створений у 2003 році. Гурт використовує у своїй творчості християнські мотиви, похмурі хорові вставки і потужні органні партії. В таких композиціях як «Panic in the Pentagram», «Catholic in the Morning» колектив висміює сатанізм. Музиканти стверджують, що вони не грають християнський рок, але називають себе релігійними людьми.', 'https://lastfm-img2.akamaized.net/i/u/ar0/ac64672357ced7d5e3148ac7a8843566.jpg'),
(31, 'Sabaton', 6, '1999-01-01', 'Sabaton — шведський хеві-павер-метал-гурт, заснований у 1999 році. Основною темою для пісень є війни та окремі битви. Назва групи в перекладі з англійської означає броньований черевик, тобто частину лицарського обладунку', 'http://www.sabaton.net/wp-content/uploads/2015/07/Sabaton_Official_Headquarters.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(250) NOT NULL,
  `member_birthday` date NOT NULL,
  `member_history` text NOT NULL,
  `member_scene_position_id` int(4) NOT NULL,
  `member_photo_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `member`
--

INSERT INTO `member` (`member_id`, `member_name`, `member_birthday`, `member_history`, `member_scene_position_id`, `member_photo_url`) VALUES
(1, 'Джеймс Гетфілд', '1963-08-03', 'Лідер, автор пісень, співак і ритм-гітарист американського треш/хеві-метал гурту Metallica.\r\nБатько Джеймса, Вірджил (англ. Virgil, † 1996), — водій автобуса, покинув сім''ю, коли Джеймсу було 13 років, та мати Сінтія (англ. Cyntia) — оперна співачка, були послідовниками релігійного руху Християнська наука Мері Бейкер Едді. За словами Джеймса, значна частина його життя в юності була пов''язана з християнством.[1]\r\n\r\nЗа своїми віруваннями, батьки Хетфілда не схвалювали як і медицину, так і будь-які види медичного втручання — і не зрікалися своєї віри, навіть коли мати Джеймса помирала від раку (Джеймсу тоді було 16 років).[2]\r\n\r\nСмерть матері і важке відношення до релігії пізніше стали головними темами багатьох пісень гурту Metallica. Пісні — «Mama Said», «Dyers Eve» та «The God That Failed» — про батьків Джеймса, а «Until It Sleeps» — про рак.', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/James_Hetfield_by_Gage_Skidmore.jpg/640px-James_Hetfield_by_Gage_Skidmore.jpg'),
(2, 'Ларс Ульріх', '1963-12-02', 'Ларс Ульріх (26 грудня 1963) — барабанщик, головний автор пісень (разом з Джеймсом Хетфілдом) та співзасновник гурту Metallica. Він народився у Гентофте, Данія, у сім''ї відомого тенісиста Торбена Ульріха. Тенісне диво в юності, Ульріх переїжджає до Лос-Анджелесу (Каліфорнія, США) у віці сімнадцяти років, щоб продовжити тренування, але замість тенісиста стає барабанщиком. Завдяки оголошенню у місцевій газеті під назвою The Recycler, він знаходить Джеймса Хетфілда і засновує Metallica.', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Lars_Ulrich_by_Gage_Skidmore.jpg/1200px-Lars_Ulrich_by_Gage_Skidmore.jpg'),
(3, 'Кірк Гемметт', '1962-11-18', 'Народився 18 листопада 1962 року в Сан Франциско. Його батько був ірландським моряком, мати — приїжджа з Філіппін. Кірк закінчив 11 класів у школі De Anza в місті Ричмонді в Каліфорнії. Має старшого брата Ріка і молодшу сестру Тоні. Ще дитиною Кірк виявив неабиякий інтерес до музики. У 15 років за власні кошти, отримані на роботі в «Бургер Кінг», придбав свою першу електрогітару.\r\n\r\n1980 року Гемметт та троє його друзів зорганізувалися в групі під назвою Exodus, ставши одними з піонерів треш-металу. 1983 року Кірк Гемметт приєднався до гурту Metallica, замінивши звільненого Дейва Мастейна. У цій групі Кірк грає й до сьогодні, будучи автором багатьох відомих рифів у піснях Metallica.', 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Kirk_Hammett_by_Gage_Skidmore.jpg/640px-Kirk_Hammett_by_Gage_Skidmore.jpg'),
(4, 'Роберт Трухільйо', '1963-09-23', 'Народився 23 жовтня 1964 року в Санта Моніці, Каліфорнія. Приєднавшись до Suicidal Tendencies (в 1989) Роберт вніс фанковиє нотки в звучання групи, що особливо чутно на альбомах Lights ... Camera ... Revolution! і The Art of Rebellion. В результаті Роб заразив лідера Suicidal Tendencies Майка Мьюра фанк-музикою і вони удвох організували проект Infectious Grooves, щоб грати більш фанк-орієнтовану музику.\r\n\r\nВ кінці дев''яностих Роберт приєднується до групи Оззі Осборна.\r\n\r\n24 лютого 2003 року Трухільо стає басистом групи Metallica. Процес прослуховування і прийняття Роба в групу показаний в документальному фільмі Some Kind of Monster.', 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Robert_Trujillo_2017.jpg/1200px-Robert_Trujillo_2017.jpg'),
(5, 'Браян Джонсон', '1947-10-05', 'Рок-музыкант и поэт, получивший ограниченную популярность в 1970-х годах как участник недолговечного, но успешного[1] британского рок-квартета Geordie; наибольшую известность ему принесло участие в австралийской рок-группе «AC/DC», вокалистом которой он являлся с 1980 по 2016 год.', 7, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Brian_Johnson.jpg/250px-Brian_Johnson.jpg'),
(6, 'Ангус Янг', '1955-03-31', 'Ангус МакКіннон Янг (*31 березня 1955, Глазго, Шотландія) — соло-гітарист та автор пісень австралійського рок-гурту AC/DC. Янг відомий своєю майстерністю гри на гітарі, дикою енергією на сцені і шкільною уніформою.', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/AngusYoung1.JPG/220px-AngusYoung1.JPG'),
(7, 'Ексл Роуз', '1962-02-06', 'Ексл Роуз (Axl Rose, справжнє ім''я: Вільям Брюс Роуз Молодший, англ. William Bruce Rose, Jr.; 6 лютого 1962) — американський музикант, фронтмен гурту «Guns N''Roses».', 8, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/W._Axl_Rose%2C_Guns_n%C2%B4Roses_Poliedro_de_Caracas_27_de_Marzo_2010.jpg/220px-W._Axl_Rose%2C_Guns_n%C2%B4Roses_Poliedro_de_Caracas_27_de_Marzo_2010.jpg'),
(17, 'Карстен Брілл', '1970-10-27', 'Фронтмен групи вже задовго до цього брав участь разом з іншими музикантами Powerwolf в Стоунер-групі Red Aim під псевдонімом Dr. Don Roger (Доктор Дон Роджер). Дорн любить румунські легенди про перевертнів, завдяки цьому група створила свій перший альбом, Return in Bloodred, використовуючи їх в якості основи для більшості текстів. Навчався класичного оперного вокалу в Музичній Академії Бухареста. З 16 травня 2015 року одружений на фотографа Дженні Дорн (Jenny Dorn).', 8, 'http://www.powerwolf.net/images/wolves/attila.jpg'),
(18, 'Бенжамін Басс', '1977-10-07', 'Беньямін Бусс (нім. Benjamin Buss, більш відомий під сценічним псевдонімом Метью Грейвольф [Matthew Greywolf]; рід. 7 жовтня 1977) - німецький пауер-хеві-метал гітарист. Бере участь в таких музичних колективах, як: Powerwolf і Flowing Tears.\r\nЄ близьким другом Чарльза Грейвольфа, за допомогою якого, незважаючи на відсутність спорідненості, прийняв сценічний псевдонім «Greywolf». Це сталося до формування Powerwolf.\r\nУ 2003 році разом зі своїм другом Чарльзом Грейвольфом створює колектив Powerwolf.\r\nУ 2005 році разом з вовками здійснив свій перший тур.\r\nУ 1994-2014 роках був гітаристом, програмістом і клавішником в групі Flowing Tears.\r\nТакож Метью Грейвoльф створює обкладинки для групи Powerwolf.', 2, 'https://upload.wikimedia.org/wikipedia/commons/7/75/Powerwolf%2C_Matthew_Greywolf_at_Wacken_Open_Air_2013_02.jpg'),
(19, 'Йоакім Броден', '1980-10-05', 'Йоаким Броди (швед. Joakim Brodén; народився 5 жовтня 1980, Фалун, Швеція) - шведський музикант, вокаліст, басист, ритм-гітарист, клавішник, фронтмен, автор текстів пісень і музики шведської хеві-пауер-метал-групи Sabaton. Виступав сесійним вокалістом з такими групами, як Van Canto, Desert і Raubtier, сесійним клавішником з групою Stormwind.', 8, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Sabaton%2C_Joakim_Brod%C3%A9n_06.jpg/817px-Sabaton%2C_Joakim_Brod%C3%A9n_06.jpg'),
(20, 'Пер Сундстрем', '1981-06-08', 'Народився 8 червня 1981 року в шведському містечку Фалун.\r\n\r\nБрав участь у шведській дет-метал-групі Aeon, де був басистом. У 1999, разом з Рікардом Сунденом і Річардом Ларсоном створив групу Sabaton, в яку пізніше запросив Оскара Монтеліус і Йоакима Броди. У 2012 з групи пішли гітаристи Рікард Сунде та Оскар Монтеліус, а так же клавішник Даніель Мюр і барабанщик Даніель Муллбак, на їх місце Сундстрем запросив нових учасників. До цього дня грає в Sabaton на бас-гітарі і акустичній гітарі, також виконує бек-вокальні партії.', 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Sabaton%2C_P%C3%A4r_Sundstr%C3%B6m_03.jpg/267px-Sabaton%2C_P%C3%A4r_Sundstr%C3%B6m_03.jpg'),
(21, 'Кріс Реланд', '1986-12-27', 'Родился 27 декабря 1986 в шведском городке Фалун.\r\n\r\nС 2010 года участвовал в шведской пауэр-метал-группе Nocturnal Rites, где был гитаристом [1]. В 2012 году, перед началом тура Swedish Empire, был приглашен в группу Sabaton, в которой по сей день играет на ритм-гитаре и акустической гитаре, также выполняет бэк-вокальные партии.\r\n\r\nСотрудничал с прогрессив-метал коллективом Cronian, записав для их альбома Enterprise 2008 партии лидер-гитары в трех композициях [2].\r\n\r\nИспользует гитары компании ESP [3].', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Sabaton%2C_Chris_R%C3%B6rland.jpg/267px-Sabaton%2C_Chris_R%C3%B6rland.jpg'),
(23, 'Торбйорн Енґлунд', '1979-08-13', 'Torbjörn, Thorbjörn, Torbjørn, or Thorbjørn (ім''я) - це сучасні шведські, норвезькі та данські форми давньонорвезької та ісландської назви Þorbjörn, що означає грім (від імені Thor) та ведмедя.\r\n\r\nІнші варіанти назви включають датську / німецьку форму Torben і переважно німецьку форму Thorben. Англійські варіанти включають Thurburn, Thorburn, Thorbern, Thorebern, Thorber і Thurber, які, як правило, використовуються як прізвища. Tubby, який є звичайним у Норфолкській області Англії та ранніх співтовариствах китобоя Північної Америки.\r\nІсландська коротка форма - це Тоббі. Передбачуваний сайт ферми Þorbjörn в саг Hrafnkels був відомий як "Tobbahol" місцевими жителями. [1]', 2, 'https://i.pinimg.com/564x/96/f3/8c/96f38c217b54f88df87350ab69daa226--metal-bands-guitar.jpg'),
(24, 'Роббан Бак', '1985-01-10', 'Колишній барабанщик SABATON Роббан Бек випустив таку заяву:\r\n\r\n"Я постійно отримую тонни електронних повідомлень з усього світу з цього питання, тому я відчуваю, що прийшов час говорити ...\r\n\r\n"Ні, я більше не барабанщик [SABATON], і НІ, мене не вигнали. Я прийняв рішення залишити групу з багатьох причин, але це було НЕ, тому що я втомився від гастролей, і це було ПОВИННО НЕ, тому що я планую зупинити гру барабани.', 3, 'https://yt3.ggpht.com/-qxmfOuqKITU/AAAAAAAAAAI/AAAAAAAAAAA/XtmK88rv0s8/s900-c-k-no-mo-rj-c0xffffff/photo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `scene_position`
--

CREATE TABLE IF NOT EXISTS `scene_position` (
  `scene_position_id` int(4) NOT NULL AUTO_INCREMENT,
  `position` varchar(120) NOT NULL,
  PRIMARY KEY (`scene_position_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `scene_position`
--

INSERT INTO `scene_position` (`scene_position_id`, `position`) VALUES
(2, 'Гітара'),
(3, 'Ударна установка'),
(4, 'Соло-гітара'),
(6, 'Бас-гітара'),
(7, 'Головний вокал'),
(8, 'Вокал');

-- --------------------------------------------------------

--
-- Структура таблицы `song`
--

CREATE TABLE IF NOT EXISTS `song` (
  `song_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `song_name` varchar(250) NOT NULL,
  `url` varchar(300) NOT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `song`
--

INSERT INTO `song` (`song_id`, `album_id`, `song_name`, `url`) VALUES
(1, 1, 'Enter Sandman ', 'https://www.youtube.com/embed/CD-E-LDc384'),
(2, 1, 'Sad but True', ''),
(3, 1, 'The Unforgiven', ''),
(4, 1, 'Don''t Tread on Me', ''),
(5, 1, 'The Struggle Within', ''),
(6, 1, 'My Friend of Misery', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

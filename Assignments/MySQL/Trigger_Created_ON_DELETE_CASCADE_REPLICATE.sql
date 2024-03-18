CREATE DEFINER=`root`@`localhost` TRIGGER `ON_DELETE_CASCADE_REPLICATE` AFTER DELETE ON `movies` FOR EACH ROW BEGIN
delete from rentals where movieid = OLD.id;
END
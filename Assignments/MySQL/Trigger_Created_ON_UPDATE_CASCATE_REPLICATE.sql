CREATE DEFINER=`root`@`localhost` TRIGGER `ON_UPDATE_CASCADE_REPLICATE` AFTER UPDATE ON `movies` FOR EACH ROW BEGIN
update rentals set movieid = NEW.id
where movieid = OLD.id;
END
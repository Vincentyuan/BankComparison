-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 26 Mars 2016 à 17:58
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `pa8`
--

-- --------------------------------------------------------

--
-- Structure de la table `bankaccountmgmt`
--

CREATE TABLE IF NOT EXISTS `bankaccountmgmt` (
  `bankId` int(11) NOT NULL AUTO_INCREMENT,
  `openingFee` varchar(255) NOT NULL,
  `bankChangingFee` varchar(255) NOT NULL,
  `agenceTransfertFee` varchar(255) NOT NULL,
  `closureFee` varchar(255) NOT NULL,
  `accountStatement` varchar(255) NOT NULL,
  `activeAccountMgmt` varchar(255) NOT NULL,
  `inactiveAccountMgmt` varchar(255) NOT NULL,
  PRIMARY KEY (`bankId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `bankaccountmgmt`
--

INSERT INTO `bankaccountmgmt` (`bankId`, `openingFee`, `bankChangingFee`, `agenceTransfertFee`, `closureFee`, `accountStatement`, `activeAccountMgmt`, `inactiveAccountMgmt`) VALUES
(1, 'Free', 'Free', 'Free', 'Free', 'Monthly : free\r\nWeekly or daily : 1€/supplementary statement\r\nFortnight or classed by operation type : 16€/an', '2€/month, withdrawal each trimester', '30€/year'),
(2, '', 'Free', 'Free', 'Free', 'Monthly : free\r\n0.95€/supplementary statement', '2€/month\r\nFor non-resident :\r\n-Zone EEE : 35€/an\r\n-Other cases : consult with manager\r\nIn currency: 5.45€', '33.50€/year'),
(3, 'Free', 'Free', 'Free', 'Free', 'Monthly free\r\nOther: 1.60€/ supplementary statement\r\nWeb : free', 'Free for personal contract : \r\n1.50€/month with Web Relevé\r\n2€/month without Web Relevé', '30€/year');

-- --------------------------------------------------------

--
-- Structure de la table `bankaddress`
--

CREATE TABLE IF NOT EXISTS `bankaddress` (
  `bankId` int(11) NOT NULL,
  `addressId` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `bankManager` int(11) DEFAULT NULL,
  PRIMARY KEY (`bankId`,`addressId`),
  KEY `addressId` (`addressId`),
  KEY `bankManager` (`bankManager`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bankbasicinformation`
--

CREATE TABLE IF NOT EXISTS `bankbasicinformation` (
  `bankId` int(11) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(30) NOT NULL,
  `bankLogoPath` varchar(100) NOT NULL,
  `bankBasicInformation` varchar(200) DEFAULT NULL,
  `openCloseTimeAndDay` varchar(255) NOT NULL,
  `openAccountReturn` varchar(255) NOT NULL,
  `yearlyFee` varchar(255) NOT NULL,
  `internationalTransferFee` varchar(255) NOT NULL,
  `spendingLimitPerMonth` varchar(255) NOT NULL,
  `cashWithdrawLimitPerMonth` varchar(255) NOT NULL,
  `overspendLimit` varchar(255) NOT NULL,
  `interestRateYouth` varchar(255) NOT NULL,
  `interestRateGeneral` varchar(255) NOT NULL,
  `interestRateOverspend` varchar(255) NOT NULL,
  `hasOnlineBank` varchar(255) NOT NULL,
  PRIMARY KEY (`bankId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `bankbasicinformation`
--

INSERT INTO `bankbasicinformation` (`bankId`, `bankName`, `bankLogoPath`, `bankBasicInformation`, `openCloseTimeAndDay`, `openAccountReturn`, `yearlyFee`, `internationalTransferFee`, `spendingLimitPerMonth`, `cashWithdrawLimitPerMonth`, `overspendLimit`, `interestRateYouth`, `interestRateGeneral`, `interestRateOverspend`, `hasOnlineBank`) VALUES
(1, 'Société Générale', '', NULL, '', '', '', '', '', '', '', '', '', '', ''),
(2, 'Crédit Mutuelle Ile-de-France', '', NULL, '', '', '', '', '', '', '', '', '', '', ''),
(3, 'CIC', '', NULL, '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `bankbasicservices`
--

CREATE TABLE IF NOT EXISTS `bankbasicservices` (
  `bankId` int(11) NOT NULL AUTO_INCREMENT,
  `internetService` varchar(255) NOT NULL,
  `SMSAlert` varchar(255) NOT NULL,
  `immediateDebitCard` varchar(255) NOT NULL,
  `deferredDebitCard` varchar(255) NOT NULL,
  `systAutorisationDebitCard` varchar(255) NOT NULL,
  `otherBankATM` varchar(255) NOT NULL,
  `SEPAOccTransf` varchar(255) NOT NULL,
  `SEPAPayment` varchar(255) NOT NULL,
  `interventionCommission` varchar(255) NOT NULL,
  `insurance` varchar(255) NOT NULL,
  `managementFee` varchar(255) NOT NULL,
  PRIMARY KEY (`bankId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `bankbasicservices`
--

INSERT INTO `bankbasicservices` (`bankId`, `internetService`, `SMSAlert`, `immediateDebitCard`, `deferredDebitCard`, `systAutorisationDebitCard`, `otherBankATM`, `SEPAOccTransf`, `SEPAPayment`, `interventionCommission`, `insurance`, `managementFee`) VALUES
(1, 'Free', '3.65€/month', '44.50€/year', '44.50€/year', '35€/year', '1€ per withdrawal starting from the 4th one per month', 'In agency : 3.80€/transfer\r\nInternet : free', 'free', '8€ per operation\r\nwith 80€/month ceiling', '30€/year', '2€/month, withdrawed each trimester'),
(2, 'Free(consultation & internal operation)\n12€/year(external operation, stock exchange option)', '0.20€ per alert', '37€/year', '46.20€/year', '28€/year', '1€ per withdrawal starting from the 5th one per month', 'In agency : 3.50€/ transfer\r\nInternet : free', 'Free', '8€ per operation\r\nwith 80€/month ceiling', '26€/year', '2€/mois'),
(3, 'Free', '1€/month for 5 alerts\r\n0.20€ per supplementary alert', '40€/year', '46.50€/year', '32€/year', '1€ per withdrawal starting from the 5th one per month', 'In agency : 3.90€/ transfer\r\nInternet : free', 'Free', '8€ per operation\r\nwith 80€/month ceiling', '26€/year', '2€/mois');

-- --------------------------------------------------------

--
-- Structure de la table `bankcardservices`
--

CREATE TABLE IF NOT EXISTS `bankcardservices` (
  `bankId` int(11) NOT NULL AUTO_INCREMENT,
  `VISAInfiniteCard` varchar(255) NOT NULL,
  `VISAGoldPremierCard` varchar(255) NOT NULL,
  `VISAMasterCard` varchar(255) NOT NULL,
  `collectorCardFee` varchar(255) NOT NULL,
  `cardRenewalToAdress` varchar(255) NOT NULL,
  `cashWithdrawalAnotherBankCounter` varchar(255) NOT NULL,
  `cashWithdrawalAnotherBankATM` varchar(255) NOT NULL,
  `nonEUZonePayment` varchar(255) NOT NULL,
  `nonEUZoneWithdrawal` varchar(255) NOT NULL,
  `codeEditing` varchar(255) NOT NULL,
  `oppositionFee` varchar(255) NOT NULL,
  PRIMARY KEY (`bankId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `bankcardservices`
--

INSERT INTO `bankcardservices` (`bankId`, `VISAInfiniteCard`, `VISAGoldPremierCard`, `VISAMasterCard`, `collectorCardFee`, `cardRenewalToAdress`, `cashWithdrawalAnotherBankCounter`, `cashWithdrawalAnotherBankATM`, `nonEUZonePayment`, `nonEUZoneWithdrawal`, `codeEditing`, `oppositionFee`) VALUES
(1, '330€/year', '135€/year', '44.5€/year (-50% for -25 year old)', 'Visual : 12€/year\r\nVisual + service : 24€/year\r\n-30 So Music: -50%', 'Automatic renewal: free\r\nDysfunction : free\r\nClient request : 16€\r\nBlockage, loss, theft, fraudulent utilisation: 16€\r\n(included in JAZZ)', '3€ / withdrawal', 'Carte Visa Infinite - Visa Premier - Gold MasterCard : free\r\nCarte Visa – MasterCard :\r\n	- JAZZ(6 free)\r\n	-hors JAZZ (3 free)\r\nCarte Visa Alterna : \r\n-	JAZZ (no object)\r\n-	Hors JAZZ (3 free)\r\nBeyond : 1€/withdrawal\r\n\r\n+Each month\r\n', '', '', 'Code card : 10€\nCode e-carte bleue : 5€\n', 'Lost : free\nAbusive utilisation : free\n'),
(2, '325/year', '127/year', 'Immediate debit: 37€/an\r\ndeferred debit: 46.20€/an', 'A partir de 4€', 'Reconfection : 12.50€', '', '1€/withdrawal from the 5th one onward per month ', 'Commission fixed : 0.33€\r\nCommission on amount:\r\n-EU + Swiss :1%\r\n-Other : 2.25%\r\nMaximmun perception :8.20€\r\n', 'Commission fixed : Per ATM withdrawal: 3.30€\r\nCommission on amount:\r\n-EU + Swiss :1%\r\n-Other : 2.25%\r\nMaximmun perception :8.20€\r\n', '5.40€', ''),
(3, '330/year', '132/year', 'Immediate debit: 40€/an\r\ndeferred debit: 46.50€/an\r\n', 'Hors series limited : free\r\nLimited series : consult\r\n', 'Reediting  card :\r\n13€\r\n72€ in urgency\r\n', '8.15€', '1€/withdrawal from the 5th one onward per month', 'Per payment  : 2,90 %\r\nmaximum : 8,15€\r\n', 'Per withdrawal : 2,90 % + 3,00€\r\nmaximum : 8,15€\r\n', '9.70€\r\n60€ in urgency\r\n', 'free');

-- --------------------------------------------------------

--
-- Structure de la table `bankmanager`
--

CREATE TABLE IF NOT EXISTS `bankmanager` (
  `managerId` int(11) NOT NULL AUTO_INCREMENT,
  `bankCity` int(11) NOT NULL,
  `bankAddressDetail` varchar(100) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL,
  `agence` varchar(50) DEFAULT NULL,
  `certifyStatus` varchar(10) NOT NULL,
  `Fax` varchar(15) DEFAULT NULL,
  `bankId` int(11) NOT NULL,
  PRIMARY KEY (`managerId`),
  KEY `bankCity` (`bankCity`),
  KEY `bankId` (`bankId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `bankonlineservice`
--

CREATE TABLE IF NOT EXISTS `bankonlineservice` (
  `bankId` int(11) NOT NULL AUTO_INCREMENT,
  `onlineBankServFee` varchar(255) NOT NULL,
  `SMSAlert` varchar(255) NOT NULL,
  PRIMARY KEY (`bankId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `bankonlineservice`
--

INSERT INTO `bankonlineservice` (`bankId`, `onlineBankServFee`, `SMSAlert`) VALUES
(1, 'Free', '3.65€/mois\r\n(Géneris : 2.75€/mois)\r\n'),
(2, 'CMUT Direct Basis : Free\r\n(consultation & internal operations)\r\n\r\nCMUT Direct : 12€/year\r\n(external operation, stock option)', '0.20€/SMS or Mail'),
(3, 'Filibanque Subscription:\r\n\r\nConsulting and operation : free\r\nExternal operation and stock option :\r\n->Standard : 2€/month or 1€ for -25 year old\r\n->Web : 1.40€/month or 0.70€ for -25 year old', '5 messages Package : 1,00€/Month\r\n0.20€/supplementary messages\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `banktransfertchequeservices`
--

CREATE TABLE IF NOT EXISTS `banktransfertchequeservices` (
  `bankId` int(11) NOT NULL AUTO_INCREMENT,
  `Internal transfer` varchar(255) NOT NULL,
  `Occa SEPA Emission` varchar(255) NOT NULL,
  `Occa SEPA Reception` varchar(255) NOT NULL,
  `Permanent SEPA Emission` varchar(255) NOT NULL,
  `TIP/SEPA Payment fee` varchar(255) NOT NULL,
  `Check book sent at home fee (outside postal fee)` varchar(255) NOT NULL,
  `Bank cheque emission fee` varchar(255) NOT NULL,
  `Cheque photocopy` varchar(255) NOT NULL,
  `Cheque or cheque book opposition by Sender(loss or theft)` varchar(255) NOT NULL,
  `Issue cheque payable in other countries in € or currency` varchar(255) NOT NULL,
  `Cheque payment, issued in foreign countries in € or in currency` varchar(255) NOT NULL,
  PRIMARY KEY (`bankId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `cityId` int(11) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(20) NOT NULL,
  `cityLocation` varchar(20) NOT NULL,
  PRIMARY KEY (`cityId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `city`
--

INSERT INTO `city` (`cityId`, `cityName`, `cityLocation`) VALUES
(1, 'beijing', '23'),
(2, 'beijing', '23');

-- --------------------------------------------------------

--
-- Structure de la table `communicationtable`
--

CREATE TABLE IF NOT EXISTS `communicationtable` (
  `communicationId` int(11) NOT NULL,
  `requestId` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `messageBody` varchar(200) NOT NULL,
  `messageStatus` varchar(10) NOT NULL,
  `attacheFile` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`communicationId`),
  KEY `requestId` (`requestId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `generaluser`
--

CREATE TABLE IF NOT EXISTS `generaluser` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userIdentification` varchar(30) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `firstName` varchar(10) DEFAULT NULL,
  `userPassword` varchar(30) NOT NULL,
  `addressFrance` int(11) DEFAULT NULL,
  `userType` int(11) NOT NULL,
  `school` int(11) DEFAULT NULL,
  `expectionTime` date NOT NULL,
  `selfIntroduce` varchar(200) DEFAULT NULL,
  `recommendCode` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `addressFrance` (`addressFrance`),
  KEY `school` (`school`),
  KEY `recommendCode` (`recommendCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `recommendperson`
--

CREATE TABLE IF NOT EXISTS `recommendperson` (
  `recommendCode` varchar(8) NOT NULL,
  `firstName` varchar(10) DEFAULT NULL,
  `lastName` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `identityIntroduction` varchar(100) NOT NULL,
  `certifyStatus` varchar(10) NOT NULL,
  `schoolId` int(11) NOT NULL,
  PRIMARY KEY (`recommendCode`),
  KEY `schoolId` (`schoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `requestId` int(11) NOT NULL AUTO_INCREMENT,
  `bankManagerId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `startTime` date NOT NULL,
  `fileFolder` varchar(200) DEFAULT NULL,
  `isFinished` tinyint(1) NOT NULL,
  `requestOrder` varchar(50) DEFAULT NULL,
  `requestStatus` varchar(10) NOT NULL,
  `expectedCityToTake` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`requestId`),
  KEY `bankManagerId` (`bankManagerId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `requestsolidify`
--

CREATE TABLE IF NOT EXISTS `requestsolidify` (
  `requestId` int(11) NOT NULL,
  `finishTime` date NOT NULL,
  `conclude` varchar(100) DEFAULT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  KEY `requestId` (`requestId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `schoolId` int(11) NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(50) NOT NULL,
  `schoolAddress` varchar(255) NOT NULL,
  `schoolEmail` varchar(30) NOT NULL,
  `schoolTelephone` int(11) NOT NULL,
  PRIMARY KEY (`schoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bankaddress`
--
ALTER TABLE `bankaddress`
  ADD CONSTRAINT `bankaddress_ibfk_1` FOREIGN KEY (`bankId`) REFERENCES `bankbasicinformation` (`bankId`),
  ADD CONSTRAINT `bankaddress_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `city` (`cityId`),
  ADD CONSTRAINT `bankaddress_ibfk_3` FOREIGN KEY (`bankManager`) REFERENCES `bankmanager` (`managerId`);

--
-- Contraintes pour la table `bankmanager`
--
ALTER TABLE `bankmanager`
  ADD CONSTRAINT `bankmanager_ibfk_1` FOREIGN KEY (`bankCity`) REFERENCES `city` (`cityId`),
  ADD CONSTRAINT `bankmanager_ibfk_2` FOREIGN KEY (`bankId`) REFERENCES `bankbasicinformation` (`bankId`);

--
-- Contraintes pour la table `communicationtable`
--
ALTER TABLE `communicationtable`
  ADD CONSTRAINT `communicationtable_ibfk_1` FOREIGN KEY (`requestId`) REFERENCES `request` (`requestId`);

--
-- Contraintes pour la table `generaluser`
--
ALTER TABLE `generaluser`
  ADD CONSTRAINT `generaluser_ibfk_1` FOREIGN KEY (`addressFrance`) REFERENCES `city` (`cityId`),
  ADD CONSTRAINT `generaluser_ibfk_2` FOREIGN KEY (`school`) REFERENCES `school` (`schoolId`),
  ADD CONSTRAINT `generaluser_ibfk_3` FOREIGN KEY (`recommendCode`) REFERENCES `recommendperson` (`recommendCode`);

--
-- Contraintes pour la table `recommendperson`
--
ALTER TABLE `recommendperson`
  ADD CONSTRAINT `recommendperson_ibfk_1` FOREIGN KEY (`schoolId`) REFERENCES `school` (`schoolId`);

--
-- Contraintes pour la table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`bankManagerId`) REFERENCES `bankmanager` (`managerId`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `generaluser` (`userId`);

--
-- Contraintes pour la table `requestsolidify`
--
ALTER TABLE `requestsolidify`
  ADD CONSTRAINT `requestsolidify_ibfk_1` FOREIGN KEY (`requestId`) REFERENCES `request` (`requestId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

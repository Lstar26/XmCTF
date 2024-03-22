/*
 Navicat Premium Data Transfer

 Source Server         : LocalDB
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 22/03/2024 02:29:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Attachments
-- ----------------------------
DROP TABLE IF EXISTS `Attachments`;
CREATE TABLE `Attachments` (
                               `Id` int NOT NULL AUTO_INCREMENT,
                               `Type` smallint NOT NULL,
                               `RemoteUrl` text,
                               `LocalFileId` int DEFAULT NULL,
                               PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Attachments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for CheatInfo
-- ----------------------------
DROP TABLE IF EXISTS `CheatInfo`;
CREATE TABLE `CheatInfo` (
                             `SubmissionId` int NOT NULL,
                             `GameId` int NOT NULL,
                             `SubmitTeamId` int NOT NULL,
                             `SourceTeamId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CheatInfo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Containers
-- ----------------------------
DROP TABLE IF EXISTS `Containers`;
CREATE TABLE `Containers` (
                              `Id` char(36) NOT NULL,
                              `Image` text NOT NULL,
                              `ContainerId` text NOT NULL,
                              `Status` smallint NOT NULL,
                              `StartedAt` datetime NOT NULL,
                              `ExpectStopAt` datetime NOT NULL,
                              `IsProxy` tinyint(1) NOT NULL,
                              `IP` text NOT NULL,
                              `Port` int NOT NULL,
                              `PublicIP` text,
                              `PublicPort` int DEFAULT NULL,
                              `GameInstanceId` int DEFAULT NULL,
                              `ExerciseInstanceId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Containers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ExerciseChallenges
-- ----------------------------
DROP TABLE IF EXISTS `ExerciseChallenges`;
CREATE TABLE `ExerciseChallenges` (
                                      `Id` int NOT NULL,
                                      `Credit` tinyint(1) NOT NULL,
                                      `Difficulty` smallint NOT NULL,
                                      `Tags` text,
                                      `Title` text NOT NULL,
                                      `Content` text NOT NULL,
                                      `Tag` smallint NOT NULL,
                                      `Type` smallint NOT NULL,
                                      `Hints` text,
                                      `IsEnabled` tinyint(1) NOT NULL,
                                      `AcceptedCount` int NOT NULL,
                                      `SubmissionCount` int NOT NULL,
                                      `ContainerImage` text,
                                      `MemoryLimit` int DEFAULT NULL,
                                      `StorageLimit` int DEFAULT NULL,
                                      `CPUCount` int DEFAULT NULL,
                                      `ContainerExposePort` int DEFAULT NULL,
                                      `FileName` text,
                                      `ConcurrencyStamp` char(36) NOT NULL,
                                      `FlagTemplate` text,
                                      `AttachmentId` int DEFAULT NULL,
                                      `TestContainerId` char(36) DEFAULT NULL,
                                      PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of ExerciseChallenges
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ExerciseDependencies
-- ----------------------------
DROP TABLE IF EXISTS `ExerciseDependencies`;
CREATE TABLE `ExerciseDependencies` (
                                        `SourceId` int NOT NULL,
                                        `TargetId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of ExerciseDependencies
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ExerciseInstances
-- ----------------------------
DROP TABLE IF EXISTS `ExerciseInstances`;
CREATE TABLE `ExerciseInstances` (
                                     `UserId` char(36) NOT NULL,
                                     `ExerciseId` int NOT NULL,
                                     `SolveTimeUtc` datetime NOT NULL,
                                     `IsSolved` tinyint(1) NOT NULL,
                                     `IsLoaded` tinyint(1) NOT NULL,
                                     `LastContainerOperation` datetime NOT NULL,
                                     `FlagId` int DEFAULT NULL,
                                     `ContainerId` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of ExerciseInstances
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Files
-- ----------------------------
DROP TABLE IF EXISTS `Files`;
CREATE TABLE `Files` (
                         `Id` int NOT NULL AUTO_INCREMENT,
                         `Hash` varchar(64) NOT NULL,
                         `UploadTimeUtc` datetime NOT NULL,
                         `FileSize` bigint NOT NULL,
                         `Name` text NOT NULL,
                         `ReferenceCount` bigint NOT NULL,
                         PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Files
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for FlagContexts
-- ----------------------------
DROP TABLE IF EXISTS `FlagContexts`;
CREATE TABLE `FlagContexts` (
                                `Id` int NOT NULL,
                                `Flag` text NOT NULL,
                                `IsOccupied` tinyint(1) NOT NULL,
                                `AttachmentId` int DEFAULT NULL,
                                `ChallengeId` int DEFAULT NULL,
                                `ExerciseId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of FlagContexts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for GameChallenges
-- ----------------------------
DROP TABLE IF EXISTS `GameChallenges`;
CREATE TABLE `GameChallenges` (
                                  `Id` int NOT NULL AUTO_INCREMENT,
                                  `EnableTrafficCapture` tinyint(1) NOT NULL,
                                  `OriginalScore` int NOT NULL,
                                  `MinScoreRate` double NOT NULL,
                                  `Difficulty` double NOT NULL,
                                  `GameId` int NOT NULL,
                                  `Title` text NOT NULL,
                                  `Content` text NOT NULL,
                                  `Tag` smallint NOT NULL,
                                  `Type` smallint NOT NULL,
                                  `Hints` text,
                                  `IsEnabled` tinyint(1) NOT NULL,
                                  `AcceptedCount` int NOT NULL,
                                  `SubmissionCount` int NOT NULL,
                                  `ContainerImage` text,
                                  `MemoryLimit` int DEFAULT NULL,
                                  `StorageLimit` int DEFAULT NULL,
                                  `CPUCount` int DEFAULT NULL,
                                  `ContainerExposePort` int DEFAULT NULL,
                                  `FileName` text,
                                  `ConcurrencyStamp` char(36) NOT NULL,
                                  `FlagTemplate` text,
                                  `AttachmentId` int DEFAULT NULL,
                                  `TestContainerId` char(36) DEFAULT NULL,
                                  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of GameChallenges
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for GameEvents
-- ----------------------------
DROP TABLE IF EXISTS `GameEvents`;
CREATE TABLE `GameEvents` (
                              `Id` int NOT NULL AUTO_INCREMENT,
                              `Type` smallint NOT NULL,
                              `Values` text NOT NULL,
                              `PublishTimeUtc` datetime NOT NULL,
                              `UserId` char(36) DEFAULT NULL,
                              `TeamId` int NOT NULL,
                              `GameId` int NOT NULL,
                              PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of GameEvents
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for GameInstances
-- ----------------------------
DROP TABLE IF EXISTS `GameInstances`;
CREATE TABLE `GameInstances` (
                                 `ChallengeId` int NOT NULL,
                                 `ParticipationId` int NOT NULL,
                                 `IsSolved` tinyint(1) NOT NULL,
                                 `IsLoaded` tinyint(1) NOT NULL,
                                 `LastContainerOperation` datetime NOT NULL,
                                 `FlagId` int DEFAULT NULL,
                                 `ContainerId` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of GameInstances
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for GameNotices
-- ----------------------------
DROP TABLE IF EXISTS `GameNotices`;
CREATE TABLE `GameNotices` (
                               `Id` int NOT NULL AUTO_INCREMENT,
                               `Type` smallint NOT NULL,
                               `Values` text NOT NULL,
                               `PublishTimeUtc` datetime NOT NULL,
                               `GameId` int NOT NULL,
                               PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of GameNotices
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Games
-- ----------------------------
DROP TABLE IF EXISTS `Games`;
CREATE TABLE `Games` (
                         `Id` int NOT NULL AUTO_INCREMENT,
                         `Title` text NOT NULL,
                         `PublicKey` varchar(63) NOT NULL,
                         `PrivateKey` varchar(63) NOT NULL,
                         `Hidden` tinyint(1) NOT NULL,
                         `PosterHash` varchar(64) DEFAULT NULL,
                         `Summary` text NOT NULL,
                         `Content` text NOT NULL,
                         `AcceptWithoutReview` tinyint(1) NOT NULL,
                         `WriteupRequired` tinyint(1) NOT NULL,
                         `InviteCode` text,
                         `Organizations` text,
                         `TeamMemberCountLimit` int NOT NULL,
                         `ContainerCountLimit` int NOT NULL,
                         `StartTimeUtc` datetime NOT NULL,
                         `EndTimeUtc` datetime NOT NULL,
                         `WriteupDeadline` datetime NOT NULL,
                         `WriteupNote` text NOT NULL,
                         `BloodBonus` bigint NOT NULL,
                         `PracticeMode` tinyint(1) NOT NULL,
                         PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Games
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Logs
-- ----------------------------
DROP TABLE IF EXISTS `Logs`;
CREATE TABLE `Logs` (
                        `Id` int NOT NULL AUTO_INCREMENT,
                        `TimeUtc` datetime NOT NULL,
                        `Level` varchar(50) NOT NULL,
                        `Logger` varchar(250) NOT NULL,
                        `RemoteIP` varchar(40) DEFAULT NULL,
                        `UserName` varchar(25) DEFAULT NULL,
                        `Message` text NOT NULL,
                        `Status` varchar(20) DEFAULT NULL,
                        `Exception` text,
                        PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Logs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Participations
-- ----------------------------
DROP TABLE IF EXISTS `Participations`;
CREATE TABLE `Participations` (
                                  `Id` int NOT NULL AUTO_INCREMENT,
                                  `Status` int NOT NULL,
                                  `Token` text NOT NULL,
                                  `Organization` text,
                                  `WriteupId` int DEFAULT NULL,
                                  `GameId` int NOT NULL,
                                  `TeamId` int NOT NULL,
                                  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Participations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Posts
-- ----------------------------
DROP TABLE IF EXISTS `Posts`;
CREATE TABLE `Posts` (
                         `Id` varchar(8) NOT NULL,
                         `Title` text NOT NULL,
                         `Summary` text NOT NULL,
                         `Content` text NOT NULL,
                         `IsPinned` tinyint(1) NOT NULL,
                         `Tags` text,
                         `AuthorId` char(36) DEFAULT NULL,
                         `UpdateTimeUtc` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Posts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Submissions
-- ----------------------------
DROP TABLE IF EXISTS `Submissions`;
CREATE TABLE `Submissions` (
                               `Id` int NOT NULL AUTO_INCREMENT,
                               `Answer` varchar(127) NOT NULL,
                               `Status` text NOT NULL,
                               `SubmitTimeUtc` datetime NOT NULL,
                               `UserId` char(36) DEFAULT NULL,
                               `TeamId` int NOT NULL,
                               `ParticipationId` int NOT NULL,
                               `GameId` int NOT NULL,
                               `ChallengeId` int NOT NULL,
                               PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Submissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Teams
-- ----------------------------
DROP TABLE IF EXISTS `Teams`;
CREATE TABLE `Teams` (
                         `Id` int NOT NULL AUTO_INCREMENT,
                         `Name` varchar(16) NOT NULL,
                         `Bio` varchar(32) DEFAULT NULL,
                         `AvatarHash` varchar(64) DEFAULT NULL,
                         `Locked` tinyint(1) NOT NULL,
                         `InviteToken` varchar(32) NOT NULL,
                         `CaptainId` char(36) NOT NULL,
                         PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Teams
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for TeamUserInfo
-- ----------------------------
DROP TABLE IF EXISTS `TeamUserInfo`;
CREATE TABLE `TeamUserInfo` (
                                `MembersId` char(36) NOT NULL,
                                `TeamsId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of TeamUserInfo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for UserParticipations
-- ----------------------------
DROP TABLE IF EXISTS `UserParticipations`;
CREATE TABLE `UserParticipations` (
                                      `UserId` char(36) NOT NULL,
                                      `TeamId` int NOT NULL,
                                      `GameId` int NOT NULL,
                                      `ParticipationId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of UserParticipations
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

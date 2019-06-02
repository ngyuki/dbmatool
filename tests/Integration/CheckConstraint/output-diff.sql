
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

ALTER TABLE `t1` DROP CHECK `c1_nonzero`;

ALTER TABLE `t1` DROP CHECK `t1_chk_3`;

ALTER TABLE `t1` DROP CHECK `c2_positive`;

DROP TABLE `t2`;

CREATE TABLE `t3` (
  `c1` int(11) NULL DEFAULT NULL,
  `c2` int(11) NULL DEFAULT NULL
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='' ROW_FORMAT=Dynamic;

ALTER TABLE `t3` ADD CONSTRAINT `t3_chk_1` CHECK (`c1` <> `c2`);

ALTER TABLE `t3` ADD CONSTRAINT `t3_chk_2` CHECK (`c1` > 10);

ALTER TABLE `t1` ADD CONSTRAINT `c1_nonzero` CHECK (`c1` <> 0) NOT ENFORCED;

ALTER TABLE `t1` ADD CONSTRAINT `c2x_positive` CHECK (`c2` > 0);

ALTER TABLE `t1` ADD CONSTRAINT `t1_chk_3` CHECK (`c3` < 200);

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

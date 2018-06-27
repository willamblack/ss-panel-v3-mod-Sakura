ALTER TABLE `ss_node` ADD `dns_type` INT(1) NULL DEFAULT '0' AFTER `mu_only`;
ALTER TABLE `ss_node` ADD `dns_value` TEXT NULL DEFAULT '' AFTER `dns_type`;
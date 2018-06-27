SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sakura_all`
--

-- --------------------------------------------------------

--
-- 表的结构 `alive_ip`
--

CREATE TABLE `alive_ip` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `markdown` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auto`
--

CREATE TABLE `auto` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `value` longtext NOT NULL,
  `sign` longtext NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `blockip`
--

CREATE TABLE `blockip` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bought`
--

CREATE TABLE `bought` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `shopid` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `renew` bigint(11) NOT NULL,
  `coupon` text NOT NULL,
  `price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `code`
--

CREATE TABLE `code` (
  `id` bigint(20) NOT NULL,
  `code` text NOT NULL,
  `type` int(11) NOT NULL,
  `number` decimal(11,2) NOT NULL,
  `isused` int(11) NOT NULL DEFAULT 0,
  `userid` bigint(20) NOT NULL,
  `usedatetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `coupon`
--

CREATE TABLE `coupon` (
  `id` bigint(20) NOT NULL,
  `code` text NOT NULL,
  `onetime` int(11) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `shop` text NOT NULL,
  `credit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `detect_list`
--

CREATE TABLE `detect_list` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL,
  `text` longtext NOT NULL,
  `regex` longtext NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `detect_log`
--

CREATE TABLE `detect_log` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `node_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `disconnect_ip`
--

CREATE TABLE `disconnect_ip` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `email_verify`
--

CREATE TABLE `email_verify` (
  `id` bigint(20) NOT NULL,
  `email` text NOT NULL,
  `ip` text NOT NULL,
  `code` text NOT NULL,
  `expire_in` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `link`
--

CREATE TABLE `link` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `address` text NOT NULL,
  `port` int(11) NOT NULL,
  `token` text NOT NULL,
  `ios` int(11) NOT NULL DEFAULT 0,
  `userid` bigint(20) NOT NULL,
  `isp` text DEFAULT NULL,
  `geo` int(11) DEFAULT NULL,
  `method` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `login_ip`
--

CREATE TABLE `login_ip` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `payback`
--

CREATE TABLE `payback` (
  `id` bigint(20) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ref_by` bigint(20) NOT NULL,
  `ref_get` decimal(12,2) NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `paylist`
--

CREATE TABLE `paylist` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `tradeno` text DEFAULT NULL,
  `datetime` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `radius_ban`
--

CREATE TABLE `radius_ban` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `relay`
--

CREATE TABLE `relay` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `source_node_id` bigint(20) NOT NULL,
  `dist_node_id` bigint(20) NOT NULL,
  `dist_ip` text NOT NULL,
  `port` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop`
--

CREATE TABLE `shop` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `content` text NOT NULL,
  `auto_renew` int(11) NOT NULL,
  `auto_reset_bandwidth` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `speedtest`
--

CREATE TABLE `speedtest` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `telecomping` text NOT NULL,
  `telecomeupload` text NOT NULL,
  `telecomedownload` text NOT NULL,
  `unicomping` text NOT NULL,
  `unicomupload` text NOT NULL,
  `unicomdownload` text NOT NULL,
  `cmccping` text NOT NULL,
  `cmccupload` text NOT NULL,
  `cmccdownload` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ss_invite_code`
--

CREATE TABLE `ss_invite_code` (
  `id` int(11) NOT NULL,
  `code` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '2016-06-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ss_node`
--

CREATE TABLE `ss_node` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` int(3) NOT NULL,
  `server` varchar(128) NOT NULL,
  `method` varchar(64) NOT NULL,
  `info` varchar(128) NOT NULL,
  `status` varchar(128) NOT NULL,
  `sort` int(3) NOT NULL,
  `custom_method` tinyint(1) NOT NULL DEFAULT 0,
  `traffic_rate` float NOT NULL DEFAULT 1,
  `node_class` int(11) NOT NULL DEFAULT 0,
  `node_speedlimit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `node_connector` int(11) NOT NULL DEFAULT 0,
  `node_bandwidth` bigint(20) NOT NULL DEFAULT 0,
  `node_bandwidth_limit` bigint(20) NOT NULL DEFAULT 0,
  `bandwidthlimit_resetday` int(11) NOT NULL DEFAULT 0,
  `node_heartbeat` bigint(20) NOT NULL DEFAULT 0,
  `node_ip` text DEFAULT NULL,
  `node_group` int(11) NOT NULL DEFAULT 0,
  `custom_rss` int(11) NOT NULL DEFAULT 0,
  `mu_only` int(11) DEFAULT 0,
  `dns_type` int(3) NOT NULL DEFAULT 1,
  `dns_value` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ss_node`
--

INSERT INTO `ss_node` (`id`, `name`, `type`, `server`, `method`, `info`, `status`, `sort`, `custom_method`, `traffic_rate`, `node_class`, `node_speedlimit`, `node_connector`, `node_bandwidth`, `node_bandwidth_limit`, `bandwidthlimit_resetday`, `node_heartbeat`, `node_ip`, `node_group`, `custom_rss`, `mu_only`, `ip_sync`) VALUES
(1, '统一验证登陆', 0, 'zhaojin97.cn', 'radius', '统一登陆验证', '可用', 999, 0, 1, 0, '0.00', 0, 0, 0, 0, 0, '', 0, 0, 0, 0),
(2, 'VPN 统一流量结算', 0, 'zhaojin97.cn', 'radius', 'VPN 统一流量结算', '可用', 999, 0, 1, 0, '0.00', 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ss_node_info`
--

CREATE TABLE `ss_node_info` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `uptime` float NOT NULL,
  `load` varchar(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ss_node_online_log`
--

CREATE TABLE `ss_node_online_log` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `online_user` int(11) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ss_password_reset`
--

CREATE TABLE `ss_password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `token` varchar(128) NOT NULL,
  `init_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `telegram_session`
--

CREATE TABLE `telegram_session` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `session_content` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `ticket`
--

CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL,
  `rootid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `unblockip`
--

CREATE TABLE `unblockip` (
  `id` bigint(20) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(32) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `passwd` varchar(16) NOT NULL,
  `t` int(11) NOT NULL DEFAULT 0,
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `plan` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'A',
  `transfer_enable` bigint(20) NOT NULL,
  `port` int(11) NOT NULL,
  `switch` tinyint(4) NOT NULL DEFAULT 1,
  `enable` tinyint(4) NOT NULL DEFAULT 1,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `last_get_gift_time` int(11) NOT NULL DEFAULT 0,
  `last_check_in_time` int(11) NOT NULL DEFAULT 0,
  `last_rest_pass_time` int(11) NOT NULL DEFAULT 0,
  `reg_date` datetime NOT NULL,
  `invite_num` int(8) NOT NULL,
  `money` decimal(12,2) NOT NULL,
  `ref_by` int(11) NOT NULL DEFAULT 0,
  `expire_time` int(11) NOT NULL DEFAULT 0,
  `method` varchar(64) NOT NULL DEFAULT 'rc4-md5',
  `is_email_verify` tinyint(4) NOT NULL DEFAULT 0,
  `reg_ip` varchar(128) NOT NULL DEFAULT '127.0.0.1',
  `node_speedlimit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `node_connector` int(11) NOT NULL DEFAULT 0,
  `is_admin` int(2) NOT NULL DEFAULT 0,
  `im_type` int(11) DEFAULT 1,
  `im_value` text DEFAULT NULL,
  `last_day_t` bigint(20) NOT NULL DEFAULT 0,
  `sendDailyMail` int(11) NOT NULL DEFAULT 1,
  `class` int(11) NOT NULL DEFAULT 0,
  `class_expire` datetime NOT NULL DEFAULT '1989-06-04 00:05:00',
  `expire_in` datetime NOT NULL DEFAULT '2099-06-04 00:05:00',
  `theme` text NOT NULL,
  `ga_token` text NOT NULL,
  `ga_enable` int(11) NOT NULL DEFAULT 0,
  `pac` longtext DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `node_group` int(11) NOT NULL DEFAULT 0,
  `auto_reset_day` int(11) NOT NULL DEFAULT 0,
  `auto_reset_bandwidth` decimal(12,2) NOT NULL DEFAULT 0.00,
  `protocol` varchar(128) DEFAULT 'origin',
  `protocol_param` varchar(128) DEFAULT NULL,
  `obfs` varchar(128) DEFAULT 'plain',
  `obfs_param` varchar(128) DEFAULT NULL,
  `forbidden_ip` longtext DEFAULT '',
  `forbidden_port` longtext DEFAULT '',
  `disconnect_ip` longtext DEFAULT '',
  `is_hide` int(11) NOT NULL DEFAULT 0,
  `is_multi_user` int(11) NOT NULL DEFAULT 0,
  `telegram_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `token` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_traffic_log`
--

CREATE TABLE `user_traffic_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `node_id` int(11) NOT NULL,
  `rate` float NOT NULL,
  `traffic` varchar(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alive_ip`
--
ALTER TABLE `alive_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blockip`
--
ALTER TABLE `blockip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bought`
--
ALTER TABLE `bought`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detect_list`
--
ALTER TABLE `detect_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detect_log`
--
ALTER TABLE `detect_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disconnect_ip`
--
ALTER TABLE `disconnect_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verify`
--
ALTER TABLE `email_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_ip`
--
ALTER TABLE `login_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payback`
--
ALTER TABLE `payback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paylist`
--
ALTER TABLE `paylist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radius_ban`
--
ALTER TABLE `radius_ban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relay`
--
ALTER TABLE `relay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `speedtest`
--
ALTER TABLE `speedtest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_invite_code`
--
ALTER TABLE `ss_invite_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ss_node`
--
ALTER TABLE `ss_node`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_node_info`
--
ALTER TABLE `ss_node_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_node_online_log`
--
ALTER TABLE `ss_node_online_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_password_reset`
--
ALTER TABLE `ss_password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telegram_session`
--
ALTER TABLE `telegram_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unblockip`
--
ALTER TABLE `unblockip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `uid` (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `alive_ip`
--
ALTER TABLE `alive_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auto`
--
ALTER TABLE `auto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `blockip`
--
ALTER TABLE `blockip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `bought`
--
ALTER TABLE `bought`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `code`
--
ALTER TABLE `code`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `detect_list`
--
ALTER TABLE `detect_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `detect_log`
--
ALTER TABLE `detect_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `disconnect_ip`
--
ALTER TABLE `disconnect_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `email_verify`
--
ALTER TABLE `email_verify`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `link`
--
ALTER TABLE `link`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `login_ip`
--
ALTER TABLE `login_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `payback`
--
ALTER TABLE `payback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `paylist`
--
ALTER TABLE `paylist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `radius_ban`
--
ALTER TABLE `radius_ban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `relay`
--
ALTER TABLE `relay`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `shop`
--
ALTER TABLE `shop`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `speedtest`
--
ALTER TABLE `speedtest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ss_invite_code`
--
ALTER TABLE `ss_invite_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ss_node`
--
ALTER TABLE `ss_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `ss_node_info`
--
ALTER TABLE `ss_node_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ss_node_online_log`
--
ALTER TABLE `ss_node_online_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ss_password_reset`
--
ALTER TABLE `ss_password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `telegram_session`
--
ALTER TABLE `telegram_session`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `unblockip`
--
ALTER TABLE `unblockip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<?php
/** 
 * ss-panel-v3-mod-Sakura
 * 
 * @maintainer SakuraSa233
 * 
*/
// -------------- 基本设置 --------------
$System_Config['key'] = '';                // 修改此 key 为随机字符串以增强网站安全性
$System_Config['debug'] =  'false';        // 正式环境请确保为 false
$System_Config['appName'] = '';  		   // 站点名称
$System_Config['baseUrl'] = '';            // 站点地址
$System_Config['timeZone'] = 'PRC';        // PRC-北京时间  UTC-格林尼治时间
$System_Config['pwdMethod'] = 'sha256';    // 密码加密方式 可选:md5,sha256
$System_Config['salt'] = '';               // 密码加密
$System_Config['theme']    = 'material';   // 默认主题
$System_Config['authDriver'] = 'cookie';   // 登录验证存储方式 可选:cookie,redis
$System_Config['muKey'] = '';              // WebAPI 用 Key，多个请使用半角逗号(,)分隔
$System_Config['sessionDriver'] = 'cookie';
$System_Config['cacheDriver'] = 'cookie';
$System_Config['tokenDriver'] = 'db';
// ----------------------------

// -------------- 站点数据库 --------------
$System_Config['db_driver'] = 'mysql';
$System_Config['db_host'] = 'localhost';
$System_Config['db_database'] = '';
$System_Config['db_username'] = '';  // 请避免使用 root 用户
$System_Config['db_password'] = '';
$System_Config['db_charset'] = '';
$System_Config['db_collation'] = '';
$System_Config['db_prefix'] = '';
// ----------------------------


// -------------- 支付系统 --------------
$System_Config['payment_system']='none'; // 可选 paymentwall,zfbjk,spay,none
// PaymentWall
$System_Config['pmw_publickey']='';
$System_Config['pmw_privatekey']='';
$System_Config['pmw_widget']='m2_1';
$System_Config['pmw_height']='350px';
// 支付宝 spay
$System_Config['alipay_id']='';
$System_Config['alipay_key']='';
// 支付宝 zfbjk.com
$System_Config['zfbjk_pid']='';
$System_Config['zfbjk_key']='';
$System_Config['zfbjk_qrcodeurl']='https://www.zhaojin97.cn/wp-content/uploads/2016/01/630c50ab52bc139b2a33af8cc64e47ad2016010111570425541.jpg';
// ----------------------------


// -------------- 邮件系统 --------------
$System_Config['mailDriver'] = 'smtp';   // 发信方式 可选:mailgun,smtp,sendgrid
// mailgun
$System_Config['mailgun_key'] = '';
$System_Config['mailgun_domain'] = '';
$System_Config['mailgun_sender'] = '';
// smtp
$System_Config['smtp_host'] = '';
$System_Config['smtp_username'] = '';
$System_Config['smtp_port'] = '465';
$System_Config['smtp_name'] = '';
$System_Config['smtp_sender'] = '';
$System_Config['smtp_passsword'] = '';
$System_Config['smtp_ssl'] = 'true';
// sendgrid
$System_Config['sendgrid_key'] = '';
$System_Config['sendgrid_sender'] = '';
// ----------------------------


// -------------- 节点 --------------
// 端口池
$System_Config['min_port']='10000';
$System_Config['max_port']='65535';
// 两种方式相对于ss端口的偏移
$System_Config['pacp_offset']='-20000';
$System_Config['pacpp_offset']='-20000';

$System_Config['Speedtest_duration']='6';      // 测速周期 单位:小时
$System_Config['mu_suffix']='cloudflare.com';       // 多用户混淆参数后缀
$System_Config['mu_regex']='%5m%id.%suffix';   //多用户混淆参数表达式，%5m代表取用户特征 md5 的前五位，%id 代表用户id,%suffix 代表上面这个后缀。
// 不安全中转模式，启用后 auth_aes128_md5,auth_aes128_sha1 以外的协议的用户也可以设置和使用中转
$System_Config['relay_insecure_mode']='true';
// ----------------------------


// -------------- 用户相关 --------------
// ---------- 注册 ----------
$System_Config['inviteNum'] = '1';                			// 初始邀请码数量
$System_Config['defaultTraffic'] = '1';         			// 初始流量 单位:GB
$System_Config['user_expire_in_default']='7'; 			    // 用户注册时设定的过期时间 单位:天
$System_Config['ramdom_group']='0';  			  			// 注册时随机分配到的分组，多个分组请用英文半角逗号分隔
$System_Config['enable_invite_code']='true';      			// 邀请码注册
$System_Config['enable_email_verify']='true';     			// 邮箱验证码
$System_Config['email_verify_ttl']='3600';        			// 邮箱验证码有效期
$System_Config['email_verify_iplimit']='10';      			// 邮箱验证码有效期内单 IP 可请求验证码次数
$System_Config['reg_method']='chacha20-ietf';           	// 注册时默认加密方式
$System_Config['reg_protocol']='auth_aes128_sha1';         	// 注册时默认协议
$System_Config['reg_protocol_param']='';          			// 注册时默认协议参数
$System_Config['reg_obfs']='tls1.2_ticket_auth_compatible';               			// 注册时默认混淆方式
$System_Config['reg_obfs_param']='';              			// 注册时默认混淆参数
$System_Config['reg_forbidden_ip']='127.0.0.0/8,::1/128';   // 注册时默认禁止访问IP列表，以半角逗号(,)分割
$System_Config['reg_forbidden_port']='';                    // 注册时默认禁止访问端口列表,支持端口段，以半角逗号(,)分割
$System_Config['reg_auto_reset_day']='0';  					// 流量重置日 0为不重置
$System_Config['reg_auto_reset_bandwidth']='100';			// 重置的流量
// ---------- 日常 ---------
$System_Config['checkinMin'] = '-256';  					// 签到获得最少流量 单位:MB
$System_Config['checkinMax'] = '1024'; 					    // 签到获得最多流量 单位:MB
$System_Config['lotteryMin'] = '0';  					    // 单价抽奖获得最少流量 单位:MB
$System_Config['lotteryMax'] = '4096'; 					    // 单价抽奖获得最多流量 单位:MB
$System_Config['login_warn']='true';  						// 异地登陆提示
$System_Config['code_payback']='10';  						// 充值返利百分比
$System_Config['enable_login_bind_ip']='false';				// 绑定登陆线程和 IP
// ---------- 过期 ---------
$System_Config['enable_class_expire_reset']='true';         // 等级到期重置流量
$System_Config['enable_class_expire_reset_traffic']='1';    // 等级到期时重置的流量值 单位:GB
$System_Config['enable_account_expire_reset']='true';       // 账户到期时重置流量
$System_Config['enable_account_expire_reset_traffic']='0';  // 账户到期时重置的流量值 单位:GB
$System_Config['enable_bought_reset']='false';              // 购买时重置流量
$System_Config['enable_account_expire_delete']='false';     // 账户到期之后删除账户
$System_Config['enable_account_expire_delete_days']='0';    // 账户到期后账户保留天数
// 自动清理未签到的 0 级用户
$System_Config['enable_auto_clean_uncheck']='false';
$System_Config['enable_auto_clean_uncheck_days']='7';
// 自动清理未使用的 0 级用户
$System_Config['enable_auto_clean_unused']='false';
$System_Config['enable_auto_clean_unused_days']='30';
// ----------------------------


// -------------- 验证码 --------------
// 申请: geetest.com
$System_Config['geetest_id']='';
$System_Config['geetest_key']='';
$System_Config['enable_geetest_reg']='false';     // 启用注册验证码
$System_Config['enable_geetest_login']='false';   // 启用登录验证码
$System_Config['enable_geetest_checkin']='false'; // 启用签到验证码
// ----------------------------


// -------------- Redis 数据库 --------------
$System_Config['redis_scheme'] = 'tcp';
$System_Config['redis_host'] = '127.0.0.1';
$System_Config['redis_port'] = '6379';
$System_Config['redis_database'] = '0';
$System_Config['redis_password']="";
// ----------------------------


// -------------- Radius 数据库 --------------
$System_Config['radius_db_host']='';
$System_Config['radius_db_database']='';
$System_Config['radius_db_user']='';
$System_Config['radius_db_password']='';
$System_Config['radius_secret']='';  // Radius连接密钥
// ----------------------------


// -------------- Wecenter --------------
$System_Config['enable_wecenter']='false';

// 数据库
$System_Config['wecenter_db_host']='localhost';
$System_Config['wecenter_db_database']='';
$System_Config['wecenter_db_user']='';
$System_Config['wecenter_db_password']='';

$System_Config['wecenter_system_main_domain']='';  // 根域名 例:zhaoj.in
$System_Config['wecenter_url']='';  // 访问路径
// 可从 Wecenter 目录下的 system/config.inc.php 得到
$System_Config['wecenter_cookie_prefix']='mmg_';  // G_COOKIE_PREFIX
$System_Config['wecenter_cookie_key']='';	// G_COOKIE_HASH_KEY
// ----------------------------


// -------------- Radius --------------
$System_Config['enable_radius']='false';
$System_Config['radius_db_host']='';
$System_Config['radius_db_database']='';
$System_Config['radius_db_user']='';
$System_Config['radius_db_password']='';
$System_Config['radius_secret']='';  // Radius连接密钥
// ----------------------------


// -------------- 多说 --------------
$System_Config['enable_duoshuo']='false';
$System_Config['duoshuo_shortname']="";
$System_Config['duoshuo_apptoken']="";
// ----------------------------


// -------------- Aws --------------
$System_Config['aws_access_key_id'] = '';
$System_Config['aws_secret_access_key'] = '';
// ----------------------------


// -------------- 节点离线 --------------
$System_Config['node_offline_warn']='true'; // 启用节点离线通知和解析切换

$System_Config['node_switcher']='none'; // 节点解析切换 可选:cloudxns,cloudflare,none
// CloudXNS
$System_Config['cloudxns_apikey']='';
$System_Config['cloudxns_apisecret']='';
$System_Config['cloudxns_domain']=''; // 域名 例:zhaoj.in
// CloudFlare
$System_Config['cloudflare_email']='';
$System_Config['cloudflare_zoneid']='';
$System_Config['cloudflare_key']='';
$System_Config['cloudflare_ttl']='1';  // 1-自动 或者 120-2147483647 之间某个数 单位:秒
// ----------------------------


// -------------- 数据库备份 --------------
$System_Config['enable_auto_backup']='false';
$System_Config['auto_backup_email']='';
$System_Config['auto_backup_webroot']='';
$System_Config['auto_backup_passwd']='';
// ----------------------------


// -------------- Telegram Bot --------------
$System_Config['enable_telegram']='false';
$System_Config['telegram_token']='';
$System_Config['telegram_chatid']='';  // 可通过添加 Bot 进入群组后发送"/ping"获取
$System_Config['telegram_bot']='bot';  // Bot ID
$System_Config['telegram_group_quiet']='false';  // 不回应群组消息
$System_Config['telegram_qrcode']='zxing_local';  #二维码解码方式 可选:online,zxing_local
// Telegram 机器人请求 Key，用于校验请求，更新这个参数之后请 php xcat setTelegram
$System_Config['telegram_request_token']='';
// 图灵机器人
$System_Config['enable_tuling']='false';
$System_Config['tuling_apikey']='';
$System_Config['tuling_apisecert']='';
// ----------------------------


// -------------- 其他 --------------
// 跳转延时,ms
$System_Config['jump_delay']='1800'; 
// 启用统计代码，在 resources/views/{主题名} 下创建一个 analytics.tpl ，如果有必要就用 literal 界定符
$System_Config['enable_analytics_code']='false';
// 启用捐赠相关功能
$System_Config['enable_donate']='true';
// ----------------------------

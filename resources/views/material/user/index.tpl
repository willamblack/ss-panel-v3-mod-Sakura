





{include file='user/main.tpl'}

{$ssr_prefer = URL::SSRCanConnect($user, 0)}


    <main class="content">
        <div class="content-header ui-content-header">
            <div class="container">
                <h1 class="content-heading">用户中心</h1>
            </div>
        </div>
        <div class="container">
            <section class="content-inner margin-top-no">
                <div class="ui-card-wrap">

                        <div class="col-lg-6 col-md-6">

                            <div class="card">
                                <div class="card-main">
                                    <div class="card-inner margin-bottom-no">
                                        <p class="card-heading">系统中最新公告</p>
                                        <p>其他公告请到<a href="/user/announcement"/>公告面板</a>查看。</p>
                                        {if $ann != null}
                                        <p>{$ann->content}</p>
                                        {/if}
                                    </div>

                                </div>
                            </div>

                            <div class="card">
                                <div class="card-main">
                                    <div class="card-inner margin-bottom-no">
                                        <p class="card-heading">连接信息 以及 All-in-One(快速配置指导)</p>
                                        <p>您可以在这里查看您的连接信息。<br>同时，这里为您提供了自动化地配置文件生成，包含了所有 Shadowsocks 服务器的信息，方便您在诸多的服务器中快速添加，快速切换。</p>
                                        <nav class="tab-nav margin-top-no">
                                            <ul class="nav nav-list">
                                                <li {if $ssr_prefer}class="active"{/if}>
                                                    <a class="waves-attach" data-toggle="tab" href="#all_ssr"><i class="icon icon-lg">airplanemode_active</i>&nbsp;ShadowsocksR</a>
                                                </li>
                                                <li {if !$ssr_prefer}class="active"{/if}>
                                                    <a class="waves-attach" data-toggle="tab" href="#all_ss"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
                                                </li>
                                            </ul>
                                        </nav>
                                        <div class="card-inner">
                                            <div class="tab-content">
                                                <div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="all_ssr">
                                                    {$pre_user = URL::cloneUser($user)}

                                                    <nav class="tab-nav margin-top-no">
                                                        <ul class="nav nav-list">
                                                            <li class="active">
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ssr_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
                                                            </li>
                                                            <li>
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ssr_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
                                                            </li>
                                                            <li>
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ssr_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
                                                            </li>
                                                            <li>
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ssr_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS</a>
                                                            </li>
                                                            <li>
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ssr_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
                                                            </li>
                                                            <li>
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ssr_router"><i class="icon icon-lg">router</i>&nbsp;路由器</a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                    <div class="tab-pane fade active in" id="all_ssr_info">
                                                        {$user = URL::getSSRConnectInfo($pre_user)}
                                                        {$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
                                                        {$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
                                                        {if URL::SSRCanConnect($user)}
                                                        <dl class="dl-horizontal">
                                                            <p><dt>端口</dt>
                                                            <dd>{$user->port}</dd></p>

                                                            <p><dt>密码</dt>
                                                            <dd>{$user->passwd}</dd></p>

                                                            <p><dt>自定义加密</dt>
                                                            <dd>{$user->method}</dd></p>

                                                            <p><dt>自定义协议</dt>
                                                            <dd>{$user->protocol}</dd></p>

                                                            <p><dt>自定义混淆</dt>
                                                            <dd>{$user->obfs}</dd></p>
                                                        </dl>
                                                        {else}
                                                            <p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>

                                                            <p>同时, ShadowsocksR 公共端口的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>

                                                            <p>请注意，在当前状态下您的 SSR 订阅链接已经失效，您无法通过此种方式导入节点。</p>
                                                        {/if}
                                                    </div>
                                                    <div class="tab-pane fade" id="all_ssr_windows">
                                                        <p><span class="icon icon-lg">filter_1</span>下载<a href="/download/ShadowsocksR-Windows.zip">这个</a>。</p>
                                                        <p><span class="icon icon-lg">filter_2</span>解压至任意目录并运行</p>
                                                        <p><span class="icon icon-lg">filter_3</span>任务栏右下角右键纸飞机图标->服务器订阅->SSR服务器订阅设置，将订阅链接设置为下面的地址，确定之后再更新SSR服务器订阅(绕过代理)。</p>
                                                        <p><span class="icon icon-lg">filter_4</span>然后选择一个合适的服务器，代理规则选"绕过局域网和大陆"(视情况而定)，然后即可开始上网。</p>
                                                        <p><span class="icon icon-lg">filter_5</span>备用方法：点击<a class="copy-text" data-clipboard-text="{$ssr_url_all}">这里(普通端口)</a>或者<a class="copy-text" data-clipboard-text="{$ssr_url_all_mu}">这里(公共端口)</a>，然后右键小飞机->从剪贴板复制地址</p>
                                                        {$subscribe}
                                                        {$subscribe_mu}
                                                    </div>
                                                    <div class="tab-pane fade" id="all_ssr_mac">
                                                        <p><span class="icon icon-lg">filter_1</span>下载<a href="/download/ShadowsocksX-NG-R.dmg">这个</a>。</p>
                                                        <p><span class="icon icon-lg">filter_2</span>打开下载的 dmg 文件。</p>
                                                        <p><span class="icon icon-lg">filter_3</span>将 ShadowsocksX 拖入到 Finder 的应用程序列表(Applications)。</p>
                                                        <p><span class="icon icon-lg">filter_4</span>打开 Launchapad 里的 ShadowsocksX。</p>
                                                        <p><span class="icon icon-lg">filter_5</span>菜单栏的纸飞机图标-服务器-服务器订阅填入以下地址并更新。</p>
                                                        {$subscribe}
                                                        {$subscribe_mu}
                                                    </div>
                                                    <div class="tab-pane fade" id="all_ssr_ios">
                                                        <p><span class="icon icon-lg">filter_1</span>安装 Shadowrocket。</p>
                                                        <p><span class="icon icon-lg">filter_2</span>打开 Shadowrocket，点击右上角添加符号，添加类型为<code>Subscribe</code>，URL 填写以下地址即可自动更新节点</p>
                                                        <p><span class="icon icon-lg">filter_3</span>备用方法：在 Safari 中点击<a href="{$ssr_url_all}">这里(普通端口)</a>或者<a href="{$ssr_url_all_mu}">这里(公共端口)</a>。</p>
                                                        {$subscribe}
                                                        {$subscribe_mu}
                                                    </div>
                                                    <div class="tab-pane fade" id="all_ssr_android">
                                                        <p><span class="icon icon-lg">filter_1</span>下载<a href="/download/ShadowsocksR-Android.apk">这个</a>并安装。</p>
                                                        <p><span class="icon icon-lg">filter_2</span>打开应用，点击左上角的<code>ShdowsocksR</code>字样，此后点击右下角的添加符号</p>
                                                        <p><span class="icon icon-lg">filter_3</span>选择<code>添加/升级 SSR 订阅</code>。</p>
                                                        <p><span class="icon icon-lg">filter_4</span>添加订阅地址，输入以下地址后确定。</p>
                                                        <p><span class="icon icon-lg">filter_5</span>请滑动删除自带的<code>FreeSRR-public</code>订阅/</p>
                                                        <p><span class="icon icon-lg">filter_6</span>点击<code>确定并升级</code>。</p>
                                                        <p><span class="icon icon-lg">filter_7</span>选择节点，并修改路由为<code>绕过局域网及中国大陆地址</code>。</p>
                                                        <p><span class="icon icon-lg">filter_8</span>点击右上角的纸飞机图标连接。</p>
                                                        <p><span class="icon icon-lg">filter_9</span>备用方法：在手机上浏览器(推荐使用 Chrome)中点击<a href="{$ssr_url_all}">这个链接(普通端口)</a>或者<a href="{$ssr_url_all_mu}">这个链接(公共端口)</a>。</p>
                                                        <p>ACL 地址：<a href="/link/{$acl_token}">长按复制此地址</a>。(如果你不知道这是什么，请不要使用)</p>
                                                        {$subscribe}
                                                        {$subscribe_mu}
                                                    </div>
                                                    <div class="tab-pane fade" id="all_ssr_router">
                                                        <p><span class="icon icon-lg">filter_1</span>在路由器上路由器刷入<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">这个</a>固件。</p>
                                                        <p><span class="icon icon-lg">filter_2</span>使用 SSH 登录路由器。</p>
                                                        <p><span class="icon icon-lg">filter_3</span>执行下面的命令。</p>
                                                        <p>普通端口:
                                                            <code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code>
                                                        </p>
                                                        <p>公共端口：
                                                            <code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code>
                                                        </p>
                                                        <p><span class="icon icon-lg">filter_4</span>之后你就可以到路由器的面板中选择 Shadowsocks 服务器进行连接了。</p>
                                                    </div>

                                                </div>
                                                <div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="all_ss">
                                                    <nav class="tab-nav margin-top-no">
                                                        <ul class="nav nav-list">
                                                            <li class="active">
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ss_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
                                                            </li>
                                                            <li>
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ss_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
                                                            </li>
                                                            <li>
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ss_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
                                                            </li>
                                                            <li>
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ss_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS</a>
                                                            </li>
                                                            <li>
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ss_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
                                                            </li>
                                                            <li>
                                                                <a class="waves-attach" data-toggle="tab" href="#all_ss_router"><i class="icon icon-lg">router</i>&nbsp;路由器</a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                    <div class="tab-pane fade active in" id="all_ss_info">
                                                        {$user = URL::getSSConnectInfo($pre_user)}
                                                        {$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
                                                        {$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
                                                        {$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}

                                                        {if URL::SSCanConnect($user)}
                                                        <dl class="dl-horizontal">
                                                            <p>各个节点的地址请到节点列表查看！</p>


                                                            <p><dt>端口</dt>
                                                            <dd>{$user->port}</dd></p>

                                                            <p><dt>密码</dt>
                                                            <dd>{$user->passwd}</dd></p>

                                                            <p><dt>自定义加密</dt>
                                                            <dd>{$user->method}</dd></p>

                                                            <p><dt>自定义混淆</dt>
                                                            <dd>{$user->obfs}</dd></p>
                                                        </dl>
                                                        {else}
                                                            <p>您好，您目前的 加密方式，混淆，或者协议设置在 SS 客户端下无法连接。请您选用 SSR 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
                                                            <p>同时, Shadowsocks 公共端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
                                                        {/if}
                                                    </div>
                                                    <div class="tab-pane fade" id="all_ss_windows">
                                                        <p><span class="icon icon-lg">filter_1</span>下载<a href="/download/Shadowsocks-Windows.zip">这个</a>。</p>
                                                        <p><span class="icon icon-lg">filter_2</span>解压至任意目录并运行</p>
                                                        <p><span class="icon icon-lg">filter_3</span>点击<a class="copy-text" data-clipboard-text="{$ss_url_all_win}">这里</a>, 然后右键 Shadowsocks 的图标->从剪贴板导入 URL。</p>
                                                        <p><span class="icon icon-lg">filter_4</span>备用方法：下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个(普通端口)</a>，放到 Shadowsocks 的目录下，然后打开 Shadowsocks。</p>
                                                    </div>
                                                    <div class="tab-pane fade" id="all_ss_mac">
                                                        <p><span class="icon icon-lg">filter_1</span>下载<a href="/download/ShadowsocksX-NG.zip">这个</a>并安装。</p>
                                                        <p><span class="icon icon-lg">filter_2</span>下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个(普通端口)</a>或者<a href="/user/getpcconf?is_mu=1&is_ss=1">这个(公共端口)</a>。</p>
                                                        <p><span class="icon icon-lg">filter_3</span>启动程序，右键纸飞机图标，选择<code>服务器列表->导入服务器配置文件...</code>，选择下载的文件导入。</p>
                                                        <p><span class="icon icon-lg">filter_4</span>选择服务器，更新 PAC，开启系统代理</p>
                                                    </div>
                                                    <div class="tab-pane fade" id="all_ss_ios">
                                                        <p><span class="icon icon-lg">filter_1</span>安装 Shadowrocket。</p>
                                                        <p><span class="icon icon-lg">filter_2</span>在 Safari 中点击<a href="{$ss_url_all}">这个(普通端口)</a>或者<a href="{$ss_url_all_mu}">这个(公共端口)</a>以批量添加节点</p>
                                                    </div>
                                                    <div class="tab-pane fade" id="all_ss_android">
                                                        <p><span class="icon icon-lg">filter_1</span>下载安装 <a href="/download/Shadowsocks-Android.apk">Shadowsocks</a> 和 <a href="/download/Shadowsocks-Obfs-Android.apk">Shadowsocks-Obfs</a>。</p>
                                                        <p><span class="icon icon-lg">filter_2</span>点击<a class="copy-text" data-clipboard-text="{$ss_url_all}">这里(普通端口)</a>或者<a class="copy-text" data-clipboard-text="{$ss_url_all_mu}">这里(公共端口)</a>。</p>
                                                        <p><span class="icon icon-lg">filter_3</span>打开 Shadowsocks，点击右上角的添加符号，选择"从粘贴板导入"。</p>
                                                        <p><span class="icon icon-lg">filter_4</span>修改节点的路由为"绕过局域网与中国大陆地址"(视情况而定)，点击纸飞机图标开始连接。</p>
                                                    </div>
                                                    <div class="tab-pane fade" id="all_ss_router">
                                                        <p><span class="icon icon-lg">filter_1</span>在路由器上路由器刷入<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">这个</a>固件。</p>
                                                        <p><span class="icon icon-lg">filter_2</span>使用 SSH 登录路由器。</p>
                                                        <p><span class="icon icon-lg">filter_3</span>执行下面的命令。</p>
                                                        <p>普通端口:
                                                            <code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code>
                                                        </p>
                                                        <p>公共端口:
                                                            <code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code>
                                                        </p>
                                                        <p><span class="icon icon-lg">filter_4</span>之后你就可以到路由器的面板中选择 Shadowsocks 服务器进行连接了。</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-action">
                                            <div class="card-action-btn pull-left">
                                                <p><a class="btn btn-brand btn-flat waves-attach" href="/user/url_reset"><span class="icon">close</span>&nbsp;重置所有链接</a></p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>

                        <div class="col-lg-6 col-md-6">

                            <div class="card">
                                <div class="card-main">
                                    <div class="card-inner margin-bottom-no">
                                        <p class="card-heading">帐号使用情况</p>
                                        <dl class="dl-horizontal">
                                            <p><dt>帐号等级</dt>
                                            <dd>{$user->class}</dd></p>

                                            <p><dt>等级过期时间</dt>
                                            <dd>{$user->class_expire}</dd></p>

                                            <p><dt>帐号过期时间</dt>
                                            <dd>{$user->expire_in}</dd>

                                            <p><dt>速度限制</dt>
                                            {if $user->node_speedlimit!=0}
                                            <dd>{$user->node_speedlimit}Mbps</dd>
                                            {else}
                                            <dd>不限速</dd>
                                            {/if}</p>

                                            <p><dt>上次使用</dt>
                                            <dd>{$user->lastSsTime()}</dd></p>
                                        </dl>
                                    </div>

                                </div>
                            </div>

                            <div class="card">
                                <div class="card-main">
                                    <div class="card-inner margin-bottom-no">

                                        <div id="traffic_chart" style="height: 300px; width: 100%;"></div>

                                        <script src="//cdn.staticfile.org/canvasjs/1.7.0/canvasjs.js"></script>
                                        <script type="text/javascript">
                                            var chart = new CanvasJS.Chart("traffic_chart",
                                            {
                                                title:{
                                                    text: "流量使用情况",
                                                    fontFamily: "Impact",
                                                    fontWeight: "normal"
                                                },

                                                legend:{
                                                    verticalAlign: "bottom",
                                                    horizontalAlign: "center"
                                                },
                                                data: [
                                                {
                                                    //startAngle: 45,
                                                    indexLabelFontSize: 20,
                                                    indexLabelFontFamily: "Garamond",
                                                    indexLabelFontColor: "darkgrey",
                                                    indexLabelLineColor: "darkgrey",
                                                    indexLabelPlacement: "outside",
                                                    type: "doughnut",
                                                    showInLegend: true,
                                                    dataPoints: [
                                                        {if $user->transfer_enable != 0}
                                                        {
                                                            y: {$user->last_day_t/$user->transfer_enable*100}, legendText:"已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}", indexLabel: "已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}"
                                                        },
                                                        {
                                                            y: {($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100}, legendText:"今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}", indexLabel: "今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}"
                                                        },
                                                        {
                                                            y: {($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}, legendText:"剩余 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}", indexLabel: "剩余 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}"
                                                        }
                                                        {/if}
                                                    ]
                                                }
                                                ]
                                            });

                                            chart.render();
                                        </script>

                                    </div>

                                </div>
                            </div>



                            <div class="card">
                                <div class="card-main">
                                    <div class="card-inner margin-bottom-no">
                                        <p class="card-heading">续命获取流量</p>
                                            <p>流量不会重置，可以通过续命获取流量。</p>

                                            <p>每次续命可以获取{$config['checkinMin']}~{$config['checkinMax']}MB流量。</p>

                                            <p>每天可以续命一次。您可以点击按钮或者摇动手机来续命。</p>

                                            <p>上次续命时间：<code>{$user->lastCheckInTime()}</code></p>

                                            <p id="checkin-msg"></p>

                                            {if $geetest_html != null}
                                                <div id="popup-captcha"></div>
                                            {/if}
                                    </div>

                                    <div class="card-action">
                                        <div class="card-action-btn pull-left">
                                            {if $user->isAbleToCheckin() }
                                                <p id="checkin-btn">
                                                    <button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;续命</button>
                                                </p>
                                            {else}
                                                <p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;不能续命</a></p>
                                            {/if}
                                        </div>
                                    </div>

                                </div>
                            </div>


                        {if $enable_duoshuo=='true'}

                            <div class="card">
                                <div class="card-main">
                                    <div class="card-inner margin-bottom-no">
                                        <p class="card-heading">讨论区</p>
                                            <div class="ds-thread" data-thread-key="0" data-title="index" data-url="{$baseUrl}/user/"></div>
                                            <script type="text/javascript">
                                            var duoshuoQuery = {

                                            short_name:"{$duoshuo_shortname}"


                                            };
                                                (function() {
                                                    var ds = document.createElement('script');
                                                    ds.type = 'text/javascript';ds.async = true;
                                                    ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
                                                    ds.charset = 'UTF-8';
                                                    (document.getElementsByTagName('head')[0]
                                                     || document.getElementsByTagName('body')[0]).appendChild(ds);
                                                })();
                                            </script>
                                    </div>

                                </div>
                            </div>

                        {/if}

                        {include file='dialog.tpl'}

                    </div>


                </div>
            </section>
        </div>
    </main>







{include file='user/footer.tpl'}

<script src="/theme/material/js/shake.js/shake.js"></script>


<script>

$(function(){
    new Clipboard('.copy-text');
});

$(".copy-text").click(function () {
    $("#result").modal();
    $("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
});

{if $geetest_html == null}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
        if("vibrate" in navigator){
            navigator.vibrate(500);
        }

        $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
                    $("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
                    $("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            });
    }
};


$(document).ready(function () {
    $("#checkin").click(function () {
        $.ajax({
            type: "POST",
            url: "/user/checkin",
            dataType: "json",
            success: function (data) {
                $("#checkin-msg").html(data.msg);
                $("#checkin-btn").hide();
                $("#result").modal();
                $("#msg").html(data.msg);
            },
            error: function (jqXHR) {
                $("#result").modal();
                $("#msg").html("发生错误：" + jqXHR.status);
            }
        })
    })
})


{else}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
        if("vibrate" in navigator){
            navigator.vibrate(500);
        }

        c.show();
    }
};



var handlerPopup = function (captchaObj) {
    c = captchaObj;
    captchaObj.onSuccess(function () {
        var validate = captchaObj.getValidate();
        $.ajax({
            url: "/user/checkin", // 进行二次验证
            type: "post",
            dataType: "json",
            data: {
                // 二次验证所需的三个值
                geetest_challenge: validate.geetest_challenge,
                geetest_validate: validate.geetest_validate,
                geetest_seccode: validate.geetest_seccode
            },
            success: function (data) {
                $("#checkin-msg").html(data.msg);
                $("#checkin-btn").hide();
                $("#result").modal();
                $("#msg").html(data.msg);
            },
            error: function (jqXHR) {
                $("#result").modal();
                $("#msg").html("发生错误：" + jqXHR.status);
            }
        });
    });
    // 弹出式需要绑定触发验证码弹出按钮
    captchaObj.bindOn("#checkin");
    // 将验证码加到id为captcha的元素里
    captchaObj.appendTo("#popup-captcha");
    // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
};

initGeetest({
    gt: "{$geetest_html->gt}",
    challenge: "{$geetest_html->challenge}",
    product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
    offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
}, handlerPopup);



{/if}


</script>

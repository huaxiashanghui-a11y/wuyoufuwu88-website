// 北苍星际速充 - 共享数据文件
// 此文件由管理后台导出数据时自动生成
// 请勿手动编辑，使用管理后台的"导出数据"功能

// ============ 如果要更新数据，请按以下步骤： ============
// 1. 访问管理后台：https://huaxiashanghui-a11y.github.io/wuyoufuwu88-website/admin-v2-final.html
// 2. 登录后点击"导出数据"
// 3. 将生成的JSON复制粘贴到下面的变量中
// 4. 保存文件并git push

// 网站设置
const siteSettings = {
  siteName: "北苍星际 - 游戏充值中心",
  slogan: "24小时在线游戏充值平台"
};

// 商品数据
let sharedProducts = [
  {
    id: 1,
    name: '快手币充值',
    category: 'live',
    subCategory: 'kuaishou',
    image: 'https://i.ibb.co/8LdNyr6B/image.png',
    description: '24小时秒到账 · 不用等 · 不用问 · 下单即充',
    prices: [
      { name: '100快币', value: '仅15元' },
      { name: '300快币', value: '仅30元' },
      { name: '500快币', value: '仅65元' },
      { name: '980快币', value: '仅120元' },
      { name: '2000快币', value: '仅220元' },
      { name: '3000快币', value: '仅330元' },
      { name: '4000快币', value: '仅430元' },
      { name: '5000快币', value: '仅520元' },
      { name: '8888快币', value: '仅938元' },
      { name: '9999快币', value: '仅999元' },
      { name: '19800快币', value: '仅1980元' },
      { name: '20800快币', value: '仅2080元' },
      { name: '30990快币', value: '仅3099元' }
    ],
    qrCode: 'https://i.ibb.co/4WQxrM2Q/image.png'
  },
  {
    id: 2,
    name: '永劫无间手游',
    category: 'game',
    image: 'https://i.ibb.co/tMndBzyN/image.png',
    description: '仅需角色编号 · 无需账号密码 · 快速到账',
    prices: [
      { name: '60元宝', value: '面值1' },
      { name: '300元宝', value: '面值2' },
      { name: '680元宝', value: '面值3' },
      { name: '980元宝', value: '面值4' },
      { name: '1280元宝', value: '面值5' },
      { name: '1980元宝', value: '面值6' },
      { name: '3280元宝', value: '面值7' },
      { name: '6480元宝', value: '面值8' }
    ],
    qrCode: 'https://i.ibb.co/4WQxrM2Q/image.png'
  },
  {
    id: 3,
    name: '会员充值',
    category: 'video',
    image: 'https://i.ibb.co/Z6Xb9BPd/image.png',
    description: '支持 KBZ、USDT、支付宝微信支付',
    prices: [
      { name: '三个月 KBZ', value: '60000' },
      { name: '六个月 KBZ', value: '70000' },
      { name: '12个月 KBZ', value: '120000' },
      { name: '三个月 USDT', value: '14 u' },
      { name: '六个月 USDT', value: '18 u' },
      { name: '12个月 USDT', value: '33 u' }
    ],
    qrCode: 'https://i.ibb.co/4WQxrM2Q/image.png'
  },
  {
    id: 4,
    name: '抖音币充值',
    category: 'live',
    subCategory: 'douyin',
    image: 'https://i.ibb.co/MwHwFmR/image.png',
    description: '60抖币仅需10元！全网最优惠价，充值秒到账',
    prices: [
      { name: '60抖币', value: '仅10元' },
      { name: '更多面额', value: '请联系客服' }
    ],
    qrCode: 'https://i.ibb.co/4WQxrM2Q/image.png'
  }
];

// 分类数据
let sharedCategories = [
  { id: 'all', name: '首页', icon: '🏠' },
  { id: 'live', name: '直播类', icon: '📺' },
  { id: 'game', name: '游戏点卡', icon: '🎮' },
  { id: 'social', name: '社交类', icon: '💬' },
  { id: 'video', name: '视频会员', icon: '🎬' },
  { id: 'audio', name: '音频会员', icon: '🎵' },
  { id: 'international', name: '国际服', icon: '🌍' },
  { id: 'mobile', name: '手游端游充值', icon: '📱' },
  { id: 'tool', name: '工具软件', icon: '🔧' },
  { id: 'more', name: '更多', icon: '➕' }
];

// 客服信息
let sharedCustomerService = [
  {
    id: 'cs1',
    account: '09688337441',
    type: 'mobile',
    platform: '手机',
    status: 'online'
  },
  {
    id: 'cs2',
    account: 'bcsz88',
    type: 'telegram',
    platform: 'Telegram',
    status: 'online'
  }
];

// 收款二维码
const paymentQrCode = 'https://i.ibb.co/4WQxrM2Q/image.png';

// 数据最后更新时间
const lastDataUpdate = '2026-03-15';

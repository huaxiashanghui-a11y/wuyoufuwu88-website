-- 北苍星际游戏充值中心 - 数据库初始化脚本
-- 在 Supabase SQL Editor 中执行此脚本

-- ============================================
-- 1. 创建分类表 (categories)
-- ============================================
CREATE TABLE IF NOT EXISTS categories (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) NOT NULL UNIQUE,
    icon VARCHAR(10),
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 2. 创建商品表 (products)
-- ============================================
CREATE TABLE IF NOT EXISTS products (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    category_slug VARCHAR(100) REFERENCES categories(slug) ON DELETE SET NULL,
    sub_category VARCHAR(100),
    image_url TEXT NOT NULL,
    description TEXT,
    status VARCHAR(20) DEFAULT 'active', -- active, inactive
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 3. 创建商品价格表 (product_prices)
-- ============================================
CREATE TABLE IF NOT EXISTS product_prices (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    product_id UUID REFERENCES products(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    value VARCHAR(100) NOT NULL,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 4. 创建轮播图表 (banners)
-- ============================================
CREATE TABLE IF NOT EXISTS banners (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title VARCHAR(200),
    image_url TEXT NOT NULL,
    link_url TEXT,
    sort_order INTEGER DEFAULT 0,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 5. 创建系统配置表 (settings)
-- ============================================
CREATE TABLE IF NOT EXISTS settings (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    key_name VARCHAR(100) NOT NULL UNIQUE,
    value TEXT,
    description TEXT,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 6. 插入初始分类数据
-- ============================================
INSERT INTO categories (name, slug, icon, sort_order) VALUES
    ('全部商品', 'all', '📦', 0),
    ('直播平台', 'live', '📺', 1),
    ('语音交友', 'voice', '🎤', 2),
    ('陪玩陪聊', 'play', '🎮', 3),
    ('游戏充值', 'game', '🎯', 4),
    ('平台点卡', 'card', '💳', 5),
    ('文学动漫', 'anime', '📚', 6),
    ('视频音频', 'video', '🎬', 7),
    ('社交媒体', 'social', '👥', 8),
    ('加速工具', 'speed', '⚡', 9),
    ('生活日常', 'daily', '🏠', 10)
ON CONFLICT (slug) DO NOTHING;

-- ============================================
-- 7. 插入初始系统配置
-- ============================================
INSERT INTO settings (key_name, value, description) VALUES
    ('payment_qr_code', 'https://i.ibb.co/ZRVjqp5g/image.png', 'Wavepay收款二维码'),
    ('contact_telegram', 'bcsz88', 'Telegram客服账号'),
    ('contact_phone', '09688337441', '联系电话'),
    ('contact_group', 'bcsc8888', 'Telegram群组'),
    ('contact_channel', 'bcsc77', 'Telegram频道'),
    ('site_name', '北苍星际速充', '网站名称'),
    ('site_slogan', '24小时在线 · 极速充值 · 安全可靠', '网站口号')
ON CONFLICT (key_name) DO NOTHING;

-- ============================================
-- 8. 创建索引（优化查询性能）
-- ============================================
CREATE INDEX IF NOT EXISTS idx_products_category ON products(category_slug);
CREATE INDEX IF NOT EXISTS idx_products_status ON products(status);
CREATE INDEX IF NOT EXISTS idx_product_prices_product ON product_prices(product_id);
CREATE INDEX IF NOT EXISTS idx_banners_status ON banners(status);
CREATE INDEX IF NOT EXISTS idx_banners_sort ON banners(sort_order);

-- ============================================
-- 9. 创建更新时间触发器
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- 为需要的表添加触发器
CREATE TRIGGER update_categories_updated_at BEFORE UPDATE ON categories
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON products
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_banners_updated_at BEFORE UPDATE ON banners
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- 10. 启用行级安全 (Row Level Security - 可选)
-- ============================================
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_prices ENABLE ROW LEVEL SECURITY;
ALTER TABLE banners ENABLE ROW LEVEL SECURITY;
ALTER TABLE settings ENABLE ROW LEVEL SECURITY;

-- 允许所有人读取数据
CREATE POLICY "允许所有人读取分类" ON categories FOR SELECT USING (true);
CREATE POLICY "允许所有人读取商品" ON products FOR SELECT USING (true);
CREATE POLICY "允许所有人读取价格" ON product_prices FOR SELECT USING (true);
CREATE POLICY "允许所有人读取轮播图" ON banners FOR SELECT USING (true);
CREATE POLICY "允许所有人读取配置" ON settings FOR SELECT USING (true);

-- 允许所有人插入数据（管理后台需要）
CREATE POLICY "允许所有人插入分类" ON categories FOR INSERT WITH CHECK (true);
CREATE POLICY "允许所有人插入商品" ON products FOR INSERT WITH CHECK (true);
CREATE POLICY "允许所有人插入价格" ON product_prices FOR INSERT WITH CHECK (true);
CREATE POLICY "允许所有人插入轮播图" ON banners FOR INSERT WITH CHECK (true);
CREATE POLICY "允许所有人插入配置" ON settings FOR INSERT WITH CHECK (true);

-- 允许所有人更新数据（管理后台需要）
CREATE POLICY "允许所有人更新分类" ON categories FOR UPDATE USING (true);
CREATE POLICY "允许所有人更新商品" ON products FOR UPDATE USING (true);
CREATE POLICY "允许所有人更新价格" ON product_prices FOR UPDATE USING (true);
CREATE POLICY "允许所有人更新轮播图" ON banners FOR UPDATE USING (true);
CREATE POLICY "允许所有人更新配置" ON settings FOR UPDATE USING (true);

-- 允许所有人删除数据（管理后台需要）
CREATE POLICY "允许所有人删除分类" ON categories FOR DELETE USING (true);
CREATE POLICY "允许所有人删除商品" ON products FOR DELETE USING (true);
CREATE POLICY "允许所有人删除价格" ON product_prices FOR DELETE USING (true);
CREATE POLICY "允许所有人删除轮播图" ON banners FOR DELETE USING (true);

-- ============================================
-- 完成提示
-- ============================================
-- 数据库初始化完成！
-- 接下来可以：
-- 1. 在 products 表中添加商品数据
-- 2. 在 banners 表中添加轮播图数据
-- 3. 在 settings 表中修改系统配置

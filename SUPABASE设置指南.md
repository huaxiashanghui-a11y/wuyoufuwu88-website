# Supabase 管理后台设置指南

## 🎯 设置步骤

### 第一步：在 Supabase 中执行数据库初始化脚本

1. **登录 Supabase**
   - 访问：https://supabase.com
   - 点击你的项目：`ufxglsigclmqovqbfzad`

2. **打开 SQL Editor**
   - 点击左侧菜单的 **"SQL Editor"** 图标（▶️）
   - 点击 **"New query"** 创建新查询

3. **复制并执行初始化脚本**
   - 打开文件：`website/supabase-init.sql`
   - 复制全部内容
   - 粘贴到 SQL Editor 中
   - 点击右下角的 **"Run"** 按钮执行

4. **验证执行结果**
   - 如果成功，你会看到绿色提示："Success. No rows returned"
   - 如果有错误，请检查错误信息

### 第二步：访问管理后台

1. **本地测试**
   ```bash
   cd /home/openclaw/.openclaw/workspace
   python3 -m http.server 8000
   ```
   - 访问：http://localhost:8000/admin.html

2. **或直接打开文件**
   - 在浏览器中打开：`website/admin.html`

### 第三步：登录管理后台

**默认登录信息：**
- 用户名：`admin`
- 密码：`beicang888`

⚠️ **重要：登录后请立即修改密码！**

修改密码位置：
在 `admin.html` 中找到：
```javascript
const ADMIN_PASSWORD = 'beicang888';
```
修改为你的密码，然后重新打开文件。

---

## 📊 管理后台功能说明

### 1. 商品管理
- ✅ 添加新商品（名称、图片、分类、价格列表）
- ✅ 编辑商品信息
- ✅ 删除商品
- ✅ 启用/禁用商品

### 2. 分类管理
- ✅ 添加新分类
- ✅ 编辑分类（名称、图标、排序）
- ✅ 删除分类

### 3. 轮播图管理
- ✅ 添加轮播图（图片、标题、链接）
- ✅ 编辑轮播图
- ✅ 删除轮播图
- ✅ 启用/禁用轮播图

### 4. 系统设置
- ✅ 修改网站名称和口号
- ✅ 更改收款二维码
- ✅ 更新客服联系方式

---

## 🔄 数据同步到网站

管理后台的数据会自动保存到 Supabase 数据库。要使网站显示最新数据，需要修改 `index.html` 以从 Supabase 加载数据。

**我会为你创建一个新的 `index.html`，支持从 Supabase 动态加载数据。**

---

## 💾 数据库表结构

### products（商品表）
| 字段 | 类型 | 说明 |
|------|------|------|
| id | UUID | 商品ID |
| name | VARCHAR(200) | 商品名称 |
| category_slug | VARCHAR(100) | 分类标识符 |
| sub_category | VARCHAR(100) | 子分类 |
| image_url | TEXT | 图片URL |
| description | TEXT | 商品描述 |
| status | VARCHAR(20) | 状态（active/inactive） |
| sort_order | INTEGER | 排序 |

### product_prices（商品价格表）
| 字段 | 类型 | 说明 |
|------|------|------|
| id | UUID | 价格ID |
| product_id | UUID | 商品ID |
| name | VARCHAR(100) | 价格名称 |
| value | VARCHAR(100) | 价格值 |
| sort_order | INTEGER | 排序 |

### categories（分类表）
| 字段 | 类型 | 说明 |
|------|------|------|
| id | UUID | 分类ID |
| name | VARCHAR(100) | 分类名称 |
| slug | VARCHAR(100) | 分类标识符 |
| icon | VARCHAR(10) | 图标 |
| sort_order | INTEGER | 排序 |

### banners（轮播图表）
| 字段 | 类型 | 说明 |
|------|------|------|
| id | UUID | 轮播图ID |
| title | VARCHAR(200) | 标题 |
| image_url | TEXT | 图片URL |
| link_url | TEXT | 链接URL |
| sort_order | INTEGER | 排序 |
| status | VARCHAR(20) | 状态 |

### settings（系统配置表）
| 字段 | 类型 | 说明 |
|------|------|------|
| id | UUID | 配置ID |
| key_name | VARCHAR(100) | 配置键名 |
| value | TEXT | 配置值 |
| description | TEXT | 描述 |

---

## 🛠️ 常见问题

### Q1: SQL执行失败怎么办？
- 检查是否复制了完整的SQL脚本
- 确认在正确的项目中执行
- 查看错误信息，可能需要删除旧表后重新执行

### Q2: 管理后台无法登录？
- 确认用户名是 `admin`
- 确认密码是 `beicang888`（或你修改后的密码）
- 清除浏览器缓存后重试

### Q3: 商品图片怎么上传？
- 使用图床服务（如 ImgBB）上传图片
- 复制图片的URL
- 在管理后台粘贴URL

推荐图床：
- ImgBB: https://imgbb.com（免费，无需注册）
- Cloudinary: https://cloudinary.com（免费额度）
- 又拍云、七牛云等

### Q4: 如何备份数据？
- Supabase 自动备份数据
- 可以在 SQL Editor 中导出数据：
  ```sql
  -- 导出所有商品数据
  SELECT * FROM products;
  ```
- 复制结果并保存为 CSV

### Q5: 网站如何显示 Supabase 的数据？
- 我会为你创建一个新版本的 `index.html`
- 支持从 Supabase 动态加载商品、分类、轮播图
- 修改配置后立即生效

---

## 📞 技术支持

遇到问题？
- **Telegram 客服：** https://t.me/bcsz88
- **电话：** 09688337441
- **工作时间：** 9:30-24:00

---

## ✅ 下一步

1. ✅ 在 Supabase 执行数据库初始化脚本
2. ✅ 访问管理后台并登录
3. ✅ 添加一些测试数据
4. ✅ 等待我创建支持 Supabase 的新网站首页

完成后，告诉我你的进度，我会继续帮你完成网站数据同步！

---

**文档创建时间：** 2026-03-14
**最后更新：** 2026-03-14

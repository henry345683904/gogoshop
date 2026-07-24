# GO GO SHOP Supabase 设置

## 1. 创建数据库

1. 打开 Supabase 项目的 **SQL Editor**。
2. 点击 **New query**。
3. 粘贴并运行 `supabase-schema.sql` 的全部内容。
4. 页面显示 `Success` 后刷新网站。

该脚本会创建：客户资料、商品库存、订单、订单明细、积分、权限策略，以及创建订单和确认订单的数据库函数。

## 2. 创建管理员

1. 先通过网站的“我的账户”创建一个邮箱账户。
2. 邮箱验证完成后，在 SQL Editor 运行：

```sql
update public.profiles
set is_admin = true
where email = '你的管理员邮箱';
```

3. 使用该邮箱和密码登录网站后台。

## 3. 设置登录回跳地址

在 **Authentication > URL Configuration** 中设置：

- Site URL: `https://henry345683904.github.io/gogoshop/`
- Redirect URLs:
  - `https://henry345683904.github.io/gogoshop/**`
  - `http://127.0.0.1:8769/**`

## 4. Google 登录

在 **Authentication > Providers > Google** 启用 Google，并填入 Google Cloud 提供的 Client ID 和 Client Secret。

Google Cloud 的 Authorized redirect URI 使用：

`https://ucnkcddhrptqpdlvcohy.supabase.co/auth/v1/callback`

## 5. Apple 登录

Apple 登录需要有效的 Apple Developer 账号。在 **Authentication > Providers > Apple** 中填写 Apple Service ID、Team ID、Key ID 和私钥。

Apple 的 Return URL 使用：

`https://ucnkcddhrptqpdlvcohy.supabase.co/auth/v1/callback`

不要把 Supabase secret key、service_role key、Google Client Secret 或 Apple 私钥写进网页文件或提交到 GitHub。

# GO GO SHOP Supabase 设置

## 1. 创建数据库

1. 打开 Supabase 项目的 **SQL Editor**。
2. 点击 **New query**。
3. 粘贴并运行 `supabase-schema.sql` 的全部内容。
4. 页面显示 `Success` 后刷新网站。

该脚本会创建：客户资料、商品库存、订单、订单明细、积分、权限策略，以及创建订单和确认订单的数据库函数。

已有数据库只需额外运行一次 `supabase-storefront-security.sql`。该脚本会让普通访客仅能读取公开店面字段，供应商、进货价和 1688 货源信息只对管理员开放。

## 2. 创建管理员

1. 先通过网站的“我的账户”创建一个邮箱账户。
2. 邮箱验证完成后，在 SQL Editor 运行：

```sql
update public.profiles
set is_admin = true
where email = '你的管理员邮箱';
```

3. 后台登录页只显示密码框。系统会自动查找最早创建的管理员账户，并使用该账户验证密码。

如果有多个管理员，密码登录默认使用 `created_at` 最早的管理员账户。

## 3. 设置登录回跳地址

在 **Authentication > URL Configuration** 中设置：

- Site URL: `https://henry345683904.github.io/gogoshop/`
- Redirect URLs:
  - `https://henry345683904.github.io/gogoshop/**`
  - `http://127.0.0.1:8769/**`

## 4. Google 登录

1. 打开 [Google Cloud Console](https://console.cloud.google.com/) 并创建或选择一个项目。
2. 打开 **Google Auth Platform > Branding**，填写应用名称、支持邮箱和开发者邮箱。
3. 在 **Audience** 中选择 External；测试阶段把自己的 Google 邮箱加入 Test users。
4. 打开 **Clients > Create client > Web application**。
5. Authorized JavaScript origins 添加：
   - `https://henry345683904.github.io`
   - 本地测试可添加 `http://127.0.0.1:8769`
6. Authorized redirect URIs 添加下面的 Supabase Callback URL。
7. 创建后取得 Client ID 和 Client Secret。
8. 回到 Supabase **Authentication > Providers > Google**，启用 Google，填入 Client ID 和 Client Secret 并保存。

Google Cloud 的 Authorized redirect URI 使用：

`https://ucnkcddhrptqpdlvcohy.supabase.co/auth/v1/callback`

## 5. Apple 登录

Apple 登录需要付费的 Apple Developer 账号。

1. 登录 [Apple Developer](https://developer.apple.com/account/)。
2. 在 **Certificates, Identifiers & Profiles > Identifiers** 创建或选择一个 App ID，并启用 **Sign in with Apple**。
3. 创建一个 **Services ID**，例如 `nz.gogoshop.web`，这就是 Supabase 中使用的 Client ID。
4. 打开该 Services ID 的 **Sign in with Apple > Configure**。
5. Primary App ID 选择上一步的 App ID。
6. Domains and Subdomains 填写 `ucnkcddhrptqpdlvcohy.supabase.co`。
7. Return URLs 填写下面的 Supabase Callback URL并保存。
8. 在 **Keys** 创建新 Key，启用 **Sign in with Apple**，下载 `.p8` 私钥。该文件只能下载一次。
9. 记录 Apple Team ID 和 Key ID。
10. 根据 Supabase Apple Provider 页面要求，用 Services ID、Team ID、Key ID 和 `.p8` 私钥生成/填写 Client Secret。
11. 回到 Supabase **Authentication > Providers > Apple**，启用 Apple 并保存。

Apple 的 Return URL 使用：

`https://ucnkcddhrptqpdlvcohy.supabase.co/auth/v1/callback`

Apple Client Secret 通常最长有效 6 个月，到期前需要重新生成。

不要把 Supabase secret key、service_role key、Google Client Secret 或 Apple 私钥写进网页文件或提交到 GitHub。

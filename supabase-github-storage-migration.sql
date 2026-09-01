-- Run once in Supabase Dashboard > SQL Editor.
-- Converts remaining public Supabase Storage images into GitHub static assets.
begin;
update public.products set image = 'assets/1688/1055370465108/02.webp', images = '["assets/1688/1055370465108/02.webp","assets/supabase/1688-1055370465108/01.png","assets/1688/1055370465108/03.webp","assets/1688/1055370465108/04.webp","assets/1688/1055370465108/05.webp"]'::jsonb, updated_at = now() where id = '1688-1055370465108';
update public.products set image = 'assets/supabase/1688-1058019627153/01.png', images = '["assets/supabase/1688-1058019627153/01.png","assets/1688/1058019627153/02.webp","assets/1688/1058019627153/03.webp","assets/1688/1058019627153/04.webp","assets/1688/1058019627153/05.webp"]'::jsonb, updated_at = now() where id = '1688-1058019627153';
update public.products set image = 'assets/supabase/cil-55001/01.jpg', images = '["assets/supabase/cil-55001/01.jpg"]'::jsonb, updated_at = now() where id = 'cil-55001';
update public.products set image = 'assets/supabase/cil-c4/01.png', images = '["assets/supabase/cil-c4/01.png"]'::jsonb, updated_at = now() where id = 'cil-c4';
commit;

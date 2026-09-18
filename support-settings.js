(() => {
  const defaults = {
    greeting_enabled:true,
    greeting_zh:'您好，欢迎来到 GO GO SHOP！有什么可以帮到您？您可以在这里留言，客服看到后会回复您，也可以通过以下方式联系我们。',
    greeting_en:'Hello, welcome to GO GO SHOP! How can we help you? Leave a message here and our team will reply when available, or contact us using the details below.',
    auto_enabled:false,auto_minutes:30,
    auto_zh:'您好，您的消息已收到！客服会尽快回复您，感谢您的耐心等待。',
    auto_en:'Thanks for your message! Our team will reply as soon as possible. Thank you for your patience.',
    wechat:'GoGoShop_NZ',whatsapp:'',wechat_qr:'',whatsapp_qr:'',social_label:'',social_url:'',social_qr:''
  };
  let settings = {...defaults}, loadedAt = 0, request;
  const esc = value => String(value ?? '').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const safeUrl = value => {try {const u=new URL(value); return u.protocol==='https:' ? u.href : '';} catch (_) {return '';}};
  async function refresh(db,force=false) {
    if (!db) throw new Error('Unavailable');
    if (request) return request;
    if (!force && Date.now()-loadedAt<60000) return settings;
    request=(async()=>{
      const {data,error}=await db.from('support_settings').select('settings').eq('id',true).single();
      if(error) throw error;
      settings={...defaults,...data.settings}; loadedAt=Date.now(); return settings;
    })();
    try {return await request;} finally {request=null;}
  }
  function greeting(lang) {
    const t=(zh,en)=>lang==='zh'?zh:en;
    const s=settings;
    const qr=(url,label)=>safeUrl(url) ? `<a class="support-qr-link" href="${esc(safeUrl(url))}" target="_blank" rel="noopener noreferrer"><img src="${esc(safeUrl(url))}" alt="${esc(label)}" width="144" height="144" loading="lazy"></a>` : '';
    const contacts=[
      s.wechat || s.wechat_qr ? `<div class="support-contact"><strong>WeChat</strong>${s.wechat?`<div>${esc(s.wechat)}</div><button type="button" class="support-older" data-copy-support-wechat>${t('复制微信号','Copy WeChat ID')}</button><span data-support-copy-status role="status"></span>`:''}${qr(s.wechat_qr,t('微信二维码','WeChat QR code'))}</div>`:'',
      s.whatsapp || s.whatsapp_qr ? `<div class="support-contact"><strong>WhatsApp</strong>${/^\+[1-9]\d{6,14}$/.test(s.whatsapp)?`<a href="https://wa.me/${s.whatsapp.slice(1)}" target="_blank" rel="noopener noreferrer">${esc(s.whatsapp)}</a>`:''}${qr(s.whatsapp_qr,'WhatsApp QR code')}</div>`:'',
      safeUrl(s.social_url) || safeUrl(s.social_qr) ? `<div class="support-contact">${safeUrl(s.social_url)?`<a href="${esc(safeUrl(s.social_url))}" target="_blank" rel="noopener noreferrer">${esc(s.social_label || t('其他联系方式','More contact options'))}</a>`:`<strong>${esc(s.social_label || t('其他联系方式','More contact options'))}</strong>`}${qr(s.social_qr,s.social_label || 'QR code')}</div>`:''
    ].join('');
    if(!s.greeting_enabled && !contacts) return '';
    return `<div class="support-message support-greeting"><strong>${t('客服 · 自动问候','Support · Automatic greeting')}</strong>${s.greeting_enabled?`<div>${esc(lang==='zh'?s.greeting_zh:s.greeting_en)}</div>`:''}${contacts}</div>`;
  }
  async function imageBlob(file) {
    if(!['image/png','image/jpeg','image/webp'].includes(file.type) || file.size>5*1024*1024) throw new Error('PNG / JPG / WebP, maximum 5 MB');
    const bitmap=await createImageBitmap(file);
    const ratio=Math.min(1,1600/Math.max(bitmap.width,bitmap.height));
    const canvas=document.createElement('canvas');
    canvas.width=Math.max(1,Math.round(bitmap.width*ratio)); canvas.height=Math.max(1,Math.round(bitmap.height*ratio));
    const ctx=canvas.getContext('2d'); ctx.fillStyle='#fff';ctx.fillRect(0,0,canvas.width,canvas.height);ctx.imageSmoothingEnabled=false;ctx.drawImage(bitmap,0,0,canvas.width,canvas.height);bitmap.close();
    return new Promise((resolve,reject)=>canvas.toBlob(blob=>blob?resolve(blob):reject(new Error('Invalid image')),'image/png'));
  }
  async function mount(host,context,onSaved) {
    if(host.dataset.mounted) return;
    host.dataset.mounted='true';
    const t=(zh,en)=>context.lang==='zh'?zh:en;
    host.innerHTML=`<p role="status">${t('正在加载客服设置…','Loading support settings…')}</p>`;
    try {
      await refresh(context.db,true);
      if(!host.isConnected) return;
      const s=settings;
      const text=(name,label,multi=false)=>`<label>${esc(label)}${multi?`<textarea name="${name}" maxlength="2000" rows="3">${esc(s[name])}</textarea>`:`<input name="${name}" value="${esc(s[name])}" maxlength="${name==='social_url'?2000:100}" ${name==='social_url'?'type="url" placeholder="https://"':name==='whatsapp'?'type="tel" placeholder="+64..." pattern="\\+[1-9][0-9]{6,14}"':'type="text"'}>`}</label>`;
      const toggle=(name,label)=>`<label class="support-setting-toggle"><input type="checkbox" name="${name}" ${s[name]?'checked':''}>${esc(label)}</label>`;
      const upload=(name,label)=>`<div class="support-qr-field"><label>${esc(label)}<input type="file" name="upload_${name}" accept="image/png,image/jpeg,image/webp"></label><input type="hidden" name="${name}" value="${esc(s[name])}"><img data-preview="${name}" alt="${esc(label)}" ${safeUrl(s[name])?`src="${esc(safeUrl(s[name]))}"`:'hidden'} width="144" height="144"><button type="button" class="button ghost" data-remove-qr="${name}">${t('移除二维码','Remove QR code')}</button></div>`;
      host.innerHTML=`<details class="support-settings"><summary>${t('客服设置','Support settings')}</summary><form><fieldset><h3>${t('问候语','Greeting')}</h3>${toggle('greeting_enabled',t('打开聊天框时显示问候语','Show greeting when chat opens'))}<div class="support-settings-grid">${text('greeting_zh','中文',true)}${text('greeting_en','English',true)}</div><h3>${t('自动回复','Automatic reply')}</h3>${toggle('auto_enabled',t('收到客户消息时自动回复','Automatically reply to customer messages'))}<div class="support-settings-grid">${text('auto_zh','中文',true)}${text('auto_en','English',true)}<label>${t('同一客户自动回复间隔（分钟）','Reply interval per customer (minutes)')}<input name="auto_minutes" type="number" min="1" max="1440" step="1" required value="${s.auto_minutes}"></label></div><h3>${t('社交媒体联系方式','Social contacts')}</h3><div class="support-settings-grid">${text('wechat',t('微信号','WeChat ID'))}${text('whatsapp',t('WhatsApp 号码（含国家区号）','WhatsApp number (international format)'))}${text('social_label',t('其他平台名称','Other platform name'))}${text('social_url',t('其他平台 HTTPS 链接','Other platform HTTPS URL'))}</div><div class="support-settings-grid support-qr-grid">${upload('wechat_qr',t('微信二维码','WeChat QR code'))}${upload('whatsapp_qr','WhatsApp QR')}${upload('social_qr',t('其他平台二维码','Other platform QR code'))}</div><button type="submit" class="button">${t('保存并发布','Save and publish')}</button></fieldset><p class="support-settings-status" role="status" aria-live="polite"></p></form></details>`;
      const form=host.querySelector('form'),status=host.querySelector('.support-settings-status');
      const previews=new Map();
      const release=name=>{if(previews.has(name)){URL.revokeObjectURL(previews.get(name));previews.delete(name);}};
      host.querySelectorAll('[data-remove-qr]').forEach(button=>button.onclick=()=>{
        const name=button.dataset.removeQr;release(name);form.elements[name].value='';form.elements['upload_'+name].value='';host.querySelector(`[data-preview="${name}"]`).hidden=true;
      });
      host.querySelectorAll('input[type=file]').forEach(input=>input.onchange=async()=>{
        const name=input.name.replace('upload_','');if(!input.files[0])return;
        try {const blob=await imageBlob(input.files[0]);release(name);const url=URL.createObjectURL(blob);previews.set(name,url);const img=host.querySelector(`[data-preview="${name}"]`);img.src=url;img.hidden=false;status.textContent='';}
        catch(error){input.value='';status.textContent=t('图片无效，请使用 5MB 以内的 PNG、JPG 或 WebP。','Invalid image. Use PNG, JPG or WebP under 5 MB.');}
      });
      form.onsubmit=async event=>{
        event.preventDefault();const fields=form.elements;const payload={};
        for(const key of Object.keys(defaults))payload[key]=typeof defaults[key]==='boolean'?fields[key].checked:typeof defaults[key]==='number'?Number(fields[key].value):fields[key].value.trim();
        if ((payload.greeting_enabled && (!payload.greeting_zh || !payload.greeting_en)) || (payload.auto_enabled && (!payload.auto_zh || !payload.auto_en))) {
          status.textContent=t('启用的问候语和自动回复需要同时填写中文及英文内容。','Enabled greetings and replies require both Chinese and English text.');return;
        }
        if(payload.whatsapp && !/^\+[1-9]\d{6,14}$/.test(payload.whatsapp)){status.textContent=t('请填写包含国家区号的 WhatsApp 号码，例如 +64…','Use an international WhatsApp number such as +64…');return;}
        if(payload.social_url && !safeUrl(payload.social_url)){status.textContent=t('社交链接需要以 https:// 开头','Social links must start with https://');return;}
        fields[0].disabled=true;status.textContent=t('正在保存…','Saving…');
        try {
          for(const name of ['wechat_qr','whatsapp_qr','social_qr']){
            const file=fields['upload_'+name].files[0];if(!file)continue;
            const blob=await imageBlob(file);const path=`qr/${crypto.randomUUID()}.png`;
            const {error}=await context.db.storage.from('support-media').upload(path,blob,{contentType:'image/png',upsert:false});if(error)throw error;
            payload[name]=context.db.storage.from('support-media').getPublicUrl(path).data.publicUrl;
          }
          const {error}=await context.db.rpc('support_save_settings',{p_settings:payload});if(error)throw error;
          settings=payload;loadedAt=Date.now();
          for(const name of ['wechat_qr','whatsapp_qr','social_qr']){release(name);fields[name].value=payload[name];fields['upload_'+name].value='';const img=host.querySelector(`[data-preview="${name}"]`);img.hidden=!payload[name];if(payload[name])img.src=payload[name];}
          status.textContent=t('已保存并发布到客户聊天框。','Saved and published to customer chat.');onSaved?.();
        } catch(error){status.textContent=t('保存失败，修改内容已保留。请检查填写内容并重试。','Save failed. Your changes are preserved. Check the fields and try again.');}
        finally{fields[0].disabled=false;}
      };
    } catch(error){host.dataset.mounted='';host.innerHTML=`<p>${t('客服设置加载失败','Unable to load support settings')}</p><button class="button" type="button">${t('重试','Retry')}</button>`;host.querySelector('button').onclick=()=>mount(host,context,onSaved);}
  }
  window.SupportSettings={refresh,greeting,mount,get current(){return settings;}};
})();

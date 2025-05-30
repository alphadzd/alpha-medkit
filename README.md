# Alpha Medkit

![Alpha Medkit Preview](https://media.discordapp.net/attachments/1374525623015313610/1375271972665294969/image.png)

## وصف
نظام إحياء متقدم للاعبين في FiveM باستخدام إطار عمل QBCore. يتيح للاعبين إحياء اللاعبين الموتى باستخدام حقيبة الإسعافات الأولية.

## المميزات
- نظام إحياء متكامل
- ميني جيم مطلوب للإحياء
- مهلة 60 ثانية للإحياء
- إشعارات متكاملة
- دعم متعدد اللغات

## المتطلبات
- QBCore Framework
- qb-target
- minigames

## التثبيت
1. ضع المجلد في مجلد الموارد الخاص بك
2. أضف `ensure alpha-medkit` إلى ملف server.cfg
3. أضف العنصر إلى `qb-core/shared/items.lua`:
```lua
['medkit'] = {
    ['name'] = 'medkit',
    ['label'] = 'حقيبة إسعاف',
    ['weight'] = 1000,
    ['type'] = 'item',
    ['image'] = 'medkit.png',
    ['unique'] = false,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'حقيبة إسعاف تستخدم لإحياء الأشخاص فاقدي الوعي'
}
```

## الاستخدام
- استخدم حقيبة الإسعاف بالقرب من اللاعب الميت
- أكمل الميني جيم بنجاح
- يجب إكمال العملية خلال 60 ثانية

## حقوق النشر
تم تطوير هذا السكربت بواسطة AlphaDev
جميع الحقوق محفوظة © 2025 
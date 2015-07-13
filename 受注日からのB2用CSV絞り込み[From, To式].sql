(lpad(dtb_order.order_id,8,0) || '_' || lpad(shipping_id,6,0)) AS 'お客様管理番号',
('0') AS '送り状種別',
('0') AS 'クール区分',
NULL AS '伝票番号',
date_format(now(),'%Y/%m/%d') AS '出荷予定日',
date_format(shipping_date,'%Y/%m/%d') AS 'お届け予定(指定)日',
(case when time_id = 1 then '0812' when time_id = 2 then '1214' when time_id = 3 then '1416' when time_id = 4 then '1618' when time_id = 5 then '1820' when time_id = 6 then '2021' else '' end) AS '配達時間帯',
NULL AS 'お届け先コード',
shipping_tel01 || '-' || shipping_tel02 || '-' || shipping_tel03 AS 'お届け先電話番号',
NULL AS 'お届け先電話番号枝番',
shipping_zip01 || '-' || shipping_zip02 AS 'お届け先郵便番号',
(case when CHARACTER_LENGTH(shipping_addr03) > 0 then concat(substring((SELECT mtb_pref.name FROM mtb_pref INNER JOIN dtb_shipping ON mtb_pref.id = dtb_shipping.shipping_pref WHERE dtb_shipping.order_id = dtb_order.order_id) || shipping_addr01 from 1 for 50),' ',shipping_addr02,' ',shipping_addr03) else substring((SELECT mtb_pref.name FROM mtb_pref INNER JOIN dtb_shipping ON mtb_pref.id = dtb_shipping .shipping_pref WHERE dtb_shipping.order_id = dtb_order.order_id) || shipping_addr01 || shipping_addr02 from 1 for 50) end) AS 'お届け先住所',
('') AS 'お届け先住所(アパートマンション名)',
NULL AS 'お届け先会社・部門名1',
NULL AS 'お届け先会社・部門名2',
shipping_name01 || shipping_name02 AS 'お届け先名',
shipping_kana01 || shipping_kana02 AS 'お届け先名略称カナ',
NULL AS '敬称',
NULL AS 'ご依頼主コード',
order_tel01 || '-' || order_tel02 || '-' || order_tel03 AS 'ご依頼主電話番号',
NULL AS 'ご依頼主電話番号枝番',
order_zip01 || '-' || order_zip02 AS 'ご依頼主郵便番号',
(case when CHARACTER_LENGTH(order_addr03) > 0 then concat(substring((SELECT mtb_pref.name FROM mtb_pref INNER JOIN dtb_order ON mtb_pref.id = dtb_order.order_pref WHERE dtb_shipping.order_id = dtb_order.order_id) || order_addr01 from 1 for 50),' ',order_addr02,' ',order_addr03) else substring((SELECT mtb_pref.name FROM mtb_pref INNER JOIN dtb_order ON mtb_pref.id = dtb_order.order_pref WHERE dtb_shipping.order_id = dtb_order.order_id) || order_addr01 || order_addr02 from 1 for 50) end) AS 'ご依頼主住所',
('') AS 'ご依頼主住所(アパートマンション名)',
order_name01 || order_name02 AS 'ご依頼主名',
order_kana01 || order_kana02 AS 'ご依頼主略称カナ',
dtb_products_class.product_code AS '品名コード1',
product_name AS '品名1',
NULL AS '品名コード2',
NULL AS '品名2',
('') AS '荷扱い1',
('') AS '荷扱い2',
NULL AS '記事',
NULL AS 'コレクト代金引換額(税込)',
NULL AS 'コレクト内消費税額等',
('0') AS '営業所止置き',
NULL AS '営業所コード',
('') AS '発行枚数',
quantity AS '個数口枠の印字',
('') AS 'ご請求先顧客コード',
('') AS 'ご請求先分類コード',
('') AS '運賃管理番号',
NULL AS '注文時カード払いデータ登録',
NULL AS '注文時カード払い加盟店番号',
NULL AS '注文時カード払い申込受付番号1',
NULL AS '注文時カード払い申込受付番号2',
NULL AS '注文時カード払い申込受付番号3',
NULL AS 'お届け予定eメール利用区分',
NULL AS 'お届け予定eメールe-mailアドレス',
NULL AS '入力機種',
NULL AS 'お届け予定eメールメッセージ',
NULL AS 'お届け完了eメール利用区分',
NULL AS 'お届け完了eメールe-mailアドレス',
NULL AS 'お届け完了eメールメッセージ',
NULL AS 'クロネコ収納代行利用区分',
NULL AS '収納代行決済QRコード印刷',
NULL AS '収納代行請求金額(税込)',
NULL AS '収納代行内消費税額等',
NULL AS '収納代行請求先郵便番号',
NULL AS '収納代行請求先住所',
NULL AS '収納代行請求先住所(アパートマンション名)',
NULL AS '収納代行請求先会社・部門名1',
NULL AS '収納代行請求先会社・部門名2',
NULL AS '収納代行請求先名(漢字)',
NULL AS '収納代行請求先名(カナ)',
NULL AS '収納代行問合せ先名(漢字)',
NULL AS '収納代行問合せ先郵便番号',
NULL AS '収納代行問合せ先住所',
NULL AS '収納代行問合せ先住所(アパートマンション名)',
NULL AS '収納代行問合せ先電話番号',
NULL AS '収納代行管理番号',
NULL AS '収納代行品名',
NULL AS '収納代行備考',
(case when CHARACTER_LENGTH(GENZAI_EIGYOSYO_NM) > 0 then concat(GENZAI_SITEN_NM,'/',GENZAI_EIGYOSYO_NM) else GENZAI_SITEN_NM end) AS '支店/営業所',
order_item_num AS '商品点数',
round(dtb_order_detail.price * 1.08) AS '単価(税込)',
(dtb_order_detail.quantity * round(dtb_order_detail.price * 1.08)) AS '小計(税込)',
(dtb_order_detail.quantity * dtb_products_class.deliv_fee) AS '送料',
(lpad(dtb_order.order_id,4,0)) AS '注文番号(4桁)',
dtb_order.create_date AS '受注日',
dtb_order.payment_date AS '入金日',
dtb_order.commit_date AS '発送日',
dtb_order.message AS '備考(要望等)',
('') AS '伝票番号',
(case when CHARACTER_LENGTH(classcategory_name1) > 0 then (case when CHARACTER_LENGTH(classcategory_name2) > 0 then classcategory_name1 || '/' || classcategory_name2 else classcategory_name1 end) end) AS '規格名' 
FROM dtb_order,dtb_order_detail,dtb_shipping, dtb_products, dtb_products_class 
WHERE dtb_order.order_id = dtb_order_detail.order_id 
AND dtb_order.order_id = dtb_shipping.order_id 
AND dtb_order.del_flg != 1 
AND dtb_order_detail.product_class_id = dtb_products_class.product_class_id
AND dtb_products.product_id = dtb_products_class.product_id 
AND dtb_order.create_date >= '2015-06-29 00:00:00' 
AND dtb_order.create_date <= '2015-07-01 23:59:59'

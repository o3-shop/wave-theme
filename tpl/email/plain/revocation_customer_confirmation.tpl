[{assign var="shop" value=$oEmailView->getShop()}]
[{oxmultilang ident="EMAIL_SENDDOWNLOADS_GREETING"}] [{$submission->o3revocation__oxname->getRawValue()}],

[{oxmultilang ident="O3_REVOCATION_CUSTOMER_EMAIL_BODY_INTRO"}]

[{oxmultilang ident="O3_REVOCATION_FIELD_NAME_LABEL"}]: [{$submission->o3revocation__oxname->getRawValue()}]
[{oxmultilang ident="O3_REVOCATION_FIELD_ORDERNUMBER_LABEL"}]: [{$submission->o3revocation__oxorderident->getRawValue()}]
[{oxmultilang ident="O3_REVOCATION_ADMIN_FIELD_SUBMITTED"}]: [{$submission->o3revocation__oxsubmitted->value}]

[{oxmultilang ident="O3_REVOCATION_CUSTOMER_EMAIL_BODY_RECEIPT_NOTE"}]

[{oxmultilang ident="O3_REVOCATION_CUSTOMER_EMAIL_BODY_FOOTER"}],
[{$shop->oxshops__oxname->getRawValue()}]

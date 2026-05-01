[{assign var="shop" value=$oEmailView->getShop()}]
[{include file="email/html/header.tpl"
          title="O3_REVOCATION_CUSTOMER_EMAIL_SUBJECT"|oxmultilangassign}]

<p>[{oxmultilang ident="EMAIL_SENDDOWNLOADS_GREETING"}] [{$submission->o3revocation__oxname->getRawValue()|escape:'html'}],</p>

<p>[{oxmultilang ident="O3_REVOCATION_CUSTOMER_EMAIL_BODY_INTRO"}]</p>

<dl>
    <dt><strong>[{oxmultilang ident="O3_REVOCATION_FIELD_NAME_LABEL"}]:</strong></dt>
    <dd>[{$submission->o3revocation__oxname->getRawValue()|escape:'html'}]</dd>

    <dt><strong>[{oxmultilang ident="O3_REVOCATION_FIELD_ORDERNUMBER_LABEL"}]:</strong></dt>
    <dd>[{$submission->o3revocation__oxorderident->getRawValue()|escape:'html'}]</dd>

    <dt><strong>[{oxmultilang ident="O3_REVOCATION_ADMIN_FIELD_SUBMITTED"}]:</strong></dt>
    <dd>[{$submission->o3revocation__oxsubmitted->value}]</dd>
</dl>

<p><em>[{oxmultilang ident="O3_REVOCATION_CUSTOMER_EMAIL_BODY_RECEIPT_NOTE"}]</em></p>

<p>
    [{oxmultilang ident="O3_REVOCATION_CUSTOMER_EMAIL_BODY_FOOTER"}],<br>
    [{$shop->oxshops__oxname->getRawValue()|escape:'html'}]
</p>

[{include file="email/html/footer.tpl"}]

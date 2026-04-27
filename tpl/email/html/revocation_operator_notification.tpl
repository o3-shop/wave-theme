[{assign var="shop" value=$oEmailView->getShop()}]
[{include file="email/html/header.tpl"
          title="O3_REVOCATION_OPERATOR_EMAIL_SUBJECT"|oxmultilangassign}]

<p>[{oxmultilang ident="O3_REVOCATION_OPERATOR_EMAIL_BODY"}]</p>

<dl>
    <dt><strong>[{oxmultilang ident="O3_REVOCATION_ADMIN_FIELD_OXID"}]:</strong></dt>
    <dd><code>[{$submission->getId()|escape:'html'}]</code></dd>

    <dt><strong>[{oxmultilang ident="O3_REVOCATION_ADMIN_FIELD_SUBMITTED"}]:</strong></dt>
    <dd>[{$submission->o3revocation__oxsubmitted->value}]</dd>

    <dt><strong>[{oxmultilang ident="O3_REVOCATION_FIELD_NAME_LABEL"}]:</strong></dt>
    <dd>[{$submission->o3revocation__oxname->getRawValue()|escape:'html'}]</dd>

    <dt><strong>[{oxmultilang ident="O3_REVOCATION_FIELD_ORDERNUMBER_LABEL"}]:</strong></dt>
    <dd>[{$submission->o3revocation__oxorderident->getRawValue()|escape:'html'}]</dd>

    <dt><strong>[{oxmultilang ident="O3_REVOCATION_FIELD_EMAIL_LABEL"}]:</strong></dt>
    <dd>[{$submission->o3revocation__oxemail->getRawValue()|escape:'html'}]</dd>

    [{if $submission->o3revocation__oxfreetext->value}]
        <dt><strong>[{oxmultilang ident="O3_REVOCATION_FIELD_FREETEXT_LABEL"}]:</strong></dt>
        <dd><pre>[{$submission->o3revocation__oxfreetext->getRawValue()|escape:'html'}]</pre></dd>
    [{/if}]
</dl>

[{include file="email/html/footer.tpl"}]

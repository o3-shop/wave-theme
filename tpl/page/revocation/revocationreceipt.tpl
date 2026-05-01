[{capture append="oxidBlock_content"}]

[{* §356a BGB receipt page — generic acknowledgement after a successful submit. *}]
[{* Safe to navigate to directly; no PII is exposed. *}]

<div class="o3-revocation-receipt page-content">
    <div class="container">
        <h1>[{oxmultilang ident="O3_REVOCATION_CONFIRMATION_PAGE_HEADING"}]</h1>
        <p>[{oxmultilang ident="O3_REVOCATION_CUSTOMER_EMAIL_BODY_INTRO"}]</p>
        <p><em>[{oxmultilang ident="O3_REVOCATION_CUSTOMER_EMAIL_BODY_RECEIPT_NOTE"}]</em></p>
    </div>
</div>

[{/capture}]
[{include file="layout/page.tpl"}]

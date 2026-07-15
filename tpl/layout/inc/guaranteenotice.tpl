[{* EU harmonised notice on the legal guarantee of conformity — "Gewährleistungs-  *}]
[{* Label" (Annex I, Implementing Regulation (EU) 2025/1960; issue #219).           *}]
[{*                                                                                 *}]
[{* The notice is FIXED EU artwork whose elements must NOT be edited (Annex I,      *}]
[{* Note 1), so it is rendered as the official per-language image asset — the       *}]
[{* colour version, which is mandatory for online interfaces (Annex I, Note 5).     *}]
[{* Its QR code is baked into the official artwork and points to the EU "Your        *}]
[{* Europe" portal, identical for every trader — nothing here is shop-specific.     *}]
[{*                                                                                 *}]
[{* The operator-editable CMS snippet 'o3_guarantee_notice_info' is rendered BELOW  *}]
[{* the official notice as strictly supplementary editorial text (e.g. a link to    *}]
[{* the shop's own warranty-handling page); it never replaces the official notice   *}]
[{* and renders nothing until the operator activates and fills it.                  *}]
[{*                                                                                 *}]
[{* Per-language artwork ships for de + en. Any other shop language falls back to   *}]
[{* the English notice so a broken image is never shown; the full 24-language set   *}]
[{* is a follow-up (issue #219). The caller guards visibility/placement.            *}]
[{assign var="glNoticeAbbr" value=$oViewConf->getActLanguageAbbr()}]
[{if $glNoticeAbbr != "de" && $glNoticeAbbr != "en"}][{assign var="glNoticeAbbr" value="en"}][{/if}]
<div class="o3-guarantee-notice">
    [{* Inline max-width is a deliberate layout safety net: this legally required *}]
    [{* notice must render at a sane size even if the theme CSS has not been      *}]
    [{* recompiled. Fuller styling lives in build/scss/_guarantee.scss.           *}]
    [{assign var="glNoticeImg" value="lang/guarantee-notice-"|cat:$glNoticeAbbr|cat:".jpg"}]
    <img class="o3-guarantee-notice__label"
         src="[{$oViewConf->getImageUrl($glNoticeImg)}]"
         alt="[{oxmultilang ident="O3_GUARANTEE_NOTICE_HEADING"}]"
         style="max-width:100%;width:420px;height:auto;"
         loading="lazy">
    [{oxifcontent ident="o3_guarantee_notice_info" object="oGuaranteeNotice"}]
        <div class="o3-guarantee-notice__info">[{$oGuaranteeNotice->oxcontents__oxcontent->getRawValue()}]</div>
    [{/oxifcontent}]
</div>

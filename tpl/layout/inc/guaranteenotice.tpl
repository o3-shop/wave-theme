[{* EU legal-guarantee notice (Reg. (EU) 2025/1960 Annex I) - shop-global fixed artwork, issue #219. *}]
[{* Rendered inside the footer "rights" reveal panel (see tpl/widget/footer/services.tpl). *}]
[{* The CMS snippet below is strictly supplementary and must never gate the image. *}]
[{if method_exists($oViewConf, 'getGuaranteeNoticeUrl')}]
    [{assign var="sGuaranteeNoticeUrl" value=$oViewConf->getGuaranteeNoticeUrl()}]
    [{if $sGuaranteeNoticeUrl}]
        <div class="o3-guarantee-notice">
            <a href="[{$sGuaranteeNoticeUrl}]" target="_blank" rel="noopener" class="o3-guarantee-notice__link">
                <img src="[{$sGuaranteeNoticeUrl}]" alt="[{oxmultilang ident="O3_GUARANTEE_NOTICE_IMG_ALT"}]" loading="lazy" class="o3-guarantee-notice__img">
            </a>
            <div class="o3-guarantee-notice__side">
                [{oxifcontent ident="o3_guarantee_notice_info" object="oGuaranteeCont"}]
                    <div class="o3-guarantee-notice__info">[{$oGuaranteeCont->oxcontents__oxcontent->value}]</div>
                [{/oxifcontent}]
                <span class="o3-guarantee-notice__hint">[{oxmultilang ident="O3_GUARANTEE_CLOSE"}]</span>
            </div>
        </div>
    [{/if}]
[{/if}]

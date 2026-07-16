[{* EU durability-guarantee label (Reg. (EU) 2025/1960 Annex II) - per-product, issue #219. *}]
[{* Contract: caller assigns oGuaranteeArticle (and optionally sGuaranteeContext) before including. *}]
[{if $oGuaranteeArticle && method_exists($oViewConf, 'getDurabilityGuaranteeLabelsEnabled') && $oViewConf->getDurabilityGuaranteeLabelsEnabled() && method_exists($oGuaranteeArticle, 'isDurabilityGuaranteeEligible') && $oGuaranteeArticle->isDurabilityGuaranteeEligible()}]
    [{assign var="sGuaranteeLabelUrl" value=$oGuaranteeArticle->getDurabilityGuaranteeLabelUrl()}]
    [{assign var="sGuaranteeGuarantor" value=$oGuaranteeArticle->getGuaranteeGuarantor()}]
    <div class="o3-guarantee-label [{$sGuaranteeContext}]">
        [{if $sGuaranteeLabelUrl}]
            <img src="[{$sGuaranteeLabelUrl}]" alt="[{oxmultilang ident="O3_GUARANTEE_LABEL_IMG_ALT"}]" loading="lazy" class="o3-guarantee-label__img">
        [{elseif $sGuaranteeGuarantor}]
            <p class="o3-guarantee-label__fallback">
                [{oxmultilang ident="O3_GUARANTEE_LABEL_FALLBACK_DURATION" args=$oGuaranteeArticle->getGuaranteeYears()}]
                ([{oxmultilang ident="O3_GUARANTEE_LABEL_FALLBACK_GUARANTOR" args=$sGuaranteeGuarantor}]).
                [{oxmultilang ident="O3_GUARANTEE_LABEL_FALLBACK_NOTE"}]
                [{oxmultilang ident="O3_GUARANTEE_LEGAL_REMINDER"}]
            </p>
        [{/if}]
        [{assign var="sGuaranteeConditions" value=$oGuaranteeArticle->getGuaranteeConditions()}]
        [{if $sGuaranteeConditions}]
            <details class="o3-guarantee-label__conditions">
                <summary>[{oxmultilang ident="O3_GUARANTEE_CONDITIONS_HEADING"}]</summary>
                <div>[{$sGuaranteeConditions|escape:"html"|nl2br}]</div>
            </details>
        [{/if}]
        [{assign var="sGuaranteeContext" value=""}]
    </div>
[{/if}]

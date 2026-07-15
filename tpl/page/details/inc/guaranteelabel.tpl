[{* EU harmonised durability-guarantee label (EmpCo Directive (EU) 2024/825,   *}]
[{* Implementing Regulation (EU) 2025/1960; issue #219). Renders the producer- *}]
[{* communicated durability guarantee for a single article passed in as        *}]
[{* $guaranteeProduct. The caller is responsible for having already checked    *}]
[{* the shop-level master switch and per-article eligibility.                  *}]
[{assign var="guaranteeMonths" value=$guaranteeProduct->getGuaranteeDurationMonths()}]
[{assign var="guaranteeGuarantor" value=$guaranteeProduct->getGuaranteeGuarantor()}]
[{assign var="guaranteeConditions" value=$guaranteeProduct->getGuaranteeConditions()}]
<div class="o3-guarantee-label">
    <span class="o3-guarantee-label__heading">[{oxmultilang ident="O3_GUARANTEE_LABEL_HEADING"}]</span>
    <span class="o3-guarantee-label__value">
        [{if $guaranteeMonths mod 12 == 0}]
            [{math equation="m/12" m=$guaranteeMonths}]&nbsp;[{oxmultilang ident="O3_GUARANTEE_LABEL_DURATION_SUFFIX"}]
        [{else}]
            [{$guaranteeMonths}]&nbsp;[{oxmultilang ident="O3_GUARANTEE_LABEL_DURATION_SUFFIX_MONTHS"}]
        [{/if}]
        [{if $guaranteeGuarantor}]&ndash; [{$guaranteeGuarantor}][{/if}]
    </span>
    [{if $guaranteeConditions}]
        <span class="o3-guarantee-label__conditions">[{oxmultilang ident="O3_GUARANTEE_LABEL_CONDITIONS_LABEL" suffix="COLON"}] [{$guaranteeConditions}]</span>
    [{/if}]
</div>

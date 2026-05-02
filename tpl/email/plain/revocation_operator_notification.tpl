[{oxmultilang ident="O3_REVOCATION_OPERATOR_EMAIL_BODY"}]

[{oxmultilang ident="O3_REVOCATION_ADMIN_FIELD_OXID"}]: [{$submission->getId()}]
[{oxmultilang ident="O3_REVOCATION_ADMIN_FIELD_SUBMITTED"}]: [{$submission->o3revocation__oxsubmitted->value}]
[{oxmultilang ident="O3_REVOCATION_FIELD_NAME_LABEL"}]: [{$submission->o3revocation__oxname->getRawValue()}]
[{oxmultilang ident="O3_REVOCATION_FIELD_ORDERNUMBER_LABEL"}]: [{$submission->o3revocation__oxorderident->getRawValue()}]
[{oxmultilang ident="O3_REVOCATION_FIELD_EMAIL_LABEL"}]: [{$submission->o3revocation__oxemail->getRawValue()}]
[{if $submission->o3revocation__oxfreetext->value}]
[{oxmultilang ident="O3_REVOCATION_FIELD_FREETEXT_LABEL"}]:
[{$submission->o3revocation__oxfreetext->getRawValue()}]
[{/if}]

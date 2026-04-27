[{capture append="oxidBlock_content"}]

[{* §356a BGB electronic revocation form (issue #99). *}]
[{* Markup conforms to the spec's "Form markup contract": single <form>, *}]
[{* type=email + required on the email field, label-for binding, *}]
[{* aria-required + visible required marker on mandatory fields, *}]
[{* aria-describedby linking field to error on rejection, single submit button. *}]

<div class="o3-revocation page-content">
    <div class="container">

        <h1>[{oxmultilang ident="O3_REVOCATION_FORM_HEADING"}]</h1>

        [{* Operator notice block — rendered above the form via {oxifcontent}. *}]
        [{* Rendered ONLY when the snippet is active and non-empty for the *}]
        [{* current language (the {oxifcontent} block short-circuits otherwise). *}]
        [{oxifcontent ident="o3_revocation_notice" object="oCont"}]
            <div class="o3-revocation-notice">
                [{$oCont->oxcontents__oxcontent->getRawValue()}]
            </div>
        [{/oxifcontent}]

        [{assign var="errors" value=$oView->getValidationErrors()}]

        <form id="o3-revocation-form"
              class="o3-revocation-form"
              method="post"
              action="[{$oViewConf->getSelfActionLink()}]"
              novalidate>
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="cl" value="revocation">
            <input type="hidden" name="fnc" value="submit">

            [{* Name *}]
            <div class="form-group [{if $errors.o3rev_name}]has-error[{/if}]">
                <label for="o3rev_name">
                    [{oxmultilang ident="O3_REVOCATION_FIELD_NAME_LABEL"}]
                    <span class="o3-required-marker" aria-hidden="true">*</span>
                </label>
                <input type="text"
                       id="o3rev_name"
                       name="o3rev_name"
                       class="form-control"
                       value="[{$oView->getName()|escape:'html'}]"
                       required
                       aria-required="true"
                       [{if $errors.o3rev_name}]aria-invalid="true" aria-describedby="o3rev_name_err"[{/if}]>
                [{if $errors.o3rev_name}]
                    <span id="o3rev_name_err" class="form-error">[{oxmultilang ident=$errors.o3rev_name}]</span>
                [{/if}]
            </div>

            [{* Order identification *}]
            <div class="form-group [{if $errors.o3rev_orderident}]has-error[{/if}]">
                <label for="o3rev_orderident">
                    [{oxmultilang ident="O3_REVOCATION_FIELD_ORDERNUMBER_LABEL"}]
                    <span class="o3-required-marker" aria-hidden="true">*</span>
                </label>
                <input type="text"
                       id="o3rev_orderident"
                       name="o3rev_orderident"
                       class="form-control"
                       value="[{$oView->getOrderIdent()|escape:'html'}]"
                       required
                       aria-required="true"
                       [{if $errors.o3rev_orderident}]aria-invalid="true" aria-describedby="o3rev_orderident_err"[{/if}]>
                [{if $errors.o3rev_orderident}]
                    <span id="o3rev_orderident_err" class="form-error">[{oxmultilang ident=$errors.o3rev_orderident}]</span>
                [{/if}]
            </div>

            [{* Email — type=email triggers email-style mobile keyboards *}]
            [{* and HTML5 client-side hint; server still runs FILTER_VALIDATE_EMAIL. *}]
            <div class="form-group [{if $errors.o3rev_email}]has-error[{/if}]">
                <label for="o3rev_email">
                    [{oxmultilang ident="O3_REVOCATION_FIELD_EMAIL_LABEL"}]
                    <span class="o3-required-marker" aria-hidden="true">*</span>
                </label>
                <input type="email"
                       id="o3rev_email"
                       name="o3rev_email"
                       class="form-control"
                       value="[{$oView->getEmail()|escape:'html'}]"
                       required
                       aria-required="true"
                       [{if $errors.o3rev_email}]aria-invalid="true" aria-describedby="o3rev_email_err"[{/if}]>
                [{if $errors.o3rev_email}]
                    <span id="o3rev_email_err" class="form-error">[{oxmultilang ident=$errors.o3rev_email}]</span>
                [{/if}]
            </div>

            [{* Free text — optional, NOT required, NO required marker. *}]
            <div class="form-group">
                <label for="o3rev_freetext">
                    [{oxmultilang ident="O3_REVOCATION_FIELD_FREETEXT_LABEL"}]
                </label>
                <textarea id="o3rev_freetext"
                          name="o3rev_freetext"
                          class="form-control"
                          rows="4">[{$oView->getFreeText()|escape:'html'}]</textarea>
            </div>

            [{* Form-level error (token expired, anti-spam reject). *}]
            [{if $errors.form}]
                <div class="form-error" role="alert">[{oxmultilang ident=$errors.form}]</div>
            [{/if}]

            [{* Single submit button — labelled "Widerruf bestätigen". *}]
            [{* Clicking it IS the legally-effective declaration per § 356a Abs. 3. *}]
            <div class="form-group form-actions">
                <button type="submit" class="btn btn-primary o3-revocation-submit">
                    [{oxmultilang ident="O3_REVOCATION_CONFIRM_BUTTON"}]
                </button>
            </div>
        </form>
    </div>
</div>

[{/capture}]
[{include file="layout/page.tpl"}]

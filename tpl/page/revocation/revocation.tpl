[{capture append="oxidBlock_content"}]

[{* §356a BGB electronic revocation form (issue #99). *}]
[{* Markup conforms to the spec's "Form markup contract": single <form>, *}]
[{* type=email + required on the email field, label-for binding, *}]
[{* aria-required on mandatory fields (`req` class on label adds the visible *}]
[{* asterisk via wave CSS), aria-describedby linking field to error on *}]
[{* rejection, single submit button. *}]

[{* Wire jqBootstrapValidation on every input/textarea so live client-side *}]
[{* feedback (invalid-icon overlay, red helper text) matches the contact *}]
[{* form's pattern. Server-side validation still runs unconditionally. *}]
[{oxscript add="$('#o3-revocation-form input, #o3-revocation-form textarea').not('[type=submit]').jqBootstrapValidation();"}]

<div class="o3-revocation page-content">
    <div class="container">

        <h1>[{oxmultilang ident="O3_REVOCATION_FORM_HEADING"}]</h1>

        [{* Operator notice block — rendered above the form via {oxifcontent}. *}]
        [{* Rendered ONLY when the snippet is active and non-empty for the *}]
        [{* current language ({oxifcontent} short-circuits otherwise). The mb-4 *}]
        [{* utility lives on the div itself, so spacing only appears when there *}]
        [{* is something to space — empty notice = no div = no extra gap. *}]
        [{oxifcontent ident="o3_revocation_notice" object="oCont"}]
            <div class="o3-revocation-notice mt-3 mb-4">
                [{$oCont->oxcontents__oxcontent->getRawValue()}]
            </div>
        [{/oxifcontent}]

        [{assign var="errors" value=$oView->getValidationErrors()}]

        <form id="o3-revocation-form"
              class="o3-revocation-form"
              method="post"
              action="[{$oViewConf->getSelfActionLink()}]"
              role="form"
              novalidate="novalidate">
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="cl" value="revocation">
            <input type="hidden" name="fnc" value="submit">

            [{* Each field wraps the input in a `.controls` div so *}]
            [{* jqBootstrapValidation can append its `.help-block` message *}]
            [{* element there (jqBootstrapValidation.js:98 hard-codes the *}]
            [{* selector `$controlGroup.find('.controls')`). Without it, the *}]
            [{* invalid-state class lands on the form-group but the message *}]
            [{* itself has no place to render. *}]

            [{* Name *}]
            <div class="form-group[{if $errors.o3rev_name}] oxInValid[{/if}]">
                <label class="req control-label" for="o3rev_name">
                    [{oxmultilang ident="O3_REVOCATION_FIELD_NAME_LABEL"}]
                </label>
                <div class="controls">
                    <input type="text"
                           id="o3rev_name"
                           name="o3rev_name"
                           class="form-control"
                           value="[{$oView->getName()|escape:'html'}]"
                           required="required"
                           aria-required="true"
                           data-validation-required-message="[{oxmultilang ident="O3_REVOCATION_VALIDATION_REQUIRED"}]"
                           [{if $errors.o3rev_name}]aria-invalid="true" aria-describedby="o3rev_name_err"[{/if}]>
                    [{if $errors.o3rev_name}]
                        <div id="o3rev_name_err" class="alert alert-danger">[{oxmultilang ident=$errors.o3rev_name}]</div>
                    [{/if}]
                </div>
            </div>

            [{* Order identification *}]
            <div class="form-group[{if $errors.o3rev_orderident}] oxInValid[{/if}]">
                <label class="req control-label" for="o3rev_orderident">
                    [{oxmultilang ident="O3_REVOCATION_FIELD_ORDERNUMBER_LABEL"}]
                </label>
                <div class="controls">
                    <input type="text"
                           id="o3rev_orderident"
                           name="o3rev_orderident"
                           class="form-control"
                           value="[{$oView->getOrderIdent()|escape:'html'}]"
                           required="required"
                           aria-required="true"
                           data-validation-required-message="[{oxmultilang ident="O3_REVOCATION_VALIDATION_REQUIRED"}]"
                           [{if $errors.o3rev_orderident}]aria-invalid="true" aria-describedby="o3rev_orderident_err"[{/if}]>
                    [{if $errors.o3rev_orderident}]
                        <div id="o3rev_orderident_err" class="alert alert-danger">[{oxmultilang ident=$errors.o3rev_orderident}]</div>
                    [{/if}]
                </div>
            </div>

            [{* Email — type=email triggers email-style mobile keyboards *}]
            [{* and HTML5 client-side hint; server still runs FILTER_VALIDATE_EMAIL. *}]
            <div class="form-group[{if $errors.o3rev_email}] oxInValid[{/if}]">
                <label class="req control-label" for="o3rev_email">
                    [{oxmultilang ident="O3_REVOCATION_FIELD_EMAIL_LABEL"}]
                </label>
                <div class="controls">
                    <input type="email"
                           id="o3rev_email"
                           name="o3rev_email"
                           class="form-control"
                           value="[{$oView->getEmail()|escape:'html'}]"
                           required="required"
                           aria-required="true"
                           data-validation-required-message="[{oxmultilang ident="O3_REVOCATION_VALIDATION_REQUIRED"}]"
                           data-validation-email-message="[{oxmultilang ident="O3_REVOCATION_VALIDATION_EMAIL_FORMAT"}]"
                           [{if $errors.o3rev_email}]aria-invalid="true" aria-describedby="o3rev_email_err"[{/if}]>
                    [{if $errors.o3rev_email}]
                        <div id="o3rev_email_err" class="alert alert-danger">[{oxmultilang ident=$errors.o3rev_email}]</div>
                    [{/if}]
                </div>
            </div>

            [{* Free text — optional, NOT required, NO required marker. *}]
            <div class="form-group">
                <label class="control-label" for="o3rev_freetext">
                    [{oxmultilang ident="O3_REVOCATION_FIELD_FREETEXT_LABEL"}]
                </label>
                <div class="controls">
                    <textarea id="o3rev_freetext"
                              name="o3rev_freetext"
                              class="form-control"
                              rows="4">[{$oView->getFreeText()|escape:'html'}]</textarea>
                </div>
            </div>

            [{* Form-level error (token expired, anti-spam reject). *}]
            [{if $errors.form}]
                <div class="alert alert-danger" role="alert">[{oxmultilang ident=$errors.form}]</div>
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

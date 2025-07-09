<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
        <#if section="header">
            ${msg("textForgotPwd")}
            <#elseif section="form">
                <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="username" class="${properties.kcLabelClass!}">
                                <#if !realm.loginWithEmailAllowed>
                                    ${msg("username")}
                                    <#elseif !realm.registrationEmailAsUsername>
                                        ${msg("labelUsername")}
                                        <#else>
                                            ${msg("email")}
                                </#if>
                            </label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>false</#if>" dir="ltr" />
                            <#if messagesPerField.existsError('username')>
                                <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${msg("alertMessageForgotPwd")}
                                </span>
                            </#if>
                        </div>
                    </div>
                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <span><a href="${url.loginUrl}">
                                        ${kcSanitize(msg("backtoLogin"))?no_esc}
                                    </a></span>
                            </div>
                        </div>
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <input id="kc-form-button" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("submitMessage")}" />
                        </div>
                    </div>
                </form>
                <#elseif section="info">
                    <#if realm.duplicateEmailsAllowed>
                        <img src="${url.resourcesPath}/img/Info-circle.svg" alt="Info" width="20" style="margin-right: 8px; vertical-align: middle;" />
                        ${msg("emailInstructionUsername")}
                        <#else>
                            <img src="${url.resourcesPath}/img/Info-circle.svg" alt="Info" width="20" style="margin-right: 8px; vertical-align: middle;" />
                            ${msg("resetPwdMessage")}
                    </#if>
        </#if>
    </@layout.registrationLayout>
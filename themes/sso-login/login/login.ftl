c<#import "template.ftl" as layout>
    <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
        <#if section="header">
            <#-- ${msg("loginAccountTitle")} -->
                <div id="kc-header" class="login-pf-page-header">
                    <div id="kc-header-wrapper" class="">
                        <div id="kc-page-title">
                            ${msg("textForm")}
                        </div>
                    </div>
                </div>
                <br />
                <#elseif section="form">
                    <div id="kc-form">
                        <div id="kc-form-wrapper">
                            <#if realm.password>
                                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                    <#if !usernameHidden??>
                                        <div class="${properties.kcFormGroupClass!}">
                                            <label for="username" class="${properties.kcLabelClass!}">
                                                <#if !realm.loginWithEmailAllowed>
                                                    ${msg("username")}
                                                    <#elseif !realm.registrationEmailAsUsername>
                                                        ${msg("labelUsername")}
                                                        <#else>
                                                            ${msg("email")}
                                                </#if>
                                            </label>
                                            <input tabindex="2" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="username"
                                                aria-invalid="<#if messagesPerField.existsError('username','password')>false</#if>"
                                                dir="ltr" />
                                            <#if messagesPerField.existsError('username','password')>
                                                <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                    ${msg("alertMessage")}
                                                </span>
                                            </#if>
                                        </div>
                                    </#if>
                                    <div class="${properties.kcFormGroupClass!}" style="position: relative;">
                                        <label for="password" class="${properties.kcLabelClass!}">
                                            ${msg("password")}
                                        </label>
                                        <div class="${properties.kcInputGroup!}" dir="ltr" style="position: relative;">
                                            <input
                                                tabindex="3"
                                                id="password"
                                                class="${properties.kcInputClass!}"
                                                name="password"
                                                type="password"
                                                autocomplete="current-password"
                                                aria-invalid="<#if messagesPerField.existsError('username','password')>false</#if>"
                                                style="padding-right: 40px;" />
                                            <span>
                                                <img
                                                    id="show-icon"
                                                    src="${url.resourcesPath}/img/Show.svg"
                                                    alt="Mostrar contraseña"
                                                    style="position: absolute; top: 50%; right: 12px; transform: translateY(-50%); width: 20px; cursor: pointer;" />
                                                <img
                                                    id="hide-icon"
                                                    src="${url.resourcesPath}/img/Hide.svg"
                                                    alt="Ocultar contraseña"
                                                    style="display: none; position: absolute; top: 50%; right: 12px; transform: translateY(-50%); width: 20px; cursor: pointer;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                        <div id="kc-form-options">
                                            <#if realm.rememberMe && !usernameHidden??>
                                                <div class="checkbox">
                                                    <label>
                                                        <#if login.rememberMe??>
                                                            <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                                            ${msg("rememberMe")}
                                                            <#else>
                                                                <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox">
                                                                ${msg("rememberMe")}
                                                        </#if>
                                                    </label>
                                                </div>
                                            </#if>
                                        </div>
                                        <div id="kc-form-reset-psw" class="${properties.kcFormOptionsWrapperClass!}">
                                            <#if realm.resetPasswordAllowed>
                                                <span><a tabindex="6" href="${url.loginResetCredentialsUrl}">
                                                        ${msg("textForgotPwd")}
                                                    </a></span>
                                            </#if>
                                        </div>
                                    </div>
                                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                                        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"
                            </#if>/>
                            <input id="kc-form-button" tabindex="7" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}" />
                        </div>
                        <button id="kc-form-button-microsoft" tabindex="7"
                            class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                            name="login" type="submit">
                            <i class="fa fa-windows" aria-hidden="true" style="margin-right: 8px;"></i>
                            ${msg("doLogIn2")}
                        </button>
                        <#-- <input id="kc-form-button-microsoft" tabindex="7" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn2")}" /> -->
                        </form>
        </#if>
        </div>
        </div>
        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
        <#elseif section="info">
            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div id="kc-registration-container">
                    <div id="kc-registration">
                        <span>
                            ${msg("noAccount")}
                            <a tabindex="8"
                                href="${url.registrationUrl}">
                                ${msg("doRegister")}
                            </a></span>
                    </div>
                </div>
            </#if>
            <#elseif section="socialProviders">
                <#if realm.password && social?? && social.providers?has_content>
                    <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                        <hr />
                        <h2>
                            ${msg("identity-provider-login-label")}
                        </h2>
                        <ul class="${properties.kcFormSocialAccountListClass!}
<#if social.providers?size gt 3>
${properties.kcFormSocialAccountListGridClass!}
</#if>">
                            <#list social.providers as p>
                                <li>
                                    <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!}
<#if social.providers?size gt 3>
${properties.kcFormSocialAccountGridItem!}
</#if>"
                                        type="button" href="${p.loginUrl}">
                                        <#if p.iconClasses?has_content>
                                            <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                            <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">
                                                ${p.displayName!}
                                            </span>
                                            <#else>
                                                <span class="${properties.kcFormSocialAccountNameClass!}">
                                                    ${p.displayName!}
                                                </span>
                                        </#if>
                                    </a>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </#if>
                </#if>
    </@layout.registrationLayout>
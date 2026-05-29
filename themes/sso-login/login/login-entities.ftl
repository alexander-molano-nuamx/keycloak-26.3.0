c<#import "template.ftl" as layout>
    <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
        <#if section="header">
            ${msg("textForm")}
            <#elseif section="form">
                <div id="kc-form">
                    <div id="kc-form-wrapper">
                        <#if realm.password>
                            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                <div class="${properties.kcFormEntitiesAccountListButtonClass!}">
                                    <div class="${properties.kcFormEntitiesAccountLLogoClass!}">
                                    </div>
                                    <div>
                                        <div class="${properties.kcFormEntitiesAccountHeaderClass!}">
                                            <div class="${properties.kcFormEntitiesAccountSubtitleClass!}">
                                                ${msg("companyName")}
                                            </div>
                                            <span class="${properties.kcFormEntitiesAccountTagClass!}">
                                                ${msg("countryEntitie")}
                                            </span>
                                        </div>
                                        <p class="${properties.kcFormEntitiesAccountSubtitleClass!}">
                                            ${msg("entitieRol")}
                                        </p>
                                    </div>
                                </div>
                    </div>
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
                </#if>
    </@layout.registrationLayout>
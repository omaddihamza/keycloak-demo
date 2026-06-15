<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${msg("loginAccountTitle")}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>
<div class="login-wrapper">

    <div class="login-card">

        <!-- Logo / Header -->
        <div class="login-header">
            <#if realm.displayNameHtml??>
                <div class="realm-name">${realm.displayNameHtml?no_esc}</div>
            <#else>
                <div class="realm-name">${realm.displayName!}</div>
            </#if>
            <h2>${msg("loginAccountTitle")}</h2>
        </div>

        <!-- Alerts -->
        <#if message?has_content>
            <div class="alert alert-${message.type}">
                <#if message.type = "success"><span class="icon">✓</span></#if>
                <#if message.type = "warning"><span class="icon">⚠</span></#if>
                <#if message.type = "error"><span class="icon">✕</span></#if>
                <#if message.type = "info"><span class="icon">ℹ</span></#if>
                <span class="message-text">${kcSanitize(message.summary)?no_esc}</span>
            </div>
        </#if>

        <!-- Login Form -->
        <#if realm.password>
            <form id="kc-form-login"
                  onsubmit="document.getElementById('kc-login').disabled = true; return true;"
                  action="${url.loginAction}"
                  method="post">

                <div class="form-group">
                    <label for="username">
                        <#if !realm.loginWithEmailAllowed>
                            ${msg("username")}
                        <#elseif !realm.registrationEmailAsUsername>
                            ${msg("usernameOrEmail")}
                        <#else>
                            ${msg("email")}
                        </#if>
                    </label>
                    <input
                            id="username"
                            name="username"
                            type="text"
                            value="${(login.username!'')}"
                            autofocus
                            autocomplete="username"
                            placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"
                    />
                </div>

                <div class="form-group">
                    <label for="password">${msg("password")}</label>
                    <input
                            id="password"
                            name="password"
                            type="password"
                            autocomplete="current-password"
                            placeholder="${msg("password")}"
                    />
                </div>

                <!-- Remember me -->
                <#if realm.rememberMe && !usernameEditDisabled??>
                    <div class="form-group remember-me">
                        <label>
                            <input type="checkbox" name="rememberMe"
                                   <#if login.rememberMe??>checked</#if>
                            />
                            ${msg("rememberMe")}
                        </label>
                    </div>
                </#if>

                <!-- Forgot password -->
                <#if realm.resetPasswordAllowed>
                    <div class="forgot-password">
                        <a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                    </div>
                </#if>

                <input type="hidden" id="id-hidden-input" name="credentialId"
                       <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>
                />

                <button type="submit" id="kc-login" class="btn-login">
                    ${msg("doLogIn")}
                </button>

            </form>
        </#if>

        <!-- Social / Identity Providers -->
<#--        <#if social.providers??>-->
<#--            <div class="social-divider"><span>${msg("identity-provider-login-label")}</span></div>-->
<#--            <div class="social-providers">-->
<#--                <#list social.providers as p>-->
<#--                    <a href="${p.loginUrl}" class="social-btn social-${p.alias}">-->
<#--                        ${p.displayName!}-->
<#--                    </a>-->
<#--                </#list>-->
<#--            </div>-->
<#--        </#if>-->

        <!-- Register link -->
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div class="register-link">
                ${msg("noAccount")}
                <a href="${url.registrationUrl}">${msg("doRegister")}</a>
            </div>
        </#if>

    </div>
</div>
</body>
</html>
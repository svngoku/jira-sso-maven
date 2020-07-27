import org.apache.log4j.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.atlassian.seraph.auth.AuthenticatorException;
import com.atlassian.jira.web.session.currentusers.JiraUserSession;
import com.atlassian.jira.security.login.JiraSeraphAuthenticator;
import org.apereo.cas.authentication.*
import org.apereo.cas.authentication.credential.*
import org.apereo.cas.authentication.metadata.*
import com.atlassian.crowd.model.authentication.UserAuthenticationContext
import javax.security.auth.login.*

class SSOController {

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = getParams(request).get("login");
        String password = getParams(request).get("pass");
        LoginService loginService = ComponentAccessor.getComponent(LoginService.class);
        ApplicationUser user = ComponentAccessor.getUserUtil().getUserByName(getParams(request).get("login"));
        Map > String, Object >  context = getContextForAuth(request);
        if (user == null) {
            context.put("auth_msg", "User with name " + getParams(request).get("login") + " not found");
            renderAuthorizationView(context, response);
            return;
        }
        loginService.resetFailedLoginCount(user.getDirectoryUser());
        LoginResult loginResult = loginService.authenticate(user.getDirectoryUser(), getParams(request).get("pass"));
        switch (loginResult.getReason()) {
            case OK:
                try {
                    String jiraServerAddress = request.getScheme() + "://" + request.getLocalName() + ":" + request.getLocalPort();
                    sentAuthRequestToLoginJsp(jiraServerAddress, username, password, response);
                } catch (Exception e) {
                    context.put("auth_msg", "System error");
                    renderAuthorizationView(context, response);
                    return;
                }
                redirectAfterSuccessLogin(user.getName(), response);
                break;
            case AUTHENTICATED_FAILED:
            case AUTHENTICATION_DENIED:
            case AUTHORISATION_FAILED:
                context.put("auth_msg", "Auth failed:  " + loginResult.getReason());
                break;
        }
    }

    private void sentAuthRequestToLoginJsp(String jiraServerAddress, String username, String password, HttpServletResponse response) throws IOException {
        HttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(jiraServerAddress + String.format("/jira/login.jsp?os_username=%s&amp;os_password=%s", username, password));
        post.setHeader("Content-Type", "text/plain");
        HttpResponse jspResponse = client.execute(post);
        if (jspResponse.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
            throw new IOException("login.jsp response http code isnt ok: " + jspResponse.getStatusLine().getStatusCode());
        }
        HeaderIterator hIt = jspResponse.headerIterator();
        while (hIt.hasNext()) {
            Header next = hIt.nextHeader();
            response.addHeader(next.getName(), next.getValue());
        }
    }


    private void checkLoginResponse(final ClientResponse response) {
        if (m_log.isDebugEnabled())
            appendLogfile("Service Anywhere Adapter Login Response: " + response.getStatusCode())
        if (response.getStatusCode() == 200) {
            m_LWSSO_COOKIE = response.getEntity(String.class)
            lwossoCookie = new Cookie(LWSSO_COOKIE_KEY, m_LWSSO_COOKIE)
            if (m_log.isDebugEnabled())
                appendDebugLogfile(m_LWSSO_COOKIE)
        }
        checkResponse(response)
    }
}
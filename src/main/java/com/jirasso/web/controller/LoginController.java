import com.atlassian.jira.rest.client.api.domain.Project;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class LoginController {
    @RequestMapping("/test")
    public String index() {
        return "Greetings from Spring Boot!";
    }
}
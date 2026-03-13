import org.apache.catalina.startup.Tomcat;
import java.io.File;

public class Main {
    public static void main(String[] args) throws Exception {
        String webappDirLocation = "webapp";
        Tomcat tomcat = new Tomcat();

        // 포트 설정 (기본 8080)
        String port = System.getProperty("PORT");
        if (port == null || port.isEmpty()) {
            port = "8080";
        }
        tomcat.setPort(Integer.parseInt(port));
        tomcat.getConnector();

        // Webapp 경로 설정
        // 현재 디렉토리 기준으로 webapp 폴더를 찾습니다.
        tomcat.addWebapp("/", new File(webappDirLocation).getAbsolutePath());

        System.out.println("Tomcat starting on port " + port);

        tomcat.start();
        tomcat.getServer().await();
    }
}
import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import config.AppConfig;

import java.io.File;

public class Main {
    public static void main(String[] args) throws LifecycleException {
        String webappDirLocation = "webapp";
        Tomcat tomcat = new Tomcat();

        String port = System.getProperty("PORT");
        if (port == null || port.isEmpty()) {
            port = "8080";
        }
        tomcat.setPort(Integer.parseInt(port));
        tomcat.getConnector();

        // addWebapp을 사용하여 JSP 엔진 등 기본 서블릿을 활성화합니다.
        Context context = tomcat.addWebapp("", new File(webappDirLocation).getAbsolutePath());

        // Spring Web Application Context 설정
        AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();
        appContext.register(AppConfig.class);

        // DispatcherServlet 생성 및 등록
        DispatcherServlet dispatcherServlet = new DispatcherServlet(appContext);
        
        // DispatcherServlet을 등록합니다.
        // loadOnStartup을 1로 설정하여 초기화 시점에 로딩되도록 합니다.
        org.apache.catalina.Wrapper dispatcherWrapper = Tomcat.addServlet(context, "dispatcher", dispatcherServlet);
        dispatcherWrapper.setLoadOnStartup(1);
        
        // 모든 요청을 DispatcherServlet으로 보냅니다.
        dispatcherWrapper.addMapping("/");

        System.out.println("Tomcat starting on port " + port);

        tomcat.start();
        tomcat.getServer().await();
    }
}
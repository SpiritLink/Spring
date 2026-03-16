package config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"controller", "service"})
@MapperScan("mapper") // Mapper 인터페이스 패키지 스캔
public class AppConfig implements WebMvcConfigurer {

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
        
        // Oracle 19c/21c 등 최신 버전에서는 SID(:XE)가 아닌 Service Name(/ORCLCDB 등)을 사용하는 것이 일반적입니다.
        // IntelliJ 데이터베이스 도구에서 연결한 방식과 동일하게 맞추기 위해 
        // URL 형식을 Service Name 방식으로 변경하거나, 로컬 환경의 서비스 이름(예: orcl, ORCLCDB, XE)으로 변경해야 합니다.
        // 현재 ORA-12505는 "XE"라는 SID를 찾지 못했다는 뜻이므로, 
        // IntelliJ에 연결된 설정(대부분 포트 뒤에 /XE 또는 /ORCLCDB 로 연결됨)과 일치하도록 변경합니다.
        
        // 만약 Docker 등으로 띄웠을 경우 /ORCLCDB 또는 /XE 일 확률이 높습니다.
        dataSource.setUrl("jdbc:oracle:thin:@//localhost:1521/FREEPDB1");

        dataSource.setUsername("DUMMY");
        dataSource.setPassword("1q2w3e4r");
        return dataSource;
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        return sessionFactory.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
package service;

import org.springframework.stereotype.Service;
import vo.Page1;

@Service
public class IndexService {
    
    public String getGreeting() {
        return "Hello from Service!";
    }

    public Page1 getPage1Info() {
        // 비즈니스 로직 처리 후 VO 반환
        return new Page1("Title from Service", 100);
    }
}
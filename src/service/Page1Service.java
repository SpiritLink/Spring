package service;

import mapper.Page1Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class Page1Service {

    private final Page1Mapper page1Mapper;

    @Autowired
    public Page1Service(Page1Mapper page1Mapper) {
        this.page1Mapper = page1Mapper;
    }

    public boolean isDbConnected() {
        try {
            // 연결 확인용 쿼리
            Integer result = page1Mapper.testConnection();
            return result != null && result == 1;
        } catch (Exception e) {
            System.err.println("DB 연결 실패 (MyBatis): " + e.getMessage());
            return false;
        }
    }

    public Map<String, Object> getDummyData() {
        Map<String, Object> result = new HashMap<>();
        try {
            // DUMMY_TABLE_01 테이블 데이터 조회 시도
            result = page1Mapper.getDummyData();
            if (result == null) {
                result = new HashMap<>();
            }
        } catch (Exception e) {
            System.err.println("데이터 조회 실패 또는 테이블 없음 (MyBatis): " + e.getMessage());
            // 예외 발생 시 빈 데이터 반환
            result.put("num", null);
            result.put("title", null);
        }
        return result;
    }
}
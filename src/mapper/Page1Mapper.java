package mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import vo.Page1;

import java.util.List;
import java.util.Map;

@Mapper
public interface Page1Mapper {

    @Select("SELECT 1 FROM DUAL")
    Integer testConnection();

    @Select("SELECT KEY_ID AS num, KEY_VALUE AS title FROM DUMMY.DUMMY_TABLE_01 WHERE ROWNUM = 1")
    Map<String, Object> getDummyData();

    @Select("SELECT KEY_ID AS num, KEY_VALUE AS title FROM DUMMY.DUMMY_TABLE_01 ORDER BY KEY_ID ASC")
    List<Map<String, Object>> getAllDummyData();
}
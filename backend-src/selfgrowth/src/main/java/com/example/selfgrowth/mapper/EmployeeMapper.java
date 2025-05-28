
package com.example.selfgrowth.mapper;

import com.example.selfgrowth.model.Employee;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface EmployeeMapper {

    @Select("SELECT * FROM employee WHERE id = #{id}")
    Employee findById(Long id);

    @Select("SELECT * FROM employee")
    List<Employee> findAll();

    @Insert("INSERT INTO employee(name, email, hire_date, site_id) VALUES(#{name}, #{email}, #{hireDate}, #{siteId})")
    void insert(Employee employee);

    @Update("UPDATE employee SET name=#{name}, email=#{email}, hire_date=#{hireDate}, site_id=#{siteId} WHERE id=#{id}")
    void update(Employee employee);

    @Delete("DELETE FROM employee WHERE id = #{id}")
    void delete(Long id);
}

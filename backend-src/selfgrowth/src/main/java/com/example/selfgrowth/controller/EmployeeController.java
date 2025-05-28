
package com.example.selfgrowth.controller;

import com.example.selfgrowth.mapper.EmployeeMapper;
import com.example.selfgrowth.model.Employee;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/employees")
public class EmployeeController {

    private final EmployeeMapper employeeMapper;

    public EmployeeController(EmployeeMapper employeeMapper) {
        this.employeeMapper = employeeMapper;
    }

    @GetMapping
    public List<Employee> getAll() {
        return employeeMapper.findAll();
    }

    @GetMapping("/{id}")
    public Employee getById(@PathVariable Long id) {
        return employeeMapper.findById(id);
    }

    @PostMapping
    public void create(@RequestBody Employee employee) {
        employeeMapper.insert(employee);
    }

    @PutMapping("/{id}")
    public void update(@PathVariable Long id, @RequestBody Employee employee) {
        employee.setId(id);
        employeeMapper.update(employee);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        employeeMapper.delete(id);
    }
}
